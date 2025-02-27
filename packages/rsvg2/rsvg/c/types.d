module rsvg.c.types;

public import gid.basictypes;
public import glib.c.types;
public import gobject.c.types;
public import gdkpixbuf.c.types;
public import gio.c.types;
public import cairo.c.types;

/**
 * An enumeration representing possible errors
 */
enum RsvgError
{
  /**
   * the request failed
   */
  Failed = 0,
}

/**
 * Configuration flags for an [Rsvg.Handle].  Note that not all of [Rsvg.Handle]'s
 * constructors let you specify flags.  For this reason, [Rsvg.Handle.newFromGfileSync]
 * and [Rsvg.Handle.newFromStreamSync] are the preferred ways to create a handle.
 */
enum RsvgHandleFlags : uint
{
  /**
   * No flags are set.
   */
  FlagsNone = 0,

  /**
   * Disable safety limits in the XML parser.  Libxml2 has
   * [several limits](https://gitlab.gnome.org/GNOME/libxml2/blob/master/include/libxml/parserInternals.h)
   * designed to keep malicious XML content from consuming too much memory while parsing.
   * For security reasons, this should only be used for trusted input!  Since: 2.40.3
   */
  FlagUnlimited = 1,

  /**
   * Use this if the Cairo surface to which you are
   * rendering is a PDF, PostScript, SVG, or Win32 Printing surface.  This will make librsvg
   * and Cairo use the original, compressed data for images in the final output, instead of
   * passing uncompressed images.  For example, this will make the a resulting PDF file
   * smaller and faster.  Please see [the Cairo
   * documentation]$(LPAREN)https://www.cairographics.org/manual/cairo-cairo-surface-t.html#cairo-surface-set-mime-data$(RPAREN)
   * for details.
   */
  FlagKeepImageData = 2,
}

/**
 * Units for the `RsvgLength` struct.  These have the same meaning as [CSS length
 * units]$(LPAREN)https://www.w3.org/TR/CSS21/syndata.html#length-units$(RPAREN).
 */
enum RsvgUnit
{
  /**
   * percentage values; where <literal>1.0</literal> means 100%.
   */
  Percent = 0,

  /**
   * pixels
   */
  Px = 1,

  /**
   * em, or the current font size
   */
  Em = 2,

  /**
   * x-height of the current font
   */
  Ex = 3,

  /**
   * inches
   */
  In = 4,

  /**
   * centimeters
   */
  Cm = 5,

  /**
   * millimeters
   */
  Mm = 6,

  /**
   * points, or 1/72 inch
   */
  Pt = 7,

  /**
   * picas, or 1/6 inch $(LPAREN)12 points$(RPAREN)
   */
  Pc = 8,
}

/**
 * Dimensions of an SVG image from [Rsvg.Handle.getDimensions], or an
 * individual element from [Rsvg.Handle.getDimensionsSub].  Please see
 * the deprecation documentation for those functions.

 * Deprecated: Use [Rsvg.Handle.getIntrinsicSizeInPixels] or
 *   [Rsvg.Handle.getGeometryForLayer] instead.
 */
struct RsvgDimensionData
{
  /**
   * SVG's width, in pixels
   */
  int width;

  /**
   * SVG's height, in pixels
   */
  int height;

  /**
   * SVG's original width, unmodified by `RsvgSizeFunc`
   */
  double em;

  /**
   * SVG's original height, unmodified by `RsvgSizeFunc`
   */
  double ex;
}

