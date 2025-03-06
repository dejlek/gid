module cairo.types;

import cairo.c.functions;
import cairo.c.types;
import cairo.context;
import cairo.pattern;
import cairo.rectangle_int;
import cairo.scaled_font;
import cairo.surface;
import gid.gid;


// Aliases

/** */
alias Bool = cairo_bool_t;

// Structs

/** */
alias FontExtents = cairo_font_extents_t;

/** */
alias TextExtents = cairo_text_extents_t;

/** */
alias UserDataKey = cairo_user_data_key_t;

// Callbacks

/**
    #cairo_destroy_func_t the type of function which is called when a
  data element is destroyed. It is passed the pointer to the data
  element and should free any memory and resources allocated for it.
*/
alias DestroyFunc = void delegate();

/**
    #cairo_raster_source_acquire_func_t is the type of function which is
  called when a pattern is being rendered from. It should create a surface
  that provides the pixel data for the region of interest as defined by
  extents, though the surface itself does not have to be limited to that
  area. For convenience the surface should probably be of image type,
  created with [cairo.surface.Surface.createSimilarImage] for the target (which
  enables the number of copies to be reduced during transfer to the
  device). Another option, might be to return a similar surface to the
  target for explicit handling by the application of a set of cached sources
  on the device. The region of sample data provided should be defined using
  [cairo.surface.Surface.setDeviceOffset] to specify the top-left corner of the
  sample data (along with width and height of the surface).

  ## Parameters
  $(LIST
    * $(B pattern)       the pattern being rendered from
    * $(B target)       the rendering target surface
    * $(B extents)       rectangular region of interest in pixels in sample space
  )
  Returns:     a #cairo_surface_t
*/
alias RasterSourceAcquireFunc = cairo.surface.Surface delegate(cairo.pattern.Pattern pattern, cairo.surface.Surface target, cairo.rectangle_int.RectangleInt extents);

/**
    #cairo_raster_source_copy_func_t is the type of function which is
  called when the pattern gets copied as a normal part of rendering.

  ## Parameters
  $(LIST
    * $(B pattern)       the #cairo_pattern_t that was copied to
    * $(B other)       the #cairo_pattern_t being used as the source for the copy
  )
  Returns:     CAIRO_STATUS_SUCCESS on success, or one of the
    #cairo_status_t error codes for failure.
*/
alias RasterSourceCopyFunc = cairo.types.Status delegate(cairo.pattern.Pattern pattern, cairo.pattern.Pattern other);

/**
    #cairo_raster_source_finish_func_t is the type of function which is
  called when the pattern (or a copy thereof) is no longer required.

  ## Parameters
  $(LIST
    * $(B pattern)       the pattern being rendered from
  )
*/
alias RasterSourceFinishFunc = void delegate(cairo.pattern.Pattern pattern);

/**
    #cairo_raster_source_release_func_t is the type of function which is
  called when the pixel data is no longer being access by the pattern
  for the rendering operation. Typically this function will simply
  destroy the surface created during acquire.

  ## Parameters
  $(LIST
    * $(B pattern)       the pattern being rendered from
    * $(B surface)       the surface created during acquire
  )
*/
alias RasterSourceReleaseFunc = void delegate(cairo.pattern.Pattern pattern, cairo.surface.Surface surface);

/**
    #cairo_raster_source_snapshot_func_t is the type of function which is
  called when the pixel data needs to be preserved for later use
  during printing. This pattern will be accessed again later, and it
  is expected to provide the pixel data that was current at the time
  of snapshotting.

  ## Parameters
  $(LIST
    * $(B pattern)       the pattern being rendered from
  )
  Returns:     CAIRO_STATUS_SUCCESS on success, or one of the
    #cairo_status_t error codes for failure.
*/
alias RasterSourceSnapshotFunc = cairo.types.Status delegate(cairo.pattern.Pattern pattern);

/**
    #cairo_read_func_t is the type of function which is called when a
  backend needs to read data from an input stream.  It is passed the
  closure which was specified by the user at the time the read
  function was registered, the buffer to read the data into and the
  length of the data in bytes.  The read function should return
  [cairo.types.Status.Success] if all the data was successfully read,
  [cairo.types.Status.ReadError] otherwise.

  ## Parameters
  $(LIST
    * $(B data)       the buffer into which to read the data
  )
  Returns:     the status code of the read operation
*/
alias ReadFunc = cairo.types.Status delegate(ubyte[] data);

/**
    A generic callback function for surface operations.

  ## Parameters
  $(LIST
    * $(B observer)       the #cairo_surface_observer_t
    * $(B target)       the observed surface
  )
*/
alias SurfaceObserverCallback = void delegate(cairo.surface.Surface observer, cairo.surface.Surface target);

/**
    #cairo_user_scaled_font_init_func_t is the type of function which is
  called when a scaled-font needs to be created for a user font-face.
  
  The cairo context cr is not used by the caller, but is prepared in font
  space, similar to what the cairo contexts passed to the render_glyph
  method will look like.  The callback can use this context for extents
  computation for example.  After the callback is called, cr is checked
  for any error status.
  
  The extents argument is where the user font sets the font extents for
  scaled_font.  It is in font space, which means that for most cases its
  ascent and descent members should add to 1.0.  extents is preset to
  hold a value of 1.0 for ascent, height, and max_x_advance, and 0.0 for
  descent and max_y_advance members.
  
  The callback is optional.  If not set, default font extents as described
  in the previous paragraph will be used.
  
  Note that scaled_font is not fully initialized at this
  point and trying to use it for text operations in the callback will result
  in deadlock.

  ## Parameters
  $(LIST
    * $(B scaledFont)       the scaled-font being created
    * $(B cr)       a cairo context, in font space
    * $(B extents)       font extents to fill in, in font space
  )
  Returns:     [cairo.types.Status.Success] upon success, or an error status on error.
*/
alias UserScaledFontInitFunc = cairo.types.Status delegate(cairo.scaled_font.ScaledFont scaledFont, cairo.context.Context cr, cairo.types.FontExtents extents);

