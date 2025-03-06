module cairo.c.types;

public import gid.basictypes;
public import gobject.c.types;
public import freetype2.c.types;
import cairo.types;

/**
    #cairo_bool_t is used for boolean values. Returns of type
  #cairo_bool_t will always be either 0 or 1, but testing against
  these values explicitly is not encouraged; just use the
  value as a boolean condition.
  
  <informalexample><programlisting>
   if (cairo_in_stroke (cr, x, y)) {
       /<!-- -->* do something *<!-- -->/
   }
  </programlisting></informalexample>
*/
alias cairo_bool_t = int;


// Enums
alias cairo_antialias_t = cairo.types.Antialias;
alias cairo_color_mode_t = cairo.types.ColorMode;
alias cairo_content_t = cairo.types.Content;
alias cairo_device_type_t = cairo.types.DeviceType;
alias cairo_dither_t = cairo.types.Dither;
alias cairo_extend_t = cairo.types.Extend;
alias cairo_fill_rule_t = cairo.types.FillRule;
alias cairo_filter_t = cairo.types.Filter;
alias cairo_font_slant_t = cairo.types.FontSlant;
alias cairo_font_type_t = cairo.types.FontType;
alias cairo_font_weight_t = cairo.types.FontWeight;
alias cairo_format_t = cairo.types.Format;
alias cairo_hint_metrics_t = cairo.types.HintMetrics;
alias cairo_hint_style_t = cairo.types.HintStyle;
alias cairo_line_cap_t = cairo.types.LineCap;
alias cairo_line_join_t = cairo.types.LineJoin;
alias cairo_operator_t = cairo.types.Operator;
alias cairo_path_data_type_t = cairo.types.PathDataType;
alias cairo_pattern_type_t = cairo.types.PatternType;
alias cairo_pdf_metadata_t = cairo.types.PdfMetadata;
alias cairo_pdf_outline_flags_t = cairo.types.PdfOutlineFlags;
alias cairo_pdf_version_t = cairo.types.PdfVersion;
alias cairo_ps_level_t = cairo.types.PsLevel;
alias cairo_region_overlap_t = cairo.types.RegionOverlap;
alias cairo_script_mode_t = cairo.types.ScriptMode;
alias cairo_status_t = cairo.types.Status;
alias cairo_subpixel_order_t = cairo.types.SubpixelOrder;
alias cairo_surface_observer_mode_t = cairo.types.SurfaceObserverMode;
alias cairo_surface_type_t = cairo.types.SurfaceType;
alias cairo_svg_unit_t = cairo.types.SvgUnit;
alias cairo_svg_version_t = cairo.types.SvgVersion;
alias cairo_text_cluster_flags_t = cairo.types.TextClusterFlags;
/**
    A #cairo_t contains the current state of the rendering device,
  including coordinates of yet to be drawn shapes.
  
  Cairo contexts, as #cairo_t objects are named, are central to
  cairo and all drawing with cairo is always done to a #cairo_t
  object.
  
  Memory management of #cairo_t is done with
  [cairo.global.reference] and [cairo.global.destroy].
*/
struct cairo_t;

/**
    A #cairo_device_t represents the driver interface for drawing
  operations to a #cairo_surface_t.  There are different subtypes of
  #cairo_device_t for different drawing backends.
  
  The type of a device can be queried with [cairo.device.Device.getDeviceType].
  
  Memory management of #cairo_device_t is done with
  [cairo.device.Device.reference] and [cairo.device.Device.destroy].
*/
struct cairo_device_t;

/**
    The #cairo_font_extents_t structure stores metric information for
  a font. Values are given in the current user-space coordinate
  system.
  
  Because font metrics are in user-space coordinates, they are
  mostly, but not entirely, independent of the current transformation
  matrix. If you call <literal>cairo_scale(cr, 2.0, 2.0)</literal>,
  text will be drawn twice as big, but the reported text extents will
  not be doubled. They will change slightly due to hinting (so you
  can't assume that metrics are independent of the transformation
  matrix), but otherwise will remain unchanged.
*/
struct cairo_font_extents_t
{
  /**
      the distance that the font extends above the baseline.
             Note that this is not always exactly equal to the maximum
             of the extents of all the glyphs in the font, but rather
             is picked to express the font designer's intent as to
             how the font should align with elements above it.
  */
  double ascent;

