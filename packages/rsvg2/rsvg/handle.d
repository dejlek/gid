module rsvg.handle;

import cairo.context;
import gdkpixbuf.pixbuf;
import gid.global;
import gio.cancellable;
import gio.file;
import gio.file_mixin;
import gio.input_stream;
import glib.error;
import gobject.object;
import rsvg.c.functions;
import rsvg.c.types;
import rsvg.types;

/**
 * [rsvg.handle.Handle] loads an SVG document into memory.
 * This is the main entry point into the librsvg library.  An [rsvg.handle.Handle] is an
 * object that represents SVG data in memory.  Your program creates an
 * [rsvg.handle.Handle] from an SVG file, or from a memory buffer that contains SVG data,
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
 * [rsvg.handle.Handle.newFromData] without calling [rsvg.handle.Handle.setBaseUri],
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
 * an [rsvg.handle.Handle].
 * If you have a `GFile` that stands for an SVG file, you can simply call
 * [rsvg.handle.Handle.newFromGfileSync] to load an [rsvg.handle.Handle] from it.
 * Alternatively, if you have a `GInputStream`, you can use
 * [rsvg.handle.Handle.newFromStreamSync].
 * Both of those methods allow specifying a `GCancellable`, so the loading
 * process can be cancelled from another thread.
 * ## Loading an SVG from memory
 * If you already have SVG data in a byte buffer in memory, you can create a
 * memory input stream with [gio.memory_input_stream.MemoryInputStream.newFromData] and feed that
 * to [rsvg.handle.Handle.newFromStreamSync].
 * Note that in this case, it is important that you specify the base_file for
 * the in-memory SVG data.  Librsvg uses the base_file to resolve links to
 * external content, like raster images.
 * # Loading an SVG without GIO
 * You can load an [rsvg.handle.Handle] from a simple filename or URI with
 * [rsvg.handle.Handle.newFromFile].  Note that this is a blocking operation; there
 * is no way to cancel it if loading a remote URI takes a long time.  Also, note that
 * this method does not let you specify [rsvg.HandleFlags].
 * Otherwise, loading an SVG without GIO is not recommended, since librsvg will
 * need to buffer your entire data internally before actually being able to
 * parse it.  The deprecated way of doing this is by creating a handle with
 * [rsvg.handle.Handle.new_] or [rsvg.handle.Handle.newWithFlags], and then using
 * [rsvg.handle.Handle.write] and [rsvg.handle.Handle.close] to feed the handle with SVG data.
 * Still, please try to use the GIO stream functions instead.
 * # Resolution of the rendered image $(LPAREN)dots per inch, or DPI$(RPAREN)
 * SVG images can contain dimensions like "`5cm`" or
 * "`2pt`" that must be converted from physical units into
 * device units.  To do this, librsvg needs to know the actual dots per inch
 * $(LPAREN)DPI$(RPAREN) of your target device.  You can call [rsvg.handle.Handle.setDpi] or
 * [rsvg.handle.Handle.setDpiXY] on an [rsvg.handle.Handle] to set the DPI before rendering
 * it.
 * # Rendering
 * The preferred way to render a whole SVG document is to use
 * [rsvg.handle.Handle.renderDocument].  Please see its documentation for
 * details.
 * # API ordering
 * Due to the way the librsvg API evolved over time, an [rsvg.handle.Handle] object is available
 * for use as soon as it is constructed.  However, not all of its methods can be
 * called at any time.  For example, an [rsvg.handle.Handle] just constructed with [rsvg.handle.Handle.new_]
 * is not loaded yet, and it does not make sense to call [rsvg.handle.Handle.renderDocument] on it
 * just at that point.
 * The documentation for the available methods in [rsvg.handle.Handle] may mention that a particular
 * method is only callable on a "fully loaded handle".  This means either:
 * * The handle was loaded with [rsvg.handle.Handle.write] and [rsvg.handle.Handle.close], and
 * those functions returned no errors.
 * * The handle was loaded with [rsvg.handle.Handle.readStreamSync] and that function
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
class Handle : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())rsvg_handle_get_type != &gidSymbolNotFound ? rsvg_handle_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Returns a new rsvg handle.  Must be freed with [gobject.object.ObjectG.unref].  This
   * handle can be used to load an image.
   * The preferred way of loading SVG data into the returned [rsvg.handle.Handle] is with
   * [rsvg.handle.Handle.readStreamSync].
   * The deprecated way of loading SVG data is with [rsvg.handle.Handle.write] and
   * [rsvg.handle.Handle.close]; note that these require buffering the entire file
   * internally, and for this reason it is better to use the stream functions:
   * [rsvg.handle.Handle.newFromStreamSync], [rsvg.handle.Handle.readStreamSync], or
   * [rsvg.handle.Handle.newFromGfileSync].
   * After loading the [rsvg.handle.Handle] with data, you can render it using Cairo or get
   * a GdkPixbuf from it. When finished, free the handle with [gobject.object.ObjectG.unref]. No
   * more than one image can be loaded with one handle.
   * Note that this function creates an [rsvg.handle.Handle] with no flags set.  If you
   * require any of [rsvg.HandleFlags] to be set, use any of
   * [rsvg.handle.Handle.newWithFlags], [rsvg.handle.Handle.newFromStreamSync], or
   * [rsvg.handle.Handle.newFromGfileSync].
   * Returns: A new [rsvg.handle.Handle] with no flags set.
   */
  this()
  {
    RsvgHandle* _cretval;
    _cretval = rsvg_handle_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Loads the SVG specified by data.  Note that this function creates an
   * [rsvg.handle.Handle] without a base URL, and without any [rsvg.HandleFlags].  If you
   * need these, use [rsvg.handle.Handle.newFromStreamSync] instead by creating
   * a [gio.memory_input_stream.MemoryInputStream] from your data.
   * Params:
   *   data = The SVG data
   * Returns: A [rsvg.handle.Handle] or `NULL` if an error occurs.
   */
  static Handle newFromData(ubyte[] data)
  {
    RsvgHandle* _cretval;
    size_t _dataLen;
    if (data)
      _dataLen = cast(size_t)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    GError *_err;
    _cretval = rsvg_handle_new_from_data(_data, _dataLen, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Handle(cast(RsvgHandle*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Loads the SVG specified by file_name.  Note that this function, like
   * [rsvg.handle.Handle.new_], does not specify any loading flags for the resulting
   * handle.  If you require the use of [rsvg.HandleFlags], use
   * [rsvg.handle.Handle.newFromGfileSync].
   * Params:
   *   filename = The file name to load, or a URI.
   * Returns: A [rsvg.handle.Handle] or `NULL` if an error occurs.
   */
  static Handle newFromFile(string filename)
  {
    RsvgHandle* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _cretval = rsvg_handle_new_from_file(_filename, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Handle(cast(RsvgHandle*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Creates a new [rsvg.handle.Handle] for file.
   * This function sets the "base file" of the handle to be file itself, so SVG
   * elements like `<image>` which reference external
   * resources will be resolved relative to the location of file.
   * If cancellable is not `NULL`, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the
   * operation was cancelled, the error `G_IO_ERROR_CANCELLED` will be
   * returned in error.
   * Params:
   *   file = a `GFile`
   *   flags = flags from [rsvg.HandleFlags]
   *   cancellable = a `GCancellable`, or `NULL`
   * Returns: a new [rsvg.handle.Handle] on success, or `NULL` with error filled in
   */
  static Handle newFromGfileSync(File file, HandleFlags flags, Cancellable cancellable)
  {
    RsvgHandle* _cretval;
    GError *_err;
    _cretval = rsvg_handle_new_from_gfile_sync(file ? cast(GFile*)(cast(ObjectG)file).cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Handle(cast(RsvgHandle*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Creates a new [rsvg.handle.Handle] for stream.
   * This function sets the "base file" of the handle to be base_file if
   * provided.  SVG elements like `<image>` which reference
   * external resources will be resolved relative to the location of base_file.
   * If cancellable is not `NULL`, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the
   * operation was cancelled, the error `G_IO_ERROR_CANCELLED` will be
   * returned in error.
   * Params:
   *   inputStream = a `GInputStream`
   *   baseFile = a `GFile`, or `NULL`
   *   flags = flags from [rsvg.HandleFlags]
   *   cancellable = a `GCancellable`, or `NULL`
   * Returns: a new [rsvg.handle.Handle] on success, or `NULL` with error filled in
   */
  static Handle newFromStreamSync(InputStream inputStream, File baseFile, HandleFlags flags, Cancellable cancellable)
  {
    RsvgHandle* _cretval;
    GError *_err;
    _cretval = rsvg_handle_new_from_stream_sync(inputStream ? cast(GInputStream*)inputStream.cPtr(No.Dup) : null, baseFile ? cast(GFile*)(cast(ObjectG)baseFile).cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Handle(cast(RsvgHandle*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Creates a new [rsvg.handle.Handle] with flags flags.  After calling this function,
   * you can feed the resulting handle with SVG data by using
   * [rsvg.handle.Handle.readStreamSync].
   * Params:
   *   flags = flags from [rsvg.HandleFlags]
   * Returns: a new [rsvg.handle.Handle]
   */
  static Handle newWithFlags(HandleFlags flags)
  {
    RsvgHandle* _cretval;
    _cretval = rsvg_handle_new_with_flags(flags);
    auto _retval = ObjectG.getDObject!Handle(cast(RsvgHandle*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * This is used after calling [rsvg.handle.Handle.write] to indicate that there is no more data
   * to consume, and to start the actual parsing of the SVG document.  The only reason to
   * call this function is if you use use [rsvg.handle.Handle.write] to feed data into the handle;
   * if you use the other methods like [rsvg.handle.Handle.newFromFile] or
   * [rsvg.handle.Handle.readStreamSync], then you do not need to call this function.
   * This will return `TRUE` if the loader closed successfully and the
   * SVG data was parsed correctly.  Note that handle isn't freed until
   * [gobject.object.ObjectG.unref] is called.
   * Returns: `TRUE` on success, or `FALSE` on error.

   * Deprecated: Use [rsvg.handle.Handle.readStreamSync] or the constructor
   *   functions [rsvg.handle.Handle.newFromGfileSync] or
   *   [rsvg.handle.Handle.newFromStreamSync].  See the deprecation notes for
   *   [rsvg.handle.Handle.write] for more information.
   */
  bool close()
  {
    bool _retval;
    GError *_err;
    _retval = rsvg_handle_close(cast(RsvgHandle*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Gets the base uri for this [rsvg.handle.Handle].
   * Returns: the base uri, possibly null
   */
  string getBaseUri()
  {
    const(char)* _cretval;
    _cretval = rsvg_handle_get_base_uri(cast(RsvgHandle*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  string getDesc()
  {
    const(char)* _cretval;
    _cretval = rsvg_handle_get_desc(cast(RsvgHandle*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Get the SVG's size. Do not call from within the size_func callback, because
   * an infinite loop will occur.
   * This function depends on the [rsvg.handle.Handle]'s DPI to compute dimensions in
   * pixels, so you should call [rsvg.handle.Handle.setDpi] beforehand.
   * Params:
   *   dimensionData = A place to store the SVG's size

   * Deprecated: Use [rsvg.handle.Handle.getIntrinsicSizeInPixels] instead.  This
   *   function is deprecated because it is not able to return exact fractional dimensions,
   *   only integer pixels.
   */
  void getDimensions(out DimensionData dimensionData)
  {
    rsvg_handle_get_dimensions(cast(RsvgHandle*)cPtr, &dimensionData);
  }

  /**
   * Get the size of a subelement of the SVG file. Do not call from within the
   * size_func callback, because an infinite loop will occur.
   * This function depends on the [rsvg.handle.Handle]'s DPI to compute dimensions in
   * pixels, so you should call [rsvg.handle.Handle.setDpi] beforehand.
   * Element IDs should look like an URL fragment identifier; for example, pass
   * `#foo` $(LPAREN)hash `foo`$(RPAREN) to get the geometry of the element that
   * has an `id\="foo"` attribute.
   * Params:
   *   dimensionData = A place to store the SVG's size
   *   id = An element's id within the SVG, starting with "#" $(LPAREN)a single
   *     hash character$(RPAREN), for example, `#layer1`.  This notation corresponds to a
   *     URL's fragment ID.  Alternatively, pass `NULL` to use the whole SVG.
   * Returns: `TRUE` if the dimensions could be obtained, `FALSE` if there was an error.

   * Deprecated: Use [rsvg.handle.Handle.getGeometryForLayer] instead.
   */
  bool getDimensionsSub(out DimensionData dimensionData, string id)
  {
    bool _retval;
    const(char)* _id = id.toCString(No.Alloc);
    _retval = rsvg_handle_get_dimensions_sub(cast(RsvgHandle*)cPtr, &dimensionData, _id);
    return _retval;
  }

  /**
   * Computes the ink rectangle and logical rectangle of a single SVG element.
   * While `rsvg_handle_get_geometry_for_layer` computes the geometry of an SVG element subtree with
   * its transformation matrix, this other function will compute the element's geometry
   * as if it were being rendered under an identity transformation by itself.  That is,
   * the resulting geometry is as if the element got extracted by itself from the SVG.
   * This function is the counterpart to `rsvg_handle_render_element`.
   * Element IDs should look like an URL fragment identifier; for example, pass
   * `#foo` $(LPAREN)hash `foo`$(RPAREN) to get the geometry of the element that
   * has an `id\="foo"` attribute.
   * The "ink rectangle" is the bounding box that would be painted
   * for fully- stroked and filled elements.
   * The "logical rectangle" just takes into account the unstroked
   * paths and text outlines.
   * Note that these bounds are not minimum bounds; for example,
   * clipping paths are not taken into account.
   * You can pass `NULL` for the id if you want to measure all
   * the elements in the SVG, i.e. to measure everything from the
   * root element.
   * This operation is not constant-time, as it involves going through all
   * the child elements.
   * Params:
   *   id = An element's id within the SVG, starting with "#" $(LPAREN)a single
   *     hash character$(RPAREN), for example, `#layer1`.  This notation corresponds to a
   *     URL's fragment ID.  Alternatively, pass `NULL` to compute the geometry for the
   *     whole SVG.
   *   outInkRect = Place to store the ink rectangle of the element.
   *   outLogicalRect = Place to store the logical rectangle of the element.
   * Returns: `TRUE` if the geometry could be obtained, or `FALSE` on error.  Errors
   *   are returned in the error argument.
   *   API ordering: This function must be called on a fully-loaded handle.  See
   *   the section "[API ordering](class.Handle.html#api-ordering)" for details.
   *   Panics: this function will panic if the handle is not fully-loaded.
   */
  bool getGeometryForElement(string id, out Rectangle outInkRect, out Rectangle outLogicalRect)
  {
    bool _retval;
    const(char)* _id = id.toCString(No.Alloc);
    GError *_err;
    _retval = rsvg_handle_get_geometry_for_element(cast(RsvgHandle*)cPtr, _id, &outInkRect, &outLogicalRect, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Computes the ink rectangle and logical rectangle of an SVG element, or the
   * whole SVG, as if the whole SVG were rendered to a specific viewport.
   * Element IDs should look like an URL fragment identifier; for example, pass
   * `#foo` $(LPAREN)hash `foo`$(RPAREN) to get the geometry of the element that
   * has an `id\="foo"` attribute.
   * The "ink rectangle" is the bounding box that would be painted
   * for fully-stroked and filled elements.
   * The "logical rectangle" just takes into account the unstroked
   * paths and text outlines.
   * Note that these bounds are not minimum bounds; for example,
   * clipping paths are not taken into account.
   * You can pass `NULL` for the id if you want to measure all
   * the elements in the SVG, i.e. to measure everything from the
   * root element.
   * This operation is not constant-time, as it involves going through all
   * the child elements.
   * Params:
   *   id = An element's id within the SVG, starting with "#" $(LPAREN)a single
   *     hash character$(RPAREN), for example, `#layer1`.  This notation corresponds to a
   *     URL's fragment ID.  Alternatively, pass `NULL` to compute the geometry for the
   *     whole SVG.
   *   viewport = Viewport size at which the whole SVG would be fitted.
   *   outInkRect = Place to store the ink rectangle of the element.
   *   outLogicalRect = Place to store the logical rectangle of the element.
   * Returns: `TRUE` if the geometry could be obtained, or `FALSE` on error.  Errors
   *   are returned in the error argument.
   *   API ordering: This function must be called on a fully-loaded handle.  See
   *   the section "[API ordering](class.Handle.html#api-ordering)" for details.
   *   Panics: this function will panic if the handle is not fully-loaded.
   */
  bool getGeometryForLayer(string id, Rectangle viewport, out Rectangle outInkRect, out Rectangle outLogicalRect)
  {
    bool _retval;
    const(char)* _id = id.toCString(No.Alloc);
    GError *_err;
    _retval = rsvg_handle_get_geometry_for_layer(cast(RsvgHandle*)cPtr, _id, &viewport, &outInkRect, &outLogicalRect, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * In simple terms, queries the `width`, `height`, and `viewBox` attributes in an SVG document.
   * If you are calling this function to compute a scaling factor to render the SVG,
   * consider simply using [rsvg.handle.Handle.renderDocument] instead; it will do the
   * scaling computations automatically.
   * Before librsvg 2.54.0, the `out_has_width` and `out_has_height` arguments would be set to true or false
   * depending on whether the SVG document actually had `width` and `height` attributes, respectively.
   * However, since librsvg 2.54.0, `width` and `height` are now [geometry
   * properties]$(LPAREN)https://www.w3.org/TR/SVG2/geometry.html$(RPAREN) per the SVG2 specification; they
   * are not plain attributes.  SVG2 made it so that the initial value of those properties
   * is `auto`, which is equivalent to specifing a value of `100%`.  In this sense, even SVG
   * documents which lack `width` or `height` attributes semantically have to make them
   * default to `100%`.  This is why since librsvg 2.54.0, `out_has_width` and
   * `out_has_heigth` are always returned as `TRUE`, since with SVG2 all documents *have* a
   * default width and height of `100%`.
   * As an example, the following SVG element has a `width` of 100 pixels and a `height` of 400 pixels, but no `viewBox`.  This
   * function will return those sizes in `out_width` and `out_height`, and set `out_has_viewbox` to `FALSE`.
   * ```
   * <svg xmlns\="http://www.w3.org/2000/svg" width\="100" height\="400">
   * ```
   * Conversely, the following element has a `viewBox`, but no `width` or `height`.  This function will
   * set `out_has_viewbox` to `TRUE`, and it will also set `out_has_width` and `out_has_height` to `TRUE` but
   * return both length values as `100%`.
   * ```
   * <svg xmlns\="http://www.w3.org/2000/svg" viewBox\="0 0 100 400">
   * ```
   * Note that the `RsvgLength` return values have `RsvgUnits` in them; you should
   * not assume that they are always in pixels.  For example, the following SVG element
   * will return width and height values whose `units` fields are `RSVG_UNIT_MM`.
   * ```
   * <svg xmlns\="http://www.w3.org/2000/svg" width\="210mm" height\="297mm">
   * ```
   * API ordering: This function must be called on a fully-loaded handle.  See
   * the section "[API ordering](class.Handle.html#api-ordering)" for details.
   * Panics: this function will panic if the handle is not fully-loaded.
   * Params:
   *   outHasWidth = Will be set to `TRUE`; see below.
   *   outWidth = Will be set to the computed value of the `width` property in the toplevel SVG.
   *   outHasHeight = Will be set to `TRUE`; see below.
   *   outHeight = Will be set to the computed value of the `height` property in the toplevel SVG.
   *   outHasViewbox = Will be set to `TRUE` if the toplevel SVG has a `viewBox` attribute
   *   outViewbox = Will be set to the value of the `viewBox` attribute in the toplevel SVG
   */
  void getIntrinsicDimensions(out bool outHasWidth, out Length outWidth, out bool outHasHeight, out Length outHeight, out bool outHasViewbox, out Rectangle outViewbox)
  {
    rsvg_handle_get_intrinsic_dimensions(cast(RsvgHandle*)cPtr, cast(bool*)&outHasWidth, &outWidth, cast(bool*)&outHasHeight, &outHeight, cast(bool*)&outHasViewbox, &outViewbox);
  }

  /**
   * Converts an SVG document's intrinsic dimensions to pixels, and returns the result.
   * This function is able to extract the size in pixels from an SVG document if the
   * document has both `width` and `height` attributes
   * with physical units $(LPAREN)px, in, cm, mm, pt, pc$(RPAREN) or font-based units $(LPAREN)em, ex$(RPAREN).  For
   * physical units, the dimensions are normalized to pixels using the dots-per-inch $(LPAREN)DPI$(RPAREN)
   * value set previously with [rsvg.handle.Handle.setDpi].  For font-based units, this function
   * uses the computed value of the `font-size` property for the toplevel
   * `<svg>` element.  In those cases, this function returns `TRUE`.
   * This function is not able to extract the size in pixels directly from the intrinsic
   * dimensions of the SVG document if the `width` or
   * `height` are in percentage units $(LPAREN)or if they do not exist, in which
   * case the SVG spec mandates that they default to 100%$(RPAREN), as these require a
   * <firstterm>viewport</firstterm> to be resolved to a final size.  In this case, the
   * function returns `FALSE`.
   * For example, the following document fragment has intrinsic dimensions that will resolve
   * to 20x30 pixels.
   * ```
   * <svg xmlns\="http://www.w3.org/2000/svg" width\="20" height\="30"/>
   * ```
   * Similarly, if the DPI is set to 96, this document will resolve to 192×288 pixels $(LPAREN)i.e. 96×2 × 96×3$(RPAREN).
   * ```
   * <svg xmlns\="http://www.w3.org/2000/svg" width\="2in" height\="3in"/>
   * ```
   * The dimensions of the following documents cannot be resolved to pixels directly, and
   * this function would return `FALSE` for them:
   * ```
   * <!-- Needs a viewport against which to compute the percentages. -->
   * <svg xmlns\="http://www.w3.org/2000/svg" width\="100%" height\="100%"/>
   * <!-- Does not have intrinsic width/height, just a 1:2 aspect ratio which
   * needs to be fitted within a viewport. -->
   * <svg xmlns\="http://www.w3.org/2000/svg" viewBox\="0 0 100 200"/>
   * ```
   * Instead of querying an SVG document's size, applications are encouraged to render SVG
   * documents to a size chosen by the application, by passing a suitably-sized viewport to
   * [rsvg.handle.Handle.renderDocument].
   * Params:
   *   outWidth = Will be set to the computed width; you should round this up to get integer pixels.
   *   outHeight = Will be set to the computed height; you should round this up to get integer pixels.
   * Returns: `TRUE` if the dimensions could be converted directly to pixels; in this case
   *   out_width and out_height will be set accordingly.  Note that the dimensions are
   *   floating-point numbers, so your application can know the exact size of an SVG document.
   *   To get integer dimensions, you should use `ceil$(LPAREN)$(RPAREN)` to round up to the nearest integer
   *   $(LPAREN)just using `round$(LPAREN)$(RPAREN)`, may may chop off pixels with fractional coverage$(RPAREN).  If the
   *   dimensions cannot be converted to pixels, returns `FALSE` and puts 0.0 in both
   *   out_width and out_height.
   */
  bool getIntrinsicSizeInPixels(out double outWidth, out double outHeight)
  {
    bool _retval;
    _retval = rsvg_handle_get_intrinsic_size_in_pixels(cast(RsvgHandle*)cPtr, cast(double*)&outWidth, cast(double*)&outHeight);
    return _retval;
  }

  string getMetadata()
  {
    const(char)* _cretval;
    _cretval = rsvg_handle_get_metadata(cast(RsvgHandle*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns the pixbuf loaded by handle.  The pixbuf returned will be reffed, so
   * the caller of this function must assume that ref.
   * API ordering: This function must be called on a fully-loaded handle.  See
   * the section "[API ordering](class.Handle.html#api-ordering)" for details.
   * This function depends on the [rsvg.handle.Handle]'s dots-per-inch value (DPI) to compute the
   * "natural size" of the document in pixels, so you should call [rsvg.handle.Handle.setDpi]
   * beforehand.
   * Returns: A pixbuf, or %NULL on error.
   *   during rendering.
   */
  Pixbuf getPixbuf()
  {
    PixbufC* _cretval;
    _cretval = rsvg_handle_get_pixbuf(cast(RsvgHandle*)cPtr);
    auto _retval = ObjectG.getDObject!Pixbuf(cast(PixbufC*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Creates a `GdkPixbuf` the same size as the entire SVG loaded into handle, but
   * only renders the sub-element that has the specified id $(LPAREN)and all its
   * sub-sub-elements recursively$(RPAREN).  If id is `NULL`, this function renders the
   * whole SVG.
   * This function depends on the [rsvg.handle.Handle]'s dots-per-inch value (DPI) to compute the
   * "natural size" of the document in pixels, so you should call [rsvg.handle.Handle.setDpi]
   * beforehand.
   * If you need to render an image which is only big enough to fit a particular
   * sub-element of the SVG, consider using [rsvg.handle.Handle.renderElement].
   * Element IDs should look like an URL fragment identifier; for example, pass
   * `#foo` $(LPAREN)hash `foo`$(RPAREN) to get the geometry of the element that
   * has an `id\="foo"` attribute.
   * API ordering: This function must be called on a fully-loaded handle.  See
   * the section "[API ordering](class.Handle.html#api-ordering)" for details.
   * Params:
   *   id = An element's id within the SVG, starting with "#" $(LPAREN)a single
   *     hash character$(RPAREN), for example, `#layer1`.  This notation corresponds to a
   *     URL's fragment ID.  Alternatively, pass `NULL` to use the whole SVG.
   * Returns: a pixbuf, or `NULL` if an error occurs
   *   during rendering.
   */
  Pixbuf getPixbufSub(string id)
  {
    PixbufC* _cretval;
    const(char)* _id = id.toCString(No.Alloc);
    _cretval = rsvg_handle_get_pixbuf_sub(cast(RsvgHandle*)cPtr, _id);
    auto _retval = ObjectG.getDObject!Pixbuf(cast(PixbufC*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Get the position of a subelement of the SVG file. Do not call from within
   * the size_func callback, because an infinite loop will occur.
   * This function depends on the [rsvg.handle.Handle]'s DPI to compute dimensions in
   * pixels, so you should call [rsvg.handle.Handle.setDpi] beforehand.
   * Element IDs should look like an URL fragment identifier; for example, pass
   * `#foo` $(LPAREN)hash `foo`$(RPAREN) to get the geometry of the element that
   * has an `id\="foo"` attribute.
   * Params:
   *   positionData = A place to store the SVG fragment's position.
   *   id = An element's id within the SVG, starting with "#" $(LPAREN)a single
   *     hash character$(RPAREN), for example, `#layer1`.  This notation corresponds to a
   *     URL's fragment ID.  Alternatively, pass %NULL to use the whole SVG.
   * Returns: `TRUE` if the position could be obtained, `FALSE` if there was an error.

   * Deprecated: Use [rsvg.handle.Handle.getGeometryForLayer] instead.  This function is
   *   deprecated since it is not able to return exact floating-point positions, only integer
   *   pixels.
   */
  bool getPositionSub(out PositionData positionData, string id)
  {
    bool _retval;
    const(char)* _id = id.toCString(No.Alloc);
    _retval = rsvg_handle_get_position_sub(cast(RsvgHandle*)cPtr, &positionData, _id);
    return _retval;
  }

  string getTitle()
  {
    const(char)* _cretval;
    _cretval = rsvg_handle_get_title(cast(RsvgHandle*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Checks whether the element id exists in the SVG document.
   * Element IDs should look like an URL fragment identifier; for example, pass
   * `#foo` $(LPAREN)hash `foo`$(RPAREN) to get the geometry of the element that
   * has an `id\="foo"` attribute.
   * Params:
   *   id = An element's id within the SVG, starting with "#" $(LPAREN)a single hash
   *     character$(RPAREN), for example, `#layer1`.  This notation corresponds to a URL's
   *     fragment ID.
   * Returns: `TRUE` if id exists in the SVG document, `FALSE` otherwise.
   */
  bool hasSub(string id)
  {
    bool _retval;
    const(char)* _id = id.toCString(No.Alloc);
    _retval = rsvg_handle_has_sub(cast(RsvgHandle*)cPtr, _id);
    return _retval;
  }

  /**
   * Do not call this function.  This is intended for librsvg's internal
   * test suite only.
   * Params:
   *   testing = Whether to enable testing mode
   */
  void internalSetTesting(bool testing)
  {
    rsvg_handle_internal_set_testing(cast(RsvgHandle*)cPtr, testing);
  }

  /**
   * Reads stream and writes the data from it to handle.
   * Before calling this function, you may need to call [rsvg.handle.Handle.setBaseUri]
   * or [rsvg.handle.Handle.setBaseGfile] to set the "base file" for resolving
   * references to external resources.  SVG elements like
   * `<image>` which reference external resources will be
   * resolved relative to the location you specify with those functions.
   * If cancellable is not `NULL`, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the
   * operation was cancelled, the error `G_IO_ERROR_CANCELLED` will be
   * returned.
   * Params:
   *   stream = a `GInputStream`
   *   cancellable = a `GCancellable`, or `NULL`
   * Returns: `TRUE` if reading stream succeeded, or `FALSE` otherwise
   *   with error filled in
   */
  bool readStreamSync(InputStream stream, Cancellable cancellable)
  {
    bool _retval;
    GError *_err;
    _retval = rsvg_handle_read_stream_sync(cast(RsvgHandle*)cPtr, stream ? cast(GInputStream*)stream.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Draws a loaded SVG handle to a Cairo context.  Please try to use
   * [rsvg.handle.Handle.renderDocument] instead, which allows you to pick the size
   * at which the document will be rendered.
   * Historically this function has picked a size by itself, based on the following rules:
   * * If the SVG document has both `width` and `height`
   * attributes with physical units $(LPAREN)px, in, cm, mm, pt, pc$(RPAREN) or font-based units $(LPAREN)em,
   * ex$(RPAREN), the function computes the size directly based on the dots-per-inch $(LPAREN)DPI$(RPAREN) you
   * have configured with [rsvg.handle.Handle.setDpi].  This is the same approach as
   * [rsvg.handle.Handle.getIntrinsicSizeInPixels].
   * * Otherwise, if there is a `viewBox` attribute and both
   * `width` and `height` are set to
   * `100%` $(LPAREN)or if they don't exist at all and thus default to 100%$(RPAREN),
   * the function uses the width and height of the `viewBox` as a pixel size.  This
   * produces a rendered document with the correct aspect ratio.
   * * Otherwise, this function computes the extents of every graphical object in the SVG
   * document to find the total extents.  This is moderately expensive, but no more expensive
   * than rendering the whole document, for example.
   * * This function cannot deal with percentage-based units for `width`
   * and `height` because there is no viewport against which they could
   * be resolved; that is why it will compute the extents of objects in that case.  This
   * is why we recommend that you use [rsvg.handle.Handle.renderDocument] instead, which takes
   * in a viewport and follows the sizing policy from the web platform.
   * Drawing will occur with respect to the cr's current transformation: for example, if
   * the cr has a rotated current transformation matrix, the whole SVG will be rotated in
   * the rendered version.
   * This function depends on the [rsvg.handle.Handle]'s DPI to compute dimensions in
   * pixels, so you should call [rsvg.handle.Handle.setDpi] beforehand.
   * Note that cr must be a Cairo context that is not in an error state, that is,
   * `[cairo.context.Context.status]` must return `CAIRO_STATUS_SUCCESS` for it.  Cairo can set a
   * context to be in an error state in various situations, for example, if it was
   * passed an invalid matrix or if it was created for an invalid surface.
   * Params:
   *   cr = A Cairo context
   * Returns: `TRUE` if drawing succeeded; `FALSE` otherwise.  This function will emit a g_warning$(LPAREN)$(RPAREN)
   *   if a rendering error occurs.

   * Deprecated: Please use [rsvg.handle.Handle.renderDocument] instead; that function lets
   *   you pass a viewport and obtain a good error message.
   */
  bool renderCairo(Context cr)
  {
    bool _retval;
    _retval = rsvg_handle_render_cairo(cast(RsvgHandle*)cPtr, cr ? cast(cairo_t*)cr.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Renders a single SVG element in the same place as for a whole SVG document $(LPAREN)a "subset"
   * of the document$(RPAREN).  Please try to use [rsvg.handle.Handle.renderLayer] instead, which allows
   * you to pick the size at which the document with the layer will be rendered.
   * This is equivalent to [rsvg.handle.Handle.renderCairo], but it renders only a single
   * element and its children, as if they composed an individual layer in the SVG.
   * Historically this function has picked a size for the whole document by itself, based
   * on the following rules:
   * * If the SVG document has both `width` and `height`
   * attributes with physical units $(LPAREN)px, in, cm, mm, pt, pc$(RPAREN) or font-based units $(LPAREN)em,
   * ex$(RPAREN), the function computes the size directly based on the dots-per-inch $(LPAREN)DPI$(RPAREN) you
   * have configured with [rsvg.handle.Handle.setDpi].  This is the same approach as
   * [rsvg.handle.Handle.getIntrinsicSizeInPixels].
   * * Otherwise, if there is a `viewBox` attribute and both
   * `width` and `height` are set to
   * `100%` $(LPAREN)or if they don't exist at all and thus default to 100%$(RPAREN),
   * the function uses the width and height of the `viewBox` as a pixel size.  This
   * produces a rendered document with the correct aspect ratio.
   * * Otherwise, this function computes the extents of every graphical object in the SVG
   * document to find the total extents.  This is moderately expensive, but no more expensive
   * than rendering the whole document, for example.
   * * This function cannot deal with percentage-based units for `width`
   * and `height` because there is no viewport against which they could
   * be resolved; that is why it will compute the extents of objects in that case.  This
   * is why we recommend that you use [rsvg.handle.Handle.renderLayer] instead, which takes
   * in a viewport and follows the sizing policy from the web platform.
   * Drawing will occur with respect to the cr's current transformation: for example, if
   * the cr has a rotated current transformation matrix, the whole SVG will be rotated in
   * the rendered version.
   * This function depends on the [rsvg.handle.Handle]'s DPI to compute dimensions in
   * pixels, so you should call [rsvg.handle.Handle.setDpi] beforehand.
   * Note that cr must be a Cairo context that is not in an error state, that is,
   * `[cairo.context.Context.status]` must return `CAIRO_STATUS_SUCCESS` for it.  Cairo can set a
   * context to be in an error state in various situations, for example, if it was
   * passed an invalid matrix or if it was created for an invalid surface.
   * Element IDs should look like an URL fragment identifier; for example, pass
   * `#foo` $(LPAREN)hash `foo`$(RPAREN) to get the geometry of the element that
   * has an `id\="foo"` attribute.
   * Params:
   *   cr = A Cairo context
   *   id = An element's id within the SVG, starting with "#" $(LPAREN)a single
   *     hash character$(RPAREN), for example, `#layer1`.  This notation corresponds to a
   *     URL's fragment ID.  Alternatively, pass `NULL` to render the whole SVG.
   * Returns: `TRUE` if drawing succeeded; `FALSE` otherwise.  This function will emit a g_warning$(LPAREN)$(RPAREN)
   *   if a rendering error occurs.

   * Deprecated: Please use [rsvg.handle.Handle.renderLayer] instead; that function lets
   *   you pass a viewport and obtain a good error message.
   */
  bool renderCairoSub(Context cr, string id)
  {
    bool _retval;
    const(char)* _id = id.toCString(No.Alloc);
    _retval = rsvg_handle_render_cairo_sub(cast(RsvgHandle*)cPtr, cr ? cast(cairo_t*)cr.cPtr(No.Dup) : null, _id);
    return _retval;
  }

  /**
   * Renders the whole SVG document fitted to a viewport.
   * The viewport gives the position and size at which the whole SVG document will be
   * rendered.  The document is scaled proportionally to fit into this viewport.
   * The cr must be in a `CAIRO_STATUS_SUCCESS` state, or this function will not
   * render anything, and instead will return an error.
   * Params:
   *   cr = A Cairo context
   *   viewport = Viewport size at which the whole SVG would be fitted.
   * Returns: `TRUE` on success, `FALSE` on error.  Errors are returned
   *   in the error argument.
   *   API ordering: This function must be called on a fully-loaded handle.  See
   *   the section "[API ordering](class.Handle.html#api-ordering)" for details.
   *   Panics: this function will panic if the handle is not fully-loaded.
   */
  bool renderDocument(Context cr, Rectangle viewport)
  {
    bool _retval;
    GError *_err;
    _retval = rsvg_handle_render_document(cast(RsvgHandle*)cPtr, cr ? cast(cairo_t*)cr.cPtr(No.Dup) : null, &viewport, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Renders a single SVG element to a given viewport.
   * This function can be used to extract individual element subtrees and render them,
   * scaled to a given element_viewport.  This is useful for applications which have
   * reusable objects in an SVG and want to render them individually; for example, an
   * SVG full of icons that are meant to be be rendered independently of each other.
   * Element IDs should look like an URL fragment identifier; for example, pass
   * `#foo` $(LPAREN)hash `foo`$(RPAREN) to get the geometry of the element that
   * has an `id\="foo"` attribute.
   * You can pass `NULL` for the id if you want to render all
   * the elements in the SVG, i.e. to render everything from the
   * root element.
   * The `element_viewport` gives the position and size at which the named element will
   * be rendered.  FIXME: mention proportional scaling.
   * Params:
   *   cr = A Cairo context
   *   id = An element's id within the SVG, starting with "#" $(LPAREN)a single
   *     hash character$(RPAREN), for example, `#layer1`.  This notation corresponds to a
   *     URL's fragment ID.  Alternatively, pass `NULL` to render the whole SVG document tree.
   *   elementViewport = Viewport size in which to fit the element
   * Returns: `TRUE` on success, `FALSE` on error.  Errors are returned
   *   in the error argument.
   *   API ordering: This function must be called on a fully-loaded handle.  See
   *   the section "[API ordering](class.Handle.html#api-ordering)" for details.
   *   Panics: this function will panic if the handle is not fully-loaded.
   */
  bool renderElement(Context cr, string id, Rectangle elementViewport)
  {
    bool _retval;
    const(char)* _id = id.toCString(No.Alloc);
    GError *_err;
    _retval = rsvg_handle_render_element(cast(RsvgHandle*)cPtr, cr ? cast(cairo_t*)cr.cPtr(No.Dup) : null, _id, &elementViewport, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Renders a single SVG element in the same place as for a whole SVG document.
   * The viewport gives the position and size at which the whole SVG document would be
   * rendered.  The document is scaled proportionally to fit into this viewport; hence the
   * individual layer may be smaller than this.
   * This is equivalent to [rsvg.handle.Handle.renderDocument], but it renders only a
   * single element and its children, as if they composed an individual layer in
   * the SVG.  The element is rendered with the same transformation matrix as it
   * has within the whole SVG document.  Applications can use this to re-render a
   * single element and repaint it on top of a previously-rendered document, for
   * example.
   * Element IDs should look like an URL fragment identifier; for example, pass
   * `#foo` $(LPAREN)hash `foo`$(RPAREN) to get the geometry of the element that
   * has an `id\="foo"` attribute.
   * You can pass `NULL` for the id if you want to render all
   * the elements in the SVG, i.e. to render everything from the
   * root element.
   * Params:
   *   cr = A Cairo context
   *   id = An element's id within the SVG, starting with "#" $(LPAREN)a single
   *     hash character$(RPAREN), for example, `#layer1`.  This notation corresponds to a
   *     URL's fragment ID.  Alternatively, pass `NULL` to render the whole SVG document tree.
   *   viewport = Viewport size at which the whole SVG would be fitted.
   * Returns: `TRUE` on success, `FALSE` on error.  Errors are returned
   *   in the error argument.
   *   API ordering: This function must be called on a fully-loaded handle.  See
   *   the section "[API ordering](class.Handle.html#api-ordering)" for details.
   *   Panics: this function will panic if the handle is not fully-loaded.
   */
  bool renderLayer(Context cr, string id, Rectangle viewport)
  {
    bool _retval;
    const(char)* _id = id.toCString(No.Alloc);
    GError *_err;
    _retval = rsvg_handle_render_layer(cast(RsvgHandle*)cPtr, cr ? cast(cairo_t*)cr.cPtr(No.Dup) : null, _id, &viewport, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Set the base URI for handle from file.
   * Note: This function may only be called before [rsvg.handle.Handle.write] or
   * [rsvg.handle.Handle.readStreamSync] have been called.
   * Params:
   *   baseFile = a `GFile`
   */
  void setBaseGfile(File baseFile)
  {
    rsvg_handle_set_base_gfile(cast(RsvgHandle*)cPtr, baseFile ? cast(GFile*)(cast(ObjectG)baseFile).cPtr(No.Dup) : null);
  }

  /**
   * Set the base URI for this SVG.
   * Note: This function may only be called before [rsvg.handle.Handle.write] or
   * [rsvg.handle.Handle.readStreamSync] have been called.
   * Params:
   *   baseUri = The base uri
   */
  void setBaseUri(string baseUri)
  {
    const(char)* _baseUri = baseUri.toCString(No.Alloc);
    rsvg_handle_set_base_uri(cast(RsvgHandle*)cPtr, _baseUri);
  }

  /**
   * Sets the DPI at which the handle will be rendered. Common values are
   * 75, 90, and 300 DPI.
   * Passing a number <\= 0 to dpi will reset the DPI to whatever the default
   * value happens to be, but since idrsvg_set_default_dpi is deprecated, please
   * do not pass values <\= 0 to this function.
   * Params:
   *   dpi = Dots Per Inch $(LPAREN)i.e. as Pixels Per Inch$(RPAREN)
   */
  void setDpi(double dpi)
  {
    rsvg_handle_set_dpi(cast(RsvgHandle*)cPtr, dpi);
  }

  /**
   * Sets the DPI at which the handle will be rendered. Common values are
   * 75, 90, and 300 DPI.
   * Passing a number <\= 0 to dpi will reset the DPI to whatever the default
   * value happens to be, but since idrsvg_set_default_dpi_x_y is deprecated,
   * please do not pass values <\= 0 to this function.
   * Params:
   *   dpiX = Dots Per Inch $(LPAREN)i.e. Pixels Per Inch$(RPAREN)
   *   dpiY = Dots Per Inch $(LPAREN)i.e. Pixels Per Inch$(RPAREN)
   */
  void setDpiXY(double dpiX, double dpiY)
  {
    rsvg_handle_set_dpi_x_y(cast(RsvgHandle*)cPtr, dpiX, dpiY);
  }

  /**
   * Sets the sizing function for the handle, which can be used to override the
   * size that librsvg computes for SVG images.  The size_func is called from the
   * following functions:
   * * [rsvg.handle.Handle.getDimensions]
   * * [rsvg.handle.Handle.getDimensionsSub]
   * * [rsvg.handle.Handle.getPositionSub]
   * * [rsvg.handle.Handle.renderCairo]
   * * [rsvg.handle.Handle.renderCairoSub]
   * Librsvg computes the size of the SVG being rendered, and passes it to the
   * size_func, which may then modify these values to set the final size of the
   * generated image.
   * Params:
   *   sizeFunc = A sizing function, or `NULL`

   * Deprecated: Use [rsvg.handle.Handle.renderDocument] instead.
   *   This function was deprecated because when the size_func is used, it makes it
   *   unclear when the librsvg functions which call the size_func will use the
   *   size computed originally, or the callback-specified size, or whether it
   *   refers to the whole SVG or to just a sub-element of it.  It is easier, and
   *   unambiguous, to use code similar to the example above.
   */
  void setSizeCallback(SizeFunc sizeFunc)
  {
    extern(C) void _sizeFuncCallback(int* width, int* height, void* userData)
    {
      auto _dlg = cast(SizeFunc*)userData;

      (*_dlg)(*width, *height);
    }
    auto _sizeFuncCB = sizeFunc ? &_sizeFuncCallback : null;

    auto _sizeFunc = sizeFunc ? freezeDelegate(cast(void*)&sizeFunc) : null;
    GDestroyNotify _sizeFuncDestroyCB = sizeFunc ? &thawDelegate : null;
    rsvg_handle_set_size_callback(cast(RsvgHandle*)cPtr, _sizeFuncCB, _sizeFunc, _sizeFuncDestroyCB);
  }

  /**
   * Sets a CSS stylesheet to use for an SVG document.
   * The css_len argument is mandatory; this function will not compute the length
   * of the css string.  This is because a provided stylesheet, which the calling
   * program could read from a file, can have nul characters in it.
   * During the CSS cascade, the specified stylesheet will be used with a "User"
   * [origin](https://drafts.csswg.org/css-cascade-3/#cascading-origins).
   * Note that `import` rules will not be resolved, except for `data:` URLs.
   * Params:
   *   css = String with CSS data; must be valid UTF-8.
   * Returns: `TRUE` on success, `FALSE` on error.  Errors are returned
   *   in the error argument.
   */
  bool setStylesheet(ubyte[] css)
  {
    bool _retval;
    size_t _cssLen;
    if (css)
      _cssLen = cast(size_t)css.length;

    auto _css = cast(const(ubyte)*)css.ptr;
    GError *_err;
    _retval = rsvg_handle_set_stylesheet(cast(RsvgHandle*)cPtr, _css, _cssLen, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Loads the next count bytes of the image.  You can call this function multiple
   * times until the whole document is consumed; then you must call [rsvg.handle.Handle.close]
   * to actually parse the document.
   * Before calling this function for the first time, you may need to call
   * [rsvg.handle.Handle.setBaseUri] or [rsvg.handle.Handle.setBaseGfile] to set the "base
   * file" for resolving references to external resources.  SVG elements like
   * `<image>` which reference external resources will be
   * resolved relative to the location you specify with those functions.
   * Params:
   *   buf = pointer to svg data
   * Returns: `TRUE` on success, or `FALSE` on error.

   * Deprecated: Use [rsvg.handle.Handle.readStreamSync] or the constructor
   *   functions [rsvg.handle.Handle.newFromGfileSync] or
   *   [rsvg.handle.Handle.newFromStreamSync].  This function is deprecated because it
   *   will accumulate data from the buf in memory until [rsvg.handle.Handle.close] gets
   *   called.  To avoid a big temporary buffer, use the suggested functions, which
   *   take a `GFile` or a `GInputStream` and do not require a temporary buffer.
   */
  bool write(ubyte[] buf)
  {
    bool _retval;
    size_t _count;
    if (buf)
      _count = cast(size_t)buf.length;

    auto _buf = cast(const(ubyte)*)buf.ptr;
    GError *_err;
    _retval = rsvg_handle_write(cast(RsvgHandle*)cPtr, _buf, _count, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