/**
    #cairo_user_scaled_font_render_glyph_func_t is the type of function which
  is called when a user scaled-font needs to render a glyph.
  
  The callback is mandatory, and expected to draw the glyph with code glyph to
  the cairo context cr.  cr is prepared such that the glyph drawing is done in
  font space.  That is, the matrix set on cr is the scale matrix of scaled_font.
  The extents argument is where the user font sets the font extents for
  scaled_font.  However, if user prefers to draw in user space, they can
  achieve that by changing the matrix on cr.
  
  All cairo rendering operations to cr are permitted. However, when
  this callback is set with
  [cairo.global.userFontFaceSetRenderGlyphFunc], the result is
  undefined if any source other than the default source on cr is
  used.  That means, glyph bitmaps should be rendered using
  [cairo.context.Context.mask] instead of [cairo.context.Context.paint].
  
  When this callback is set with
  [cairo.global.userFontFaceSetRenderColorGlyphFunc], the default
  source is black. Setting the source is a valid
  operation. [cairo.global.userScaledFontGetForegroundMarker] or
  [cairo.global.userScaledFontGetForegroundSource] may be called to
  obtain the current source at the time the glyph is rendered.
  
  Other non-default settings on cr include a font size of 1.0 (given that
  it is set up to be in font space), and font options corresponding to
  scaled_font.
  
  The extents argument is preset to have <literal>x_bearing</literal>,
  <literal>width</literal>, and <literal>y_advance</literal> of zero,
  <literal>y_bearing</literal> set to <literal>-font_extents.ascent</literal>,
  <literal>height</literal> to <literal>font_extents.ascent+font_extents.descent</literal>,
  and <literal>x_advance</literal> to <literal>font_extents.max_x_advance</literal>.
  The only field user needs to set in majority of cases is
  <literal>x_advance</literal>.
  If the <literal>width</literal> field is zero upon the callback returning
  (which is its preset value), the glyph extents are automatically computed
  based on the drawings done to cr.  This is in most cases exactly what the
  desired behavior is.  However, if for any reason the callback sets the
  extents, it must be ink extents, and include the extents of all drawing
  done to cr in the callback.
  
  Where both color and non-color callbacks has been set using
  [cairo.global.userFontFaceSetRenderColorGlyphFunc], and
  [cairo.global.userFontFaceSetRenderGlyphFunc], the color glyph
  callback will be called first. If the color glyph callback returns
  [cairo.types.Status.UserFontNotImplemented], any drawing operations are
  discarded and the non-color callback will be called. This is the
  only case in which the [cairo.types.Status.UserFontNotImplemented] may
  be returned from a render callback. This fallback sequence allows a
  user font face to contain a combination of both color and non-color
  glyphs.

  ## Parameters
  $(LIST
    * $(B scaledFont)       user scaled-font
    * $(B glyph)       glyph code to render
    * $(B cr)       cairo context to draw to, in font space
    * $(B extents)       glyph extents to fill in, in font space
  )
  Returns:     [cairo.types.Status.Success] upon success,
    [cairo.types.Status.UserFontNotImplemented] if fallback options should be tried,
    or [cairo.types.Status.UserFontError] or any other error status on error.
*/
alias UserScaledFontRenderGlyphFunc = cairo.types.Status delegate(cairo.scaled_font.ScaledFont scaledFont, gulong glyph, cairo.context.Context cr, cairo.types.TextExtents extents);

/**
    #cairo_user_scaled_font_unicode_to_glyph_func_t is the type of function which
  is called to convert an input Unicode character to a single glyph.
  This is used by the [cairo.context.Context.showText] operation.
  
  This callback is used to provide the same functionality as the
  text_to_glyphs callback does (see #cairo_user_scaled_font_text_to_glyphs_func_t)
  but has much less control on the output,
  in exchange for increased ease of use.  The inherent assumption to using
  this callback is that each character maps to one glyph, and that the
  mapping is context independent.  It also assumes that glyphs are positioned
  according to their advance width.  These mean no ligatures, kerning, or
  complex scripts can be implemented using this callback.
  
  The callback is optional, and only used if text_to_glyphs callback is not
  set or fails to return glyphs.  If this callback is not set or if it returns
  [cairo.types.Status.UserFontNotImplemented], an identity mapping from Unicode
  code-points to glyph indices is assumed.
  
  Note: While cairo does not impose any limitation on glyph indices,
  some applications may assume that a glyph index fits in a 16-bit
  unsigned integer.  As such, it is advised that user-fonts keep their
  glyphs in the 0 to 65535 range.  Furthermore, some applications may
  assume that glyph 0 is a special glyph-not-found glyph.  User-fonts
  are advised to use glyph 0 for such purposes and do not use that
  glyph value for other purposes.

  ## Parameters
  $(LIST
    * $(B scaledFont)       the scaled-font being created
    * $(B unicode)       input unicode character code-point
    * $(B glyphIndex)       output glyph index
  )
  Returns:     [cairo.types.Status.Success] upon success,
    [cairo.types.Status.UserFontNotImplemented] if fallback options should be tried,
    or [cairo.types.Status.UserFontError] or any other error status on error.
*/
alias UserScaledFontUnicodeToGlyphFunc = cairo.types.Status delegate(cairo.scaled_font.ScaledFont scaledFont, gulong unicode, out gulong glyphIndex);

/**
    #cairo_write_func_t is the type of function which is called when a
  backend needs to write data to an output stream.  It is passed the
  closure which was specified by the user at the time the write
  function was registered, the data to write and the length of the
  data in bytes.  The write function should return
  [cairo.types.Status.Success] if all the data was successfully written,
  [cairo.types.Status.WriteError] otherwise.

  ## Parameters
  $(LIST
    * $(B data)       the buffer containing the data to write
  )
  Returns:     the status code of the write operation
*/
alias WriteFunc = cairo.types.Status delegate(ubyte[] data);

/**
    Specifies the type of antialiasing to do when rendering text or shapes.
  
  These make no guarantee on how the backend will perform its rasterisation
  (if it even rasterises!), nor that they have any differing effect other
  than to enable some form of antialiasing. In the case of glyph rendering,
  @CAIRO_ANTIALIAS_FAST and @CAIRO_ANTIALIAS_GOOD will be mapped to
  @CAIRO_ANTIALIAS_GRAY, with @CAIRO_ANTALIAS_BEST being equivalent to
  @CAIRO_ANTIALIAS_SUBPIXEL.
  
  The interpretation of @CAIRO_ANTIALIAS_DEFAULT is left entirely up to
  the backend, typically this will be similar to @CAIRO_ANTIALIAS_GOOD.
*/
enum Antialias
{
  /**
      Use the default antialiasing for
      the subsystem and target device, since 1.0
  */
  Default = 0,