  /**
      the distance that the font extends below the baseline.
              This value is positive for typical fonts that include
              portions below the baseline. Note that this is not always
              exactly equal to the maximum of the extents of all the
              glyphs in the font, but rather is picked to express the
              font designer's intent as to how the font should
              align with elements below it.
  */
  double descent;

  /**
      the recommended vertical distance between baselines when
             setting consecutive lines of text with the font. This
             is greater than @ascent+@descent by a
             quantity known as the <firstterm>line spacing</firstterm>
             or <firstterm>external leading</firstterm>. When space
             is at a premium, most fonts can be set with only
             a distance of @ascent+@descent between lines.
  */
  double height;

  /**
      the maximum distance in the X direction that
            the origin is advanced for any glyph in the font.
  */
  double maxXAdvance;

  /**
      the maximum distance in the Y direction that
            the origin is advanced for any glyph in the font.
            This will be zero for normal fonts used for horizontal
            writing. (The scripts of East Asia are sometimes written
            vertically.)
  */
  double maxYAdvance;
}

/**
    A #cairo_font_face_t specifies all aspects of a font other
  than the size or font matrix (a font matrix is used to distort
  a font by shearing it or scaling it unequally in the two
  directions) . A font face can be set on a #cairo_t by using
  [cairo.context.Context.setFontFace]; the size and font matrix are set with
  [cairo.context.Context.setFontSize] and [cairo.context.Context.setFontMatrix].
  
  There are various types of font faces, depending on the
  <firstterm>font backend</firstterm> they use. The type of a
  font face can be queried using [cairo.font_face.FontFace.getFontType].
  
  Memory management of #cairo_font_face_t is done with
  [cairo.font_face.FontFace.reference] and [cairo.font_face.FontFace.destroy].
*/
struct cairo_font_face_t;

/**
    An opaque structure holding all options that are used when
  rendering fonts.
  
  Individual features of a #cairo_font_options_t can be set or
  accessed using functions named
  <function>cairo_font_options_set_<emphasis>feature_name</emphasis>()</function> and
  <function>cairo_font_options_get_<emphasis>feature_name</emphasis>()</function>, like
  [cairo.font_options.FontOptions.setAntialias] and
  [cairo.font_options.FontOptions.getAntialias].
  
  New features may be added to a #cairo_font_options_t in the
  future.  For this reason, [cairo.font_options.FontOptions.copy],
  [cairo.font_options.FontOptions.equal], [cairo.font_options.FontOptions.merge], and
  [cairo.font_options.FontOptions.hash] should be used to copy, check
  for equality, merge, or compute a hash value of
  #cairo_font_options_t objects.
*/
struct cairo_font_options_t;

/**
    The #cairo_glyph_t structure holds information about a single glyph
  when drawing or measuring text. A font is (in simple terms) a
  collection of shapes used to draw text. A glyph is one of these
  shapes. There can be multiple glyphs for a single character
  (alternates to be used in different contexts, for example), or a
  glyph can be a <firstterm>ligature</firstterm> of multiple
  characters. Cairo doesn't expose any way of converting input text
  into glyphs, so in order to use the Cairo interfaces that take
  arrays of glyphs, you must directly access the appropriate
  underlying font system.
  
  Note that the offsets given by @x and @y are not cumulative. When
  drawing or measuring text, each glyph is individually positioned
  with respect to the overall origin
*/
struct cairo_glyph_t
{
  /**
      glyph index in the font. The exact interpretation of the
         glyph index depends on the font technology being used.
  */
  gulong index;

  /**
      the offset in the X direction between the origin used for
        drawing or measuring the string and the origin of this glyph.
  */
  double x;

  /**
      the offset in the Y direction between the origin used for
        drawing or measuring the string and the origin of this glyph.
  */
  double y;
}

/**
    A #cairo_matrix_t holds an affine transformation, such as a scale,
  rotation, shear, or a combination of those. The transformation of
  a point (x, y) is given by:
  <programlisting>
      x_new = xx * x + xy * y + x0;
      y_new = yx * x + yy * y + y0;
  </programlisting>
*/
struct cairo_matrix_t
{
  /**
      xx component of the affine transformation
  */
  double xx;