/**
 * [Rsvg.Handle] loads an SVG document into memory.
 * This is the main entry point into the librsvg library.  An [Rsvg.Handle] is an
 * object that represents SVG data in memory.  Your program creates an
 * [Rsvg.Handle] from an SVG file, or from a memory buffer that contains SVG data,
 * or in the most general form, from a `GInputStream` that will provide SVG data.
 * Librsvg can load SVG images and render them to Cairo surfaces,
 * using a mixture of SVG's [static mode] and [secure static mode].
 * Librsvg does not do animation nor scripting, and can load
 * references to external data only in some situations; see below.
 * Librsvg supports reading [SVG 1.1](https://www.w3.org/TR/SVG11/) data, and is gradually
 * adding support for features in [SVG 2](https://www.w3.org/TR/SVG2/).  Librsvg also
 * supports SVGZ files, which are just an SVG stream compressed with the GZIP algorithm.
 * [static mode]: https://www.w3.org/TR/SVG2/conform.html#static-mode
 * [secure static mode]: https://www.w3.org/TR/SVG2/conform.html#secure-static-mode
 * # The "base file" and resolving references to external files
 * When you load an SVG, librsvg needs to know the location of the "base file"
 * for it.  This is so that librsvg can determine the location of referenced
 * entities.  For example, say you have an SVG in `/foo/bar/foo.svg`
 * and that it has an image element like this:
 * ```
 * <image href\="resources/foo.png" .../>
 * ```
 * In this case, librsvg needs to know the location of the toplevel
 * `/foo/bar/foo.svg` so that it can generate the appropriate
 * reference to `/foo/bar/resources/foo.png`.
 * ## Security and locations of referenced files
 * When processing an SVG, librsvg will only load referenced files if they are
 * in the same directory as the base file, or in a subdirectory of it.  That is,
 * if the base file is `/foo/bar/baz.svg`, then librsvg will
 * only try to load referenced files $(LPAREN)from SVG's
 * `<image>` element, for example, or from content
 * included through XML entities$(RPAREN) if those files are in `/foo/bar/<anything>` or in `/foo/bar/<anything>\/.../<anything>`.
 * This is so that malicious SVG files cannot include files that are in a directory above.
 * The full set of rules for deciding which URLs may be loaded is as follows;
 * they are applied in order.  A referenced URL will not be loaded as soon as
 * one of these rules fails:
 * 1. All `data:` URLs may be loaded.  These are sometimes used
 * to include raster image data, encoded as base-64, directly in an SVG file.
 * 2. URLs with queries $(LPAREN)"?"$(RPAREN) or fragment identifiers $(LPAREN)"#"$(RPAREN) are not allowed.
 * 3. All URL schemes other than data: in references require a base URL.  For
 * example, this means that if you load an SVG with
 * [Rsvg.Handle.newFromData] without calling [Rsvg.Handle.setBaseUri],
 * then any referenced files will not be allowed $(LPAREN)e.g. raster images to be
 * loaded from other files will not work$(RPAREN).
 * 4. If referenced URLs are absolute, rather than relative, then they must
 * have the same scheme as the base URL.  For example, if the base URL has a
 * `file` scheme, then all URL references inside the SVG must
 * also have the `file` scheme, or be relative references which
 * will be resolved against the base URL.
 * 5. If referenced URLs have a `resource` scheme, that is,
 * if they are included into your binary program with GLib's resource
 * mechanism, they are allowed to be loaded $(LPAREN)provided that the base URL is
 * also a `resource`, per the previous rule$(RPAREN).
 * 6. Otherwise, non-`file` schemes are not allowed.  For
 * example, librsvg will not load `http` resources, to keep
 * malicious SVG data from "phoning home".
 * 7. A relative URL must resolve to the same directory as the base URL, or to
 * one of its subdirectories.  Librsvg will canonicalize filenames, by
 * removing ".." path components and resolving symbolic links, to decide whether
 * files meet these conditions.
 * # Loading an SVG with GIO
 * This is the easiest and most resource-efficient way of loading SVG data into
 * an [Rsvg.Handle].
 * If you have a `GFile` that stands for an SVG file, you can simply call
 * [Rsvg.Handle.newFromGfileSync] to load an [Rsvg.Handle] from it.
 * Alternatively, if you have a `GInputStream`, you can use
 * [Rsvg.Handle.newFromStreamSync].
 * Both of those methods allow specifying a `GCancellable`, so the loading
 * process can be cancelled from another thread.
 * ## Loading an SVG from memory
 * If you already have SVG data in a byte buffer in memory, you can create a
 * memory input stream with [Gio.MemoryInputStream.newFromData] and feed that
 * to [Rsvg.Handle.newFromStreamSync].
 * Note that in this case, it is important that you specify the base_file for
 * the in-memory SVG data.  Librsvg uses the base_file to resolve links to
 * external content, like raster images.
 * # Loading an SVG without GIO
 * You can load an [Rsvg.Handle] from a simple filename or URI with
 * [Rsvg.Handle.newFromFile].  Note that this is a blocking operation; there
 * is no way to cancel it if loading a remote URI takes a long time.  Also, note that
 * this method does not let you specify [Rsvg.HandleFlags].
 * Otherwise, loading an SVG without GIO is not recommended, since librsvg will
 * need to buffer your entire data internally before actually being able to
 * parse it.  The deprecated way of doing this is by creating a handle with
 * [Rsvg.Handle.new_] or [Rsvg.Handle.newWithFlags], and then using
 * [Rsvg.Handle.write] and [Rsvg.Handle.close] to feed the handle with SVG data.
 * Still, please try to use the GIO stream functions instead.
 * # Resolution of the rendered image $(LPAREN)dots per inch, or DPI$(RPAREN)
 * SVG images can contain dimensions like "`5cm`" or
 * "`2pt`" that must be converted from physical units into
 * device units.  To do this, librsvg needs to know the actual dots per inch
 * $(LPAREN)DPI$(RPAREN) of your target device.  You can call [Rsvg.Handle.setDpi] or
 * [Rsvg.Handle.setDpiXY] on an [Rsvg.Handle] to set the DPI before rendering
 * it.
 * # Rendering
 * The preferred way to render a whole SVG document is to use
 * [Rsvg.Handle.renderDocument].  Please see its documentation for
 * details.
 * # API ordering
 * Due to the way the librsvg API evolved over time, an [Rsvg.Handle] object is available
 * for use as soon as it is constructed.  However, not all of its methods can be
 * called at any time.  For example, an [Rsvg.Handle] just constructed with [Rsvg.Handle.new_]
 * is not loaded yet, and it does not make sense to call [Rsvg.Handle.renderDocument] on it
 * just at that point.
 * The documentation for the available methods in [Rsvg.Handle] may mention that a particular
 * method is only callable on a "fully loaded handle".  This means either:
 * * The handle was loaded with [Rsvg.Handle.write] and [Rsvg.Handle.close], and
 * those functions returned no errors.
 * * The handle was loaded with [Rsvg.Handle.readStreamSync] and that function
 * returned no errors.
 * Before librsvg 2.46, the library did not fully verify that a handle was in a
 * fully loaded state for the methods that require it.  To preserve
 * compatibility with old code which inadvertently called the API without
 * checking for errors, or which called some methods outside of the expected
 * order, librsvg will just emit a `g_critical$(LPAREN)$(RPAREN)` message in those cases.
 * New methods introduced in librsvg 2.46 and later will check for the correct
 * ordering, and panic if they are called out of order.  This will abort
 * the program as if it had a failed assertion.
 */