  /**
      Use a bilevel alpha mask, since 1.0
  */
  None = 1,

  /**
      Perform single-color antialiasing (using
     shades of gray for black text on a white background, for example), since 1.0
  */
  Gray = 2,

  /**
      Perform antialiasing by taking
     advantage of the order of subpixel elements on devices
     such as LCD panels, since 1.0
  */
  Subpixel = 3,

  /**
      Hint that the backend should perform some
    antialiasing but prefer speed over quality, since 1.12
  */
  Fast = 4,

  /**
      The backend should balance quality against
    performance, since 1.12
  */
  Good = 5,

  /**
      Hint that the backend should render at the highest
    quality, sacrificing speed if necessary, since 1.12
  */
  Best = 6,
}

/**
    Specifies if color fonts are to be rendered using the color
  glyphs or outline glyphs. Glyphs that do not have a color
  presentation, and non-color fonts are not affected by this font
  option.
*/
enum ColorMode
{
  /**
      Use the default color mode for
    font backend and target device, since 1.18.
  */
  Default = 0,

  /**
      Disable rendering color glyphs. Glyphs are
    always rendered as outline glyphs, since 1.18.
  */
  NoColor = 1,

  /**
      Enable rendering color glyphs. If the font
    contains a color presentation for a glyph, and when supported by
    the font backend, the glyph will be rendered in color, since 1.18.
  */
  Color = 2,
}

/**
    #cairo_content_t is used to describe the content that a surface will
  contain, whether color information, alpha information (translucence
  vs. opacity), or both.
  
  Note: The large values here are designed to keep #cairo_content_t
  values distinct from #cairo_format_t values so that the
  implementation can detect the error if users confuse the two types.
*/
enum Content
{
  /**
      The surface will hold color content only. (Since 1.0)
  */
  Color = 4096,

  /**
      The surface will hold alpha content only. (Since 1.0)
  */
  Alpha = 8192,

  /**
      The surface will hold color and alpha content. (Since 1.0)
  */
  ColorAlpha = 12288,
}

/**
    #cairo_device_type_t is used to describe the type of a given
  device. The devices types are also known as "backends" within cairo.
  
  The device type can be queried with [cairo.device.Device.getDeviceType]
  
  The various #cairo_device_t functions can be used with devices of
  any type, but some backends also provide type-specific functions
  that must only be called with a device of the appropriate
  type. These functions have names that begin with
  <literal>cairo_<emphasis>type</emphasis>_device</literal> such as
  cairo_xcb_device_debug_cap_xrender_version().
  
  The behavior of calling a type-specific function with a device of
  the wrong type is undefined.
  
  New entries may be added in future versions.
*/
enum DeviceType
{
  /**
      The device is of type Direct Render Manager, since 1.10
  */
  Drm = 0,

  /**
      The device is of type OpenGL, since 1.10
  */
  Gl = 1,

  /**
      The device is of type script, since 1.10
  */
  Script = 2,

  /**
      The device is of type xcb, since 1.10
  */
  Xcb = 3,

  /**
      The device is of type xlib, since 1.10
  */
  Xlib = 4,

  /**
      The device is of type XML, since 1.10
  */
  Xml = 5,
}

/**
    Dither is an intentionally applied form of noise used to randomize
  quantization error, preventing large-scale patterns such as color banding
  in images (e.g. for gradients). Ordered dithering applies a precomputed
  threshold matrix to spread the errors smoothly.
  
   #cairo_dither_t is modeled on pixman dithering algorithm choice.
  As of Pixman 0.40, FAST corresponds to a 8x8 ordered bayer noise and GOOD
  and BEST use an ordered 64x64 precomputed blue noise.
*/
enum Dither
{
  /**
      No dithering.
  */
  None = 0,

  /**
      Default choice at cairo compile time. Currently NONE.
  */
  Default = 1,

  /**
      Fastest dithering algorithm supported by the backend
  */
  Fast = 2,

  /**
      An algorithm with smoother dithering than FAST
  */
  Good = 3,

  /**
      Best algorithm available in the backend
  */
  Best = 4,
}

/**
    #cairo_extend_t is used to describe how pattern color/alpha will be
  determined for areas "outside" the pattern's natural area, (for
  example, outside the surface bounds or outside the gradient
  geometry).
  
  Mesh patterns are not affected by the extend mode.
  
  The default extend mode is [cairo.types.Extend.None] for surface patterns
  and [cairo.types.Extend.Pad] for gradient patterns.
  
  New entries may be added in future versions.
*/
enum Extend
{
  /**
      pixels outside of the source pattern
      are fully transparent (Since 1.0)
  */
  None = 0,

  /**
      the pattern is tiled by repeating (Since 1.0)
  */
  Repeat = 1,

  /**
      the pattern is tiled by reflecting
      at the edges (Since 1.0; but only implemented for surface patterns since 1.6)
  */
  Reflect = 2,

  /**
      pixels outside of the pattern copy
      the closest pixel from the source (Since 1.2; but only
      implemented for surface patterns since 1.6)
  */
  Pad = 3,
}

/**
    #cairo_fill_rule_t is used to select how paths are filled. For both
  fill rules, whether or not a point is included in the fill is
  determined by taking a ray from that point to infinity and looking
  at intersections with the path. The ray can be in any direction,
  as long as it doesn't pass through the end point of a segment
  or have a tricky intersection such as intersecting tangent to the path.
  (Note that filling is not actually implemented in this way. This
  is just a description of the rule that is applied.)
  
  The default fill rule is [cairo.types.FillRule.Winding].
  
  New entries may be added in future versions.
*/
enum FillRule
{
  /**
      If the path crosses the ray from
    left-to-right, counts +1. If the path crosses the ray
    from right to left, counts -1. (Left and right are determined
    from the perspective of looking along the ray from the starting
    point.) If the total count is non-zero, the point will be filled. (Since 1.0)
  */
  Winding = 0,

  /**
      Counts the total number of
    intersections, without regard to the orientation of the contour. If
    the total number of intersections is odd, the point will be
    filled. (Since 1.0)
  */
  EvenOdd = 1,
}