  /**
      yx component of the affine transformation
  */
  double yx;

  /**
      xy component of the affine transformation
  */
  double xy;

  /**
      yy component of the affine transformation
  */
  double yy;

  /**
      X translation component of the affine transformation
  */
  double x0;

  /**
      Y translation component of the affine transformation
  */
  double y0;
}

/**
    A data structure for holding a path. This data structure serves as
  the return value for [cairo.context.Context.copyPath] and
  [cairo.context.Context.copyPathFlat] as well the input value for
  [cairo.context.Context.appendPath].
  
  See #cairo_path_data_t for hints on how to iterate over the
  actual data within the path.
  
  The num_data member gives the number of elements in the data
  array. This number is larger than the number of independent path
  portions (defined in #cairo_path_data_type_t), since the data
  includes both headers and coordinates for each portion.
*/
struct cairo_path_t
{
  /**
      the current error status
  */
  cairo_status_t status;

  /**
      the elements in the path
  */
  cairo_path_data_t* data;

  /**
      the number of elements in the data array
  */
  int numData;
}

/**
    #cairo_path_data_t is used to represent the path data inside a
  #cairo_path_t.
  
  The data structure is designed to try to balance the demands of
  efficiency and ease-of-use. A path is represented as an array of
  #cairo_path_data_t, which is a union of headers and points.
  
  Each portion of the path is represented by one or more elements in
  the array, (one header followed by 0 or more points). The length
  value of the header is the number of array elements for the current
  portion including the header, (ie. length == 1 + # of points), and
  where the number of points for each element type is as follows:
  
  <programlisting>
      [cairo.types.PathDataType.MoveTo]:     1 point
      [cairo.types.PathDataType.LineTo]:     1 point
      [cairo.types.PathDataType.CurveTo]:    3 points
      [cairo.types.PathDataType.ClosePath]:  0 points
  </programlisting>
  
  The semantics and ordering of the coordinate values are consistent
  with [cairo.context.Context.moveTo], [cairo.context.Context.lineTo], [cairo.context.Context.curveTo], and
  [cairo.context.Context.closePath].
  
  Here is sample code for iterating through a #cairo_path_t:
  
  <informalexample><programlisting>
       int i;
       cairo_path_t *path;
       cairo_path_data_t *data;
  &nbsp;
       path = cairo_copy_path (cr);
  &nbsp;
       for (i=0; i < path->num_data; i += path->data[i].header.length) {
           data = &amp;path->data[i];
           switch (data->header.type) {
           case CAIRO_PATH_MOVE_TO:
               do_move_to_things (data[1].point.x, data[1].point.y);
               break;
           case CAIRO_PATH_LINE_TO:
               do_line_to_things (data[1].point.x, data[1].point.y);
               break;
           case CAIRO_PATH_CURVE_TO:
               do_curve_to_things (data[1].point.x, data[1].point.y,
                                   data[2].point.x, data[2].point.y,
                                   data[3].point.x, data[3].point.y);
               break;
           case CAIRO_PATH_CLOSE_PATH:
               do_close_path_things ();
               break;
           }
       }
       cairo_path_destroy (path);
  </programlisting></informalexample>
  
  As of cairo 1.4, cairo does not mind if there are more elements in
  a portion of the path than needed.  Such elements can be used by
  users of the cairo API to hold extra values in the path data
  structure.  For this reason, it is recommended that applications
  always use <literal>data->header.length</literal> to
  iterate over the path data, instead of hardcoding the number of
  elements for each element type.
*/
union cairo_path_data_t
{
  /** */
  /** */
  struct HeaderType
  {
    /** */
    cairo_path_data_type_t type;

    /** */
    int length;
  }

  HeaderType header;

  /** */
  /** */
  struct PointType
  {
    /** */
    double x;

    /** */
    double y;
  }

  PointType point;
}