struct RsvgHandle
{
  ObjectC parent;

  void*[16] AbiPadding;
}

/**
 * Class structure for [Rsvg.Handle].
 */
struct RsvgHandleClass
{
  /**
   * parent class
   */
  GObjectClass parent;

  void*[15] AbiPadding;
}

/**
 * `RsvgLength` values are used in [Rsvg.Handle.getIntrinsicDimensions], for
 * example, to return the CSS length values of the `width` and
 * `height` attributes of an `<svg>` element.
 * This is equivalent to [CSS lengths](https://www.w3.org/TR/CSS21/syndata.html#length-units).
 * It is up to the calling application to convert lengths in non-pixel units
 * $(LPAREN)i.e. those where the @unit field is not `RSVG_UNIT_PX`$(RPAREN) into something
 * meaningful to the application.  For example, if your application knows the
 * dots-per-inch $(LPAREN)DPI$(RPAREN) it is using, it can convert lengths with @unit in
 * `RSVG_UNIT_IN` or other physical units.
 */
struct RsvgLength
{
  /**
   * numeric part of the length
   */
  double length;

  /**
   * unit part of the length
   */
  RsvgUnit unit;
}

/**
 * Position of an SVG fragment from [Rsvg.Handle.getPositionSub].  Please
 * the deprecation documentation for that function.

 * Deprecated: Use [Rsvg.Handle.getGeometryForLayer] instead.
 */
struct RsvgPositionData
{
  /**
   * position on the x axis
   */
  int x;

  /**
   * position on the y axis
   */
  int y;
}

/**
 * A data structure for holding a rectangle.
 */
struct RsvgRectangle
{
  /**
   * X coordinate of the left side of the rectangle
   */
  double x;

  /**
   * Y coordinate of the the top side of the rectangle
   */
  double y;

  /**
   * width of the rectangle
   */
  double width;

  /**
   * height of the rectangle
   */
  double height;
}

alias extern(C) void function(int* width, int* height, void* userData) RsvgSizeFunc;