/**
    #cairo_filter_t is used to indicate what filtering should be
  applied when reading pixel values from patterns. See
  [cairo.pattern.Pattern.setFilter] for indicating the desired filter to be
  used with a particular pattern.
*/
enum Filter
{
  /**
      A high-performance filter, with quality similar
        to [cairo.types.Filter.Nearest] (Since 1.0)
  */
  Fast = 0,

  /**
      A reasonable-performance filter, with quality
        similar to [cairo.types.Filter.Bilinear] (Since 1.0)
  */
  Good = 1,

  /**
      The highest-quality available, performance may
        not be suitable for interactive use. (Since 1.0)
  */
  Best = 2,

  /**
      Nearest-neighbor filtering (Since 1.0)
  */
  Nearest = 3,

  /**
      Linear interpolation in two dimensions (Since 1.0)
  */
  Bilinear = 4,

  /**
      This filter value is currently
        unimplemented, and should not be used in current code. (Since 1.0)
  */
  Gaussian = 5,
}

/**
    Specifies variants of a font face based on their slant.
*/
enum FontSlant
{
  /**
      Upright font style, since 1.0
  */
  Normal = 0,

  /**
      Italic font style, since 1.0
  */
  Italic = 1,

  /**
      Oblique font style, since 1.0
  */
  Oblique = 2,
}

/**
    #cairo_font_type_t is used to describe the type of a given font
  face or scaled font. The font types are also known as "font
  backends" within cairo.
  
  The type of a font face is determined by the function used to
  create it, which will generally be of the form
  <function>cairo_<emphasis>type</emphasis>_font_face_create(<!-- -->)</function>.
  The font face type can be queried with [cairo.font_face.FontFace.getFontType]
  
  The various #cairo_font_face_t functions can be used with a font face
  of any type.
  
  The type of a scaled font is determined by the type of the font
  face passed to [cairo.global.scaledFontCreate]. The scaled font type can
  be queried with [cairo.scaled_font.ScaledFont.getFontType]
  
  The various #cairo_scaled_font_t functions can be used with scaled
  fonts of any type, but some font backends also provide
  type-specific functions that must only be called with a scaled font
  of the appropriate type. These functions have names that begin with
  <function>cairo_<emphasis>type</emphasis>_scaled_font(<!-- -->)</function>
  such as cairo_ft_scaled_font_lock_face().
  
  The behavior of calling a type-specific function with a scaled font
  of the wrong type is undefined.
  
  New entries may be added in future versions.
*/
enum FontType
{
  /**
      The font was created using cairo's toy font api (Since: 1.2)
  */
  Toy = 0,

  /**
      The font is of type FreeType (Since: 1.2)
  */
  Ft = 1,

  /**
      The font is of type Win32 (Since: 1.2)
  */
  Win32 = 2,

  /**
      The font is of type Quartz (Since: 1.6, in 1.2 and
    1.4 it was named CAIRO_FONT_TYPE_ATSUI)
  */
  Quartz = 3,

  /**
      The font was create using cairo's user font api (Since: 1.8)
  */
  User = 4,
}

/**
    Specifies variants of a font face based on their weight.
*/
enum FontWeight
{
  /**
      Normal font weight, since 1.0
  */
  Normal = 0,

  /**
      Bold font weight, since 1.0
  */
  Bold = 1,
}

/**
    #cairo_format_t is used to identify the memory format of
  image data.
  
  New entries may be added in future versions.
*/
enum Format
{
  /**
      no such format exists or is supported.
  */
  Invalid = -1,

  /**
      each pixel is a 32-bit quantity, with
      alpha in the upper 8 bits, then red, then green, then blue.
      The 32-bit quantities are stored native-endian. Pre-multiplied
      alpha is used. (That is, 50% transparent red is 0x80800000,
      not 0x80ff0000.) (Since 1.0)
  */
  Argb32 = 0,

  /**
      each pixel is a 32-bit quantity, with
      the upper 8 bits unused. Red, Green, and Blue are stored
      in the remaining 24 bits in that order. (Since 1.0)
  */
  Rgb24 = 1,

  /**
      each pixel is a 8-bit quantity holding
      an alpha value. (Since 1.0)
  */
  A8 = 2,

  /**
      each pixel is a 1-bit quantity holding
      an alpha value. Pixels are packed together into 32-bit
      quantities. The ordering of the bits matches the
      endianness of the platform. On a big-endian machine, the
      first pixel is in the uppermost bit, on a little-endian
      machine the first pixel is in the least-significant bit. (Since 1.0)
  */
  A1 = 3,

  /**
      each pixel is a 16-bit quantity
      with red in the upper 5 bits, then green in the middle
      6 bits, and blue in the lower 5 bits. (Since 1.2)
  */
  Rgb16565 = 4,
}

/**
    Specifies whether to hint font metrics; hinting font metrics
  means quantizing them so that they are integer values in
  device space. Doing this improves the consistency of
  letter and line spacing, however it also means that text
  will be laid out differently at different zoom factors.
*/
enum HintMetrics
{
  /**
      Hint metrics in the default
     manner for the font backend and target device, since 1.0
  */
  Default = 0,

  /**
      Do not hint font metrics, since 1.0
  */
  Off = 1,

  /**
      Hint font metrics, since 1.0
  */
  On = 2,
}

/**
    Specifies the type of hinting to do on font outlines. Hinting
  is the process of fitting outlines to the pixel grid in order
  to improve the appearance of the result. Since hinting outlines
  involves distorting them, it also reduces the faithfulness
  to the original outline shapes. Not all of the outline hinting
  styles are supported by all font backends.
  
  New entries may be added in future versions.
*/
enum HintStyle
{
  /**
      Use the default hint style for
      font backend and target device, since 1.0
  */
  Default = 0,

  /**
      Do not hint outlines, since 1.0
  */
  None = 1,

  /**
      Hint outlines slightly to improve
      contrast while retaining good fidelity to the original
      shapes, since 1.0
  */
  Slight = 2,

  /**
      Hint outlines with medium strength
      giving a compromise between fidelity to the original shapes
      and contrast, since 1.0
  */
  Medium = 3,

  /**
      Hint outlines to maximize contrast, since 1.0
  */
  Full = 4,
}

/**
    Specifies how to render the endpoints of the path when stroking.
  
  The default line cap style is [cairo.types.LineCap.Butt].
*/
enum LineCap
{
  /**
      start(stop) the line exactly at the start(end) point (Since 1.0)
  */
  Butt = 0,