/**
    A #cairo_pattern_t represents a source when drawing onto a
  surface. There are different subtypes of #cairo_pattern_t,
  for different types of sources; for example,
  [cairo.global.patternCreateRgb] creates a pattern for a solid
  opaque color.
  
  Other than various
  <function>cairo_pattern_create_<emphasis>type</emphasis>()</function>
  functions, some of the pattern types can be implicitly created using various
  <function>cairo_set_source_<emphasis>type</emphasis>()</function> functions;
  for example [cairo.context.Context.setSourceRgb].
  
  The type of a pattern can be queried with [cairo.pattern.Pattern.getPatternType].
  
  Memory management of #cairo_pattern_t is done with
  [cairo.pattern.Pattern.reference] and [cairo.pattern.Pattern.destroy].
*/
struct cairo_pattern_t;

/**
    A data structure for holding a rectangle.
*/
struct cairo_rectangle_t
{
  /**
      X coordinate of the left side of the rectangle
  */
  double x;

  /**
      Y coordinate of the top side of the rectangle
  */
  double y;

  /**
      width of the rectangle
  */
  double width;

  /**
      height of the rectangle
  */
  double height;
}

/**
    A data structure for holding a rectangle with integer coordinates.
*/
struct cairo_rectangle_int_t
{
  /**
      X coordinate of the left side of the rectangle
  */
  int x;

  /**
      Y coordinate of the top side of the rectangle
  */
  int y;

  /**
      width of the rectangle
  */
  int width;

  /**
      height of the rectangle
  */
  int height;
}

/**
    A data structure for holding a dynamically allocated
  array of rectangles.
*/
struct cairo_rectangle_list_t
{
  /**
      Error status of the rectangle list
  */
  cairo_status_t status;

  /**
      Array containing the rectangles
  */
  cairo_rectangle_t* rectangles;

  /**
      Number of rectangles in this list
  */
  int numRectangles;
}

/**
    A #cairo_region_t represents a set of integer-aligned rectangles.
  
  It allows set-theoretical operations like [cairo.region.Region.union_] and
  [cairo.region.Region.intersect] to be performed on them.
  
  Memory management of #cairo_region_t is done with
  [cairo.region.Region.reference] and [cairo.region.Region.destroy].
*/
struct cairo_region_t;

/**
    A #cairo_scaled_font_t is a font scaled to a particular size and device
  resolution. A #cairo_scaled_font_t is most useful for low-level font
  usage where a library or application wants to cache a reference
  to a scaled font to speed up the computation of metrics.
  
  There are various types of scaled fonts, depending on the
  <firstterm>font backend</firstterm> they use. The type of a
  scaled font can be queried using [cairo.scaled_font.ScaledFont.getFontType].
  
  Memory management of #cairo_scaled_font_t is done with
  [cairo.scaled_font.ScaledFont.reference] and [cairo.scaled_font.ScaledFont.destroy].
*/
struct cairo_scaled_font_t;

/**
    A #cairo_surface_t represents an image, either as the destination
  of a drawing operation or as source when drawing onto another
  surface.  To draw to a #cairo_surface_t, create a cairo context
  with the surface as the target, using [cairo.global.create].
  
  There are different subtypes of #cairo_surface_t for
  different drawing backends; for example, [cairo.global.imageSurfaceCreate]
  creates a bitmap image in memory.
  The type of a surface can be queried with [cairo.surface.Surface.getSurfaceType].
  
  The initial contents of a surface after creation depend upon the manner
  of its creation. If cairo creates the surface and backing storage for
  the user, it will be initially cleared; for example,
  [cairo.global.imageSurfaceCreate] and [cairo.surface.Surface.createSimilar].
  Alternatively, if the user passes in a reference to some backing storage
  and asks cairo to wrap that in a #cairo_surface_t, then the contents are
  not modified; for example, [cairo.global.imageSurfaceCreateForData] and
  cairo_xlib_surface_create().
  
  Memory management of #cairo_surface_t is done with
  [cairo.surface.Surface.reference] and [cairo.surface.Surface.destroy].
*/
struct cairo_surface_t;

/**
    The #cairo_text_cluster_t structure holds information about a single
  <firstterm>text cluster</firstterm>.  A text cluster is a minimal
  mapping of some glyphs corresponding to some UTF-8 text.
  
  For a cluster to be valid, both @num_bytes and @num_glyphs should
  be non-negative, and at least one should be non-zero.
  Note that clusters with zero glyphs are not as well supported as
  normal clusters.  For example, PDF rendering applications typically
  ignore those clusters when PDF text is being selected.
  
  See [cairo.context.Context.showTextGlyphs] for how clusters are used in advanced
  text operations.
*/
struct cairo_text_cluster_t
{
  /**
      the number of bytes of UTF-8 text covered by cluster
  */
  int numBytes;