  /**
      use a round ending, the center of the circle is the end point (Since 1.0)
  */
  Round = 1,

  /**
      use squared ending, the center of the square is the end point (Since 1.0)
  */
  Square = 2,
}

/**
    Specifies how to render the junction of two lines when stroking.
  
  The default line join style is [cairo.types.LineJoin.Miter].
*/
enum LineJoin
{
  /**
      use a sharp (angled) corner, see
    [cairo.context.Context.setMiterLimit] (Since 1.0)
  */
  Miter = 0,

  /**
      use a rounded join, the center of the circle is the
    joint point (Since 1.0)
  */
  Round = 1,

  /**
      use a cut-off join, the join is cut off at half
    the line width from the joint point (Since 1.0)
  */
  Bevel = 2,
}

/**
    #cairo_operator_t is used to set the compositing operator for all cairo
  drawing operations.
  
  The default operator is [cairo.types.Operator.Over].
  
  The operators marked as <firstterm>unbounded</firstterm> modify their
  destination even outside of the mask layer (that is, their effect is not
  bound by the mask layer).  However, their effect can still be limited by
  way of clipping.
  
  To keep things simple, the operator descriptions here
  document the behavior for when both source and destination are either fully
  transparent or fully opaque.  The actual implementation works for
  translucent layers too.
  For a more detailed explanation of the effects of each operator, including
  the mathematical definitions, see
  <ulink url="https://cairographics.org/operators/">https://cairographics.org/operators/</ulink>.
*/
enum Operator
{
  /**
      clear destination layer (bounded) (Since 1.0)
  */
  Clear = 0,

  /**
      replace destination layer (bounded) (Since 1.0)
  */
  Source = 1,

  /**
      draw source layer on top of destination layer
    (bounded) (Since 1.0)
  */
  Over = 2,

  /**
      draw source where there was destination content
    (unbounded) (Since 1.0)
  */
  In = 3,

  /**
      draw source where there was no destination
    content (unbounded) (Since 1.0)
  */
  Out = 4,

  /**
      draw source on top of destination content and
    only there (Since 1.0)
  */
  Atop = 5,

  /**
      ignore the source (Since 1.0)
  */
  Dest = 6,

  /**
      draw destination on top of source (Since 1.0)
  */
  DestOver = 7,

  /**
      leave destination only where there was
    source content (unbounded) (Since 1.0)
  */
  DestIn = 8,

  /**
      leave destination only where there was no
    source content (Since 1.0)
  */
  DestOut = 9,

  /**
      leave destination on top of source content
    and only there (unbounded) (Since 1.0)
  */
  DestAtop = 10,

  /**
      source and destination are shown where there is only
    one of them (Since 1.0)
  */
  Xor = 11,

  /**
      source and destination layers are accumulated (Since 1.0)
  */
  Add = 12,

  /**
      like over, but assuming source and dest are
    disjoint geometries (Since 1.0)
  */
  Saturate = 13,

  /**
      source and destination layers are multiplied.
    This causes the result to be at least as dark as the darker inputs. (Since 1.10)
  */
  Multiply = 14,

  /**
      source and destination are complemented and
    multiplied. This causes the result to be at least as light as the lighter
    inputs. (Since 1.10)
  */
  Screen = 15,

  /**
      multiplies or screens, depending on the
    lightness of the destination color. (Since 1.10)
  */
  Overlay = 16,

  /**
      replaces the destination with the source if it
    is darker, otherwise keeps the source. (Since 1.10)
  */
  Darken = 17,

  /**
      replaces the destination with the source if it
    is lighter, otherwise keeps the source. (Since 1.10)
  */
  Lighten = 18,

  /**
      brightens the destination color to reflect
    the source color. (Since 1.10)
  */
  ColorDodge = 19,

  /**
      darkens the destination color to reflect
    the source color. (Since 1.10)
  */
  ColorBurn = 20,

  /**
      Multiplies or screens, dependent on source
    color. (Since 1.10)
  */
  HardLight = 21,

  /**
      Darkens or lightens, dependent on source
    color. (Since 1.10)
  */
  SoftLight = 22,

  /**
      Takes the difference of the source and
    destination color. (Since 1.10)
  */
  Difference = 23,

  /**
      Produces an effect similar to difference, but
    with lower contrast. (Since 1.10)
  */
  Exclusion = 24,

  /**
      Creates a color with the hue of the source
    and the saturation and luminosity of the target. (Since 1.10)
  */
  HslHue = 25,

  /**
      Creates a color with the saturation
    of the source and the hue and luminosity of the target. Painting with
    this mode onto a gray area produces no change. (Since 1.10)
  */
  HslSaturation = 26,

  /**
      Creates a color with the hue and saturation
    of the source and the luminosity of the target. This preserves the gray
    levels of the target and is useful for coloring monochrome images or
    tinting color images. (Since 1.10)
  */
  HslColor = 27,

  /**
      Creates a color with the luminosity of
    the source and the hue and saturation of the target. This produces an
    inverse effect to @CAIRO_OPERATOR_HSL_COLOR. (Since 1.10)
  */
  HslLuminosity = 28,
}

/**
    #cairo_path_data_t is used to describe the type of one portion
  of a path when represented as a #cairo_path_t.
  See #cairo_path_data_t for details.
*/
enum PathDataType
{
  /**
      A move-to operation, since 1.0
  */
  MoveTo = 0,

  /**
      A line-to operation, since 1.0
  */
  LineTo = 1,

  /**
      A curve-to operation, since 1.0
  */
  CurveTo = 2,

  /**
      A close-path operation, since 1.0
  */
  ClosePath = 3,
}

/**
    #cairo_pattern_type_t is used to describe the type of a given pattern.
  
  The type of a pattern is determined by the function used to create
  it. The [cairo.global.patternCreateRgb] and [cairo.global.patternCreateRgba]
  functions create SOLID patterns. The remaining
  cairo_pattern_create<!-- --> functions map to pattern types in obvious
  ways.
  
  The pattern type can be queried with [cairo.pattern.Pattern.getPatternType]
  
  Most #cairo_pattern_t functions can be called with a pattern of any
  type, (though trying to change the extend or filter for a solid
  pattern will have no effect). A notable exception is
  [cairo.pattern.Pattern.addColorStopRgb] and
  [cairo.pattern.Pattern.addColorStopRgba] which must only be called with
  gradient patterns (either LINEAR or RADIAL). Otherwise the pattern
  will be shutdown and put into an error state.
  
  New entries may be added in future versions.
*/
enum PatternType
{
  /**
      The pattern is a solid (uniform)
    color. It may be opaque or translucent, since 1.2.
  */
  Solid = 0,

  /**
      The pattern is a based on a surface (an image), since 1.2.
  */
  Surface = 1,

  /**
      The pattern is a linear gradient, since 1.2.
  */
  Linear = 2,

  /**
      The pattern is a radial gradient, since 1.2.
  */
  Radial = 3,

  /**
      The pattern is a mesh, since 1.12.
  */
  Mesh = 4,
}

/**
    #cairo_pdf_metadata_t is used by the
  [cairo.global.pdfSurfaceSetMetadata] function specify the metadata to set.
*/
enum PdfMetadata
{
  /**
      The document title (Since 1.16)
  */
  Title = 0,

  /**
      The document author (Since 1.16)
  */
  Author = 1,

  /**
      The document subject (Since 1.16)
  */
  Subject = 2,

  /**
      The document keywords (Since 1.16)
  */
  Keywords = 3,

  /**
      The document creator (Since 1.16)
  */
  Creator = 4,

  /**
      The document creation date (Since 1.16)
  */
  CreateDate = 5,

  /**
      The document modification date (Since 1.16)
  */
  ModDate = 6,
}

/**
    #cairo_pdf_outline_flags_t is used by the
  [cairo.global.pdfSurfaceAddOutline] function specify the attributes of
  an outline item. These flags may be bitwise-or'd to produce any
  combination of flags.
*/
enum PdfOutlineFlags
{
  /**
      The outline item defaults to open in the PDF viewer (Since 1.16)
  */
  Open = 1,

  /**
      The outline item is displayed by the viewer in bold text (Since 1.16)
  */
  Bold = 2,

  /**
      The outline item is displayed by the viewer in italic text (Since 1.16)
  */
  Italic = 4,
}

/**
    #cairo_pdf_version_t is used to describe the version number of the PDF
  specification that a generated PDF file will conform to.
*/
enum PdfVersion
{
  /**
      The version 1.4 of the PDF specification. (Since 1.10)
  */
  _4 = 0,

  /**
      The version 1.5 of the PDF specification. (Since 1.10)
  */
  _5 = 1,

  /**
      The version 1.6 of the PDF specification. (Since 1.18)
  */
  _6 = 2,

  /**
      The version 1.7 of the PDF specification. (Since 1.18)
  */
  _7 = 3,
}

/**
    #cairo_ps_level_t is used to describe the language level of the
  PostScript Language Reference that a generated PostScript file will
  conform to.
*/
enum PsLevel
{
  /**
      The language level 2 of the PostScript specification. (Since 1.6)
  */
  _2 = 0,

  /**
      The language level 3 of the PostScript specification. (Since 1.6)
  */
  _3 = 1,
}

/**
    Used as the return value for [cairo.region.Region.containsRectangle].
*/
enum RegionOverlap
{
  /**
      The contents are entirely inside the region. (Since 1.10)
  */
  In = 0,

  /**
      The contents are entirely outside the region. (Since 1.10)
  */
  Out = 1,

  /**
      The contents are partially inside and
        partially outside the region. (Since 1.10)
  */
  Part = 2,
}

/**
    A set of script output variants.
*/
enum ScriptMode
{
  /**
      the output will be in readable text (default). (Since 1.12)
  */
  Ascii = 0,

  /**
      the output will use byte codes. (Since 1.12)
  */
  Binary = 1,
}

/**
    #cairo_status_t is used to indicate errors that can occur when
  using Cairo. In some cases it is returned directly by functions.
  but when using #cairo_t, the last error, if any, is stored in
  the context and can be retrieved with [cairo.context.Context.status].
  
  New entries may be added in future versions.  Use [cairo.global.statusToString]
  to get a human-readable representation of an error message.
*/
enum Status
{
  /**
      no error has occurred (Since 1.0)
  */
  Success = 0,

  /**
      out of memory (Since 1.0)
  */
  NoMemory = 1,

  /**
      [cairo.context.Context.restore] called without matching [cairo.context.Context.save] (Since 1.0)
  */
  InvalidRestore = 2,

  /**
      no saved group to pop, i.e. [cairo.context.Context.popGroup] without matching [cairo.context.Context.pushGroup] (Since 1.0)
  */
  InvalidPopGroup = 3,

  /**
      no current point defined (Since 1.0)
  */
  NoCurrentPoint = 4,

  /**
      invalid matrix (not invertible) (Since 1.0)
  */
  InvalidMatrix = 5,

  /**
      invalid value for an input #cairo_status_t (Since 1.0)
  */
  InvalidStatus = 6,

  /**
      null pointer (Since 1.0)
  */
  NullPointer = 7,

  /**
      input string not valid UTF-8 (Since 1.0)
  */
  InvalidString = 8,

  /**
      input path data not valid (Since 1.0)
  */
  InvalidPathData = 9,

  /**
      error while reading from input stream (Since 1.0)
  */
  ReadError = 10,

  /**
      error while writing to output stream (Since 1.0)
  */
  WriteError = 11,

  /**
      target surface has been finished (Since 1.0)
  */
  SurfaceFinished = 12,

  /**
      the surface type is not appropriate for the operation (Since 1.0)
  */
  SurfaceTypeMismatch = 13,

  /**
      the pattern type is not appropriate for the operation (Since 1.0)
  */
  PatternTypeMismatch = 14,

  /**
      invalid value for an input #cairo_content_t (Since 1.0)
  */
  InvalidContent = 15,

  /**
      invalid value for an input #cairo_format_t (Since 1.0)
  */
  InvalidFormat = 16,

  /**
      invalid value for an input Visual* (Since 1.0)
  */
  InvalidVisual = 17,

  /**
      file not found (Since 1.0)
  */
  FileNotFound = 18,

  /**
      invalid value for a dash setting (Since 1.0)
  */
  InvalidDash = 19,

  /**
      invalid value for a DSC comment (Since 1.2)
  */
  InvalidDscComment = 20,

  /**
      invalid index passed to getter (Since 1.4)
  */
  InvalidIndex = 21,