  /**
      the number of glyphs covered by cluster
  */
  int numGlyphs;
}

/**
    The #cairo_text_extents_t structure stores the extents of a single
  glyph or a string of glyphs in user-space coordinates. Because text
  extents are in user-space coordinates, they are mostly, but not
  entirely, independent of the current transformation matrix. If you call
  <literal>cairo_scale(cr, 2.0, 2.0)</literal>, text will
  be drawn twice as big, but the reported text extents will not be
  doubled. They will change slightly due to hinting (so you can't
  assume that metrics are independent of the transformation matrix),
  but otherwise will remain unchanged.
*/
struct cairo_text_extents_t
{
  /**
      the horizontal distance from the origin to the
      leftmost part of the glyphs as drawn. Positive if the
      glyphs lie entirely to the right of the origin.
  */
  double xBearing;

  /**
      the vertical distance from the origin to the
      topmost part of the glyphs as drawn. Positive only if the
      glyphs lie completely below the origin; will usually be
      negative.
  */
  double yBearing;

  /**
      width of the glyphs as drawn
  */
  double width;

  /**
      height of the glyphs as drawn
  */
  double height;

  /**
      distance to advance in the X direction
       after drawing these glyphs
  */
  double xAdvance;

  /**
      distance to advance in the Y direction
      after drawing these glyphs. Will typically be zero except
      for vertical text layout as found in East-Asian languages.
  */
  double yAdvance;
}

/**
    #cairo_user_data_key_t is used for attaching user data to cairo
  data structures.  The actual contents of the struct is never used,
  and there is no need to initialize the object; only the unique
  address of a #cairo_data_key_t object is used.  Typically, you
  would just use the address of a static #cairo_data_key_t object.
*/
struct cairo_user_data_key_t
{
  /**
      not used; ignore.
  */
  int unused;
}

alias extern(C) void function(void* data) cairo_destroy_func_t;

alias extern(C) cairo_surface_t* function(cairo_pattern_t* pattern, void* callbackData, cairo_surface_t* target, const(cairo_rectangle_int_t)* extents) cairo_raster_source_acquire_func_t;

alias extern(C) cairo_status_t function(cairo_pattern_t* pattern, void* callbackData, const(cairo_pattern_t)* other) cairo_raster_source_copy_func_t;

alias extern(C) void function(cairo_pattern_t* pattern, void* callbackData) cairo_raster_source_finish_func_t;

alias extern(C) void function(cairo_pattern_t* pattern, void* callbackData, cairo_surface_t* surface) cairo_raster_source_release_func_t;

alias extern(C) cairo_status_t function(cairo_pattern_t* pattern, void* callbackData) cairo_raster_source_snapshot_func_t;

alias extern(C) cairo_status_t function(void* closure, ubyte* data, uint length) cairo_read_func_t;

alias extern(C) void function(cairo_surface_t* observer, cairo_surface_t* target, void* data) cairo_surface_observer_callback_t;

alias extern(C) cairo_status_t function(cairo_scaled_font_t* scaledFont, cairo_t* cr, cairo_font_extents_t* extents) cairo_user_scaled_font_init_func_t;

alias extern(C) cairo_status_t function(cairo_scaled_font_t* scaledFont, gulong glyph, cairo_t* cr, cairo_text_extents_t* extents) cairo_user_scaled_font_render_glyph_func_t;

alias extern(C) cairo_status_t function(cairo_scaled_font_t* scaledFont, const(char)* utf8, int utf8Len, cairo_glyph_t** glyphs, int* numGlyphs, cairo_text_cluster_t** clusters, int* numClusters, cairo_text_cluster_flags_t* clusterFlags) cairo_user_scaled_font_text_to_glyphs_func_t;

alias extern(C) cairo_status_t function(cairo_scaled_font_t* scaledFont, gulong unicode, gulong* glyphIndex) cairo_user_scaled_font_unicode_to_glyph_func_t;

alias extern(C) cairo_status_t function(void* closure, const(ubyte)* data, uint length) cairo_write_func_t;