  /**
      clip region not representable in desired format (Since 1.4)
  */
  ClipNotRepresentable = 22,

  /**
      error creating or writing to a temporary file (Since 1.6)
  */
  TempFileError = 23,

  /**
      invalid value for stride (Since 1.6)
  */
  InvalidStride = 24,

  /**
      the font type is not appropriate for the operation (Since 1.8)
  */
  FontTypeMismatch = 25,

  /**
      the user-font is immutable (Since 1.8)
  */
  UserFontImmutable = 26,

  /**
      error occurred in a user-font callback function (Since 1.8)
  */
  UserFontError = 27,

  /**
      negative number used where it is not allowed (Since 1.8)
  */
  NegativeCount = 28,

  /**
      input clusters do not represent the accompanying text and glyph array (Since 1.8)
  */
  InvalidClusters = 29,

  /**
      invalid value for an input #cairo_font_slant_t (Since 1.8)
  */
  InvalidSlant = 30,

  /**
      invalid value for an input #cairo_font_weight_t (Since 1.8)
  */
  InvalidWeight = 31,

  /**
      invalid value (typically too big) for the size of the input (surface, pattern, etc.) (Since 1.10)
  */
  InvalidSize = 32,

  /**
      user-font method not implemented (Since 1.10)
  */
  UserFontNotImplemented = 33,

  /**
      the device type is not appropriate for the operation (Since 1.10)
  */
  DeviceTypeMismatch = 34,

  /**
      an operation to the device caused an unspecified error (Since 1.10)
  */
  DeviceError = 35,

  /**
      a mesh pattern
      construction operation was used outside of a
      [cairo.global.meshPatternBeginPatch]/[cairo.global.meshPatternEndPatch]
      pair (Since 1.12)
  */
  InvalidMeshConstruction = 36,

  /**
      target device has been finished (Since 1.12)
  */
  DeviceFinished = 37,

  /**
      `CAIRO_MIME_TYPE_JBIG2_GLOBAL_ID` has been used on at least one image
      but no image provided `CAIRO_MIME_TYPE_JBIG2_GLOBAL` (Since 1.14)
  */
  Jbig2GlobalMissing = 38,

  /**
      error occurred in libpng while reading from or writing to a PNG file (Since 1.16)
  */
  PngError = 39,

  /**
      error occurred in libfreetype (Since 1.16)
  */
  FreetypeError = 40,

  /**
      this is a special value indicating the number of
      status values defined in this enumeration.  When using this value, note
      that the version of cairo at run-time may have additional status values
      defined than the value of this symbol at compile-time. (Since 1.10)
  */
  LastStatus = 45,

  /**
      error occurred in the Windows Graphics Device Interface (Since 1.16)
  */
  Win32GdiError = 41,
}

/**
    The subpixel order specifies the order of color elements within
  each pixel on the display device when rendering with an
  antialiasing mode of [cairo.types.Antialias.Subpixel].
*/
enum SubpixelOrder
{
  /**
      Use the default subpixel order for
      for the target device, since 1.0
  */
  Default = 0,

  /**
      Subpixel elements are arranged horizontally
      with red at the left, since 1.0
  */
  Rgb = 1,

  /**
      Subpixel elements are arranged horizontally
      with blue at the left, since 1.0
  */
  Bgr = 2,

  /**
      Subpixel elements are arranged vertically
      with red at the top, since 1.0
  */
  Vrgb = 3,

  /**
      Subpixel elements are arranged vertically
      with blue at the top, since 1.0
  */
  Vbgr = 4,
}

/**
    Whether operations should be recorded.
*/
enum SurfaceObserverMode
{
  /**
      no recording is done
  */
  Normal = 0,

  /**
      operations are recorded
  */
  RecordOperations = 1,
}

/**
    #cairo_surface_type_t is used to describe the type of a given
  surface. The surface types are also known as "backends" or "surface
  backends" within cairo.
  
  The type of a surface is determined by the function used to create
  it, which will generally be of the form
  <function>cairo_<emphasis>type</emphasis>_surface_create(<!-- -->)</function>,
  (though see [cairo.surface.Surface.createSimilar] as well).
  
  The surface type can be queried with [cairo.surface.Surface.getSurfaceType]
  
  The various #cairo_surface_t functions can be used with surfaces of
  any type, but some backends also provide type-specific functions
  that must only be called with a surface of the appropriate
  type. These functions have names that begin with
  <literal>cairo_<emphasis>type</emphasis>_surface</literal> such as [cairo.global.imageSurfaceGetWidth].
  
  The behavior of calling a type-specific function with a surface of
  the wrong type is undefined.
  
  New entries may be added in future versions.
*/
enum SurfaceType
{
  /**
      The surface is of type image, since 1.2
  */
  Image = 0,

  /**
      The surface is of type pdf, since 1.2
  */
  Pdf = 1,

  /**
      The surface is of type ps, since 1.2
  */
  Ps = 2,

  /**
      The surface is of type xlib, since 1.2
  */
  Xlib = 3,

  /**
      The surface is of type xcb, since 1.2
  */
  Xcb = 4,

  /**
      The surface is of type glitz, since 1.2, deprecated 1.18
      (glitz support have been removed, this surface type will never be set by cairo)
  */
  Glitz = 5,

  /**
      The surface is of type quartz, since 1.2
  */
  Quartz = 6,

  /**
      The surface is of type win32, since 1.2
  */
  Win32 = 7,

  /**
      The surface is of type beos, since 1.2, deprecated 1.18
      (beos support have been removed, this surface type will never be set by cairo)
  */
  Beos = 8,

  /**
      The surface is of type directfb, since 1.2, deprecated 1.18
      (directfb support have been removed, this surface type will never be set by cairo)
  */
  Directfb = 9,

  /**
      The surface is of type svg, since 1.2
  */
  Svg = 10,

  /**
      The surface is of type os2, since 1.4, deprecated 1.18
      (os2 support have been removed, this surface type will never be set by cairo)
  */
  Os2 = 11,

  /**
      The surface is a win32 printing surface, since 1.6
  */
  Win32Printing = 12,

  /**
      The surface is of type quartz_image, since 1.6
  */
  QuartzImage = 13,

  /**
      The surface is of type script, since 1.10
  */
  Script = 14,

  /**
      The surface is of type Qt, since 1.10, deprecated 1.18
      (Ot support have been removed, this surface type will never be set by cairo)
  */
  Qt = 15,

  /**
      The surface is of type recording, since 1.10
  */
  Recording = 16,

  /**
      The surface is a OpenVG surface, since 1.10, deprecated 1.18
      (OpenVG support have been removed, this surface type will never be set by cairo)
  */
  Vg = 17,

  /**
      The surface is of type OpenGL, since 1.10, deprecated 1.18
      (OpenGL support have been removed, this surface type will never be set by cairo)
  */
  Gl = 18,

  /**
      The surface is of type Direct Render Manager, since 1.10, deprecated 1.18
      (DRM support have been removed, this surface type will never be set by cairo)
  */
  Drm = 19,

  /**
      The surface is of type 'tee' (a multiplexing surface), since 1.10
  */
  Tee = 20,

  /**
      The surface is of type XML (for debugging), since 1.10
  */
  Xml = 21,

  /**
      The surface is of type Skia, since 1.10, deprecated 1.18
      (Skia support have been removed, this surface type will never be set by cairo)
  */
  Skia = 22,
}

/**
    #cairo_svg_unit_t is used to describe the units valid for coordinates and
  lengths in the SVG specification.
  
  See also:
  $(LIST
    * [SVG Units](https://www.w3.org/TR/SVG/coords.html#Units)
    * [SVG Types](https://www.w3.org/TR/SVG/types.html#DataTypeLength)
    * [CSS Length](https://www.w3.org/TR/css-values-3/#lengths)
  )
*/
enum SvgUnit
{
  /**
      User unit, a value in the current coordinate system.
      If used in the root element for the initial coordinate systems it
      corresponds to pixels. (Since 1.16)
  */
  User = 0,

  /**
      The size of the element's font. (Since 1.16)
  */
  Em = 1,

  /**
      The x-height of the element’s font. (Since 1.16)
  */
  Ex = 2,

  /**
      Pixels (1px = 1/96th of 1in). (Since 1.16)
  */
  Px = 3,

  /**
      Inches (1in = 2.54cm = 96px). (Since 1.16)
  */
  In = 4,

  /**
      Centimeters (1cm = 96px/2.54). (Since 1.16)
  */
  Cm = 5,

  /**
      Millimeters (1mm = 1/10th of 1cm). (Since 1.16)
  */
  Mm = 6,

  /**
      Points (1pt = 1/72th of 1in). (Since 1.16)
  */
  Pt = 7,

  /**
      Picas (1pc = 1/6th of 1in). (Since 1.16)
  */
  Pc = 8,

  /**
      Percent, a value that is some fraction of another
      reference value. (Since 1.16)
  */
  Percent = 9,
}

/**
    #cairo_svg_version_t is used to describe the version number of the SVG
  specification that a generated SVG file will conform to.
*/
enum SvgVersion
{
  /**
      The version 1.1 of the SVG specification. (Since 1.2)
  */
  _1 = 0,

  /**
      The version 1.2 of the SVG specification. (Since 1.2)
  */
  _2 = 1,
}

/**
    Specifies properties of a text cluster mapping.
*/
enum TextClusterFlags
{
  /**
      The clusters in the cluster array
    map to glyphs in the glyph array from end to start. (Since 1.8)
  */
  Backward = 1,
}

/**
    The default color palette index.
*/
enum COLOR_PALETTE_DEFAULT = 0;

/**
    Group 3 or Group 4 CCITT facsimile encoding (International
  Telecommunication Union, Recommendations T.4 and T.6.)
*/
enum MIME_TYPE_CCITT_FAX = "image/g3fax";

/**
    Decode parameters for Group 3 or Group 4 CCITT facsimile encoding.
  See [CCITT Fax Images][ccitt].
*/
enum MIME_TYPE_CCITT_FAX_PARAMS = "application/x-cairo.ccitt.params";

/**
    Encapsulated PostScript file.
  [Encapsulated PostScript File Format Specification](http://wwwimages.adobe.com/content/dam/Adobe/endevnet/postscript/pdfs/5002.EPSF_Spec.pdf)
*/
enum MIME_TYPE_EPS = "application/postscript";

/**
    Embedding parameters Encapsulated PostScript data.
  See [Embedding EPS files][eps].
*/
enum MIME_TYPE_EPS_PARAMS = "application/x-cairo.eps.params";

/**
    Joint Bi-level Image Experts Group image coding standard (ISO/IEC 11544).
*/
enum MIME_TYPE_JBIG2 = "application/x-cairo.jbig2";

/**
    Joint Bi-level Image Experts Group image coding standard (ISO/IEC 11544) global segment.
*/
enum MIME_TYPE_JBIG2_GLOBAL = "application/x-cairo.jbig2-global";

/**
    An unique identifier shared by a JBIG2 global segment and all JBIG2 images
  that depend on the global segment.
*/
enum MIME_TYPE_JBIG2_GLOBAL_ID = "application/x-cairo.jbig2-global-id";

/**
    The Joint Photographic Experts Group (JPEG) 2000 image coding standard (ISO/IEC 15444-1).
*/
enum MIME_TYPE_JP2 = "image/jp2";

/**
    The Joint Photographic Experts Group (JPEG) image coding standard (ISO/IEC 10918-1).
*/
enum MIME_TYPE_JPEG = "image/jpeg";

/**
    The Portable Network Graphics image file format (ISO/IEC 15948).
*/
enum MIME_TYPE_PNG = "image/png";

/**
    Unique identifier for a surface (cairo specific MIME type). All surfaces with
  the same unique identifier will only be embedded once.
*/
enum MIME_TYPE_UNIQUE_ID = "application/x-cairo.uuid";

/**
    URI for an image file (unofficial MIME type).
*/
enum MIME_TYPE_URI = "text/x-uri";

/**
    The root outline item in [cairo.global.pdfSurfaceAddOutline].
*/
enum PDF_OUTLINE_ROOT = 0;

/**
    Create a content tag.
*/
enum TAG_CONTENT = "cairo.content";

/**
    Create a content reference tag.
*/
enum TAG_CONTENT_REF = "cairo.content_ref";

/**
    Create a destination for a hyperlink. Destination tag attributes
  are detailed at [Destinations][dest].
*/
enum TAG_DEST = "cairo.dest";

/**
    Create hyperlink. Link tag attributes are detailed at
  [Links][link].
*/
enum TAG_LINK = "Link";
