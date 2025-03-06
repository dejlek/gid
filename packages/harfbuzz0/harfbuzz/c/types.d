module harfbuzz.c.types;

public import gid.basictypes;
public import gobject.c.types;
public import freetype2.c.types;
import harfbuzz.types;

/**
    Data type for booleans.
*/
alias hb_bool_t = int;

/**
    Data type for holding Unicode codepoints. Also
  used to hold glyph IDs.
*/
alias hb_codepoint_t = uint;

/**
    Data type for holding color values. Colors are eight bits per
  channel RGB plus alpha transparency.
*/
alias hb_color_t = uint;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the extents for a font, for horizontal-direction
  text segments. Extents must be returned in an #hb_glyph_extents output
  parameter.
*/
alias hb_font_get_font_h_extents_func_t = hb_font_get_font_extents_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the extents for a font, for vertical-direction
  text segments. Extents must be returned in an #hb_glyph_extents output
  parameter.
*/
alias hb_font_get_font_v_extents_func_t = hb_font_get_font_extents_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the advance for a specified glyph, in
  horizontal-direction text segments. Advances must be returned in
  an #hb_position_t output parameter.
*/
alias hb_font_get_glyph_h_advance_func_t = hb_font_get_glyph_advance_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the advances for a sequence of glyphs, in
  horizontal-direction text segments.
*/
alias hb_font_get_glyph_h_advances_func_t = hb_font_get_glyph_advances_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the kerning-adjustment value for a glyph-pair in
  the specified font, for horizontal text segments.
*/
alias hb_font_get_glyph_h_kerning_func_t = hb_font_get_glyph_kerning_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the (X,Y) coordinates (in font units) of the
  origin for a glyph, for horizontal-direction text segments. Each
  coordinate must be returned in an #hb_position_t output parameter.
*/
alias hb_font_get_glyph_h_origin_func_t = hb_font_get_glyph_origin_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the advance for a specified glyph, in
  vertical-direction text segments. Advances must be returned in
  an #hb_position_t output parameter.
*/
alias hb_font_get_glyph_v_advance_func_t = hb_font_get_glyph_advance_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the advances for a sequence of glyphs, in
  vertical-direction text segments.
*/
alias hb_font_get_glyph_v_advances_func_t = hb_font_get_glyph_advances_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the kerning-adjustment value for a glyph-pair in
  the specified font, for vertical text segments.
*/
alias hb_font_get_glyph_v_kerning_func_t = hb_font_get_glyph_kerning_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the (X,Y) coordinates (in font units) of the
  origin for a glyph, for vertical-direction text segments. Each coordinate
  must be returned in an #hb_position_t output parameter.
*/
alias hb_font_get_glyph_v_origin_func_t = hb_font_get_glyph_origin_func_t;

/**
    Data type for bitmasks.
*/
alias hb_mask_t = uint;

/**
    An integral type representing an OpenType 'name' table name identifier.
  There are predefined name IDs, as well as name IDs return from other
  API.  These can be used to fetch name strings from a font face.
*/
alias hb_ot_name_id_t = uint;

/**
    Data type for holding a single coordinate value.
  Contour points and other multi-dimensional data are
  stored as tuples of #hb_position_t's.
*/
alias hb_position_t = int;

/**
    Data type for tag identifiers. Tags are four
  byte integers, each byte representing a character.
  
  Tags are used to identify tables, design-variation axes,
  scripts, languages, font features, and baselines with
  human-readable names.
*/
alias hb_tag_t = uint;


// Enums
alias hb_aat_layout_feature_selector_t = harfbuzz.types.AatLayoutFeatureSelector;
alias hb_aat_layout_feature_type_t = harfbuzz.types.AatLayoutFeatureType;
alias hb_buffer_cluster_level_t = harfbuzz.types.BufferClusterLevel;
alias hb_buffer_content_type_t = harfbuzz.types.BufferContentType;
alias hb_buffer_diff_flags_t = harfbuzz.types.BufferDiffFlags;
alias hb_buffer_flags_t = harfbuzz.types.BufferFlags;
alias hb_buffer_serialize_flags_t = harfbuzz.types.BufferSerializeFlags;
alias hb_buffer_serialize_format_t = harfbuzz.types.BufferSerializeFormat;
alias hb_direction_t = harfbuzz.types.Direction;
alias hb_glyph_flags_t = harfbuzz.types.GlyphFlags;
alias hb_memory_mode_t = harfbuzz.types.MemoryMode;
alias hb_ot_color_palette_flags_t = harfbuzz.types.OtColorPaletteFlags;
alias hb_ot_layout_baseline_tag_t = harfbuzz.types.OtLayoutBaselineTag;
alias hb_ot_layout_glyph_class_t = harfbuzz.types.OtLayoutGlyphClass;
alias hb_ot_math_constant_t = harfbuzz.types.OtMathConstant;
alias hb_ot_math_glyph_part_flags_t = harfbuzz.types.OtMathGlyphPartFlags;
alias hb_ot_math_kern_t = harfbuzz.types.OtMathKern;
alias hb_ot_meta_tag_t = harfbuzz.types.OtMetaTag;
alias hb_ot_metrics_tag_t = harfbuzz.types.OtMetricsTag;
alias hb_ot_name_id_predefined_t = harfbuzz.types.OtNameIdPredefined;
alias hb_ot_var_axis_flags_t = harfbuzz.types.OtVarAxisFlags;
alias hb_paint_composite_mode_t = harfbuzz.types.PaintCompositeMode;
alias hb_paint_extend_t = harfbuzz.types.PaintExtend;
alias hb_script_t = harfbuzz.types.Script;
alias hb_style_tag_t = harfbuzz.types.StyleTag;
alias hb_unicode_combining_class_t = harfbuzz.types.UnicodeCombiningClass;
alias hb_unicode_general_category_t = harfbuzz.types.UnicodeGeneralCategory;
/**
    Structure representing a setting for an #hb_aat_layout_feature_type_t.
*/
struct hb_aat_layout_feature_selector_info_t
{
  /**
      The selector's name identifier
  */
  hb_ot_name_id_t nameId;

  /**
      The value to turn the selector on
  */
  hb_aat_layout_feature_selector_t enable;

  /**
      The value to turn the selector off
  */
  hb_aat_layout_feature_selector_t disable;

  /** */
  uint reserved;
}

/**
    Data type for blobs. A blob wraps a chunk of binary
  data and facilitates its lifecycle management between
  a client program and HarfBuzz.
*/
struct hb_blob_t;

/**
    The main structure holding the input text and its properties before shaping,
  and output glyphs and their information after shaping.
*/
struct hb_buffer_t;

/**
    A struct containing color information for a gradient.
*/
struct hb_color_line_t
{
  /** */
  void* data;

  /** */
  hb_color_line_get_color_stops_func_t getColorStops;

  /** */
  void* getColorStopsUserData;

  /** */
  hb_color_line_get_extend_func_t getExtend;

  /** */
  void* getExtendUserData;

  /** */
  void* reserved0;

  /** */
  void* reserved1;

  /** */
  void* reserved2;

  /** */
  void* reserved3;

  /** */
  void* reserved5;

  /** */
  void* reserved6;

  /** */
  void* reserved7;

  /** */
  void* reserved8;
}

/**
    Information about a color stop on a color line.
  
  Color lines typically have offsets ranging between 0 and 1,
  but that is not required.
  
  Note: despite @color being unpremultiplied here, interpolation in
  gradients shall happen in premultiplied space. See the OpenType spec
  [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
  section for details.
*/
struct hb_color_stop_t
{
  /**
      the offset of the color stop
  */
  float offset;

  /**
      whether the color is the foreground
  */
  hb_bool_t isForeground;

  /**
      the color, unpremultiplied
  */
  hb_color_t color;
}

/**
    Glyph draw callbacks.
  
  #hb_draw_move_to_func_t, #hb_draw_line_to_func_t and
  #hb_draw_cubic_to_func_t calls are necessary to be defined but we translate
  #hb_draw_quadratic_to_func_t calls to #hb_draw_cubic_to_func_t if the
  callback isn't defined.
*/
struct hb_draw_funcs_t;

/**
    Current drawing state.
*/
struct hb_draw_state_t
{
  /**
      Whether there is an open path
  */
  hb_bool_t pathOpen;

  /**
      X component of the start of current path
  */
  float pathStartX;

  /**
      Y component of the start of current path
  */
  float pathStartY;

  /**
      X component of current point
  */
  float currentX;

  /**
      Y component of current point
  */
  float currentY;

  /** */
  hb_var_num_t reserved1;

  /** */
  hb_var_num_t reserved2;

  /** */
  hb_var_num_t reserved3;

  /** */
  hb_var_num_t reserved4;

  /** */
  hb_var_num_t reserved5;

  /** */
  hb_var_num_t reserved6;

  /** */
  hb_var_num_t reserved7;
}

/**
    Data type for holding font faces.
*/
struct hb_face_t;

/**
    The #hb_feature_t is the structure that holds information about requested
  feature application. The feature will be applied with the given value to all
  glyphs which are in clusters between @start (inclusive) and @end (exclusive).
  Setting start to #HB_FEATURE_GLOBAL_START and end to #HB_FEATURE_GLOBAL_END
  specifies that the feature always applies to the entire buffer.
*/
struct hb_feature_t
{
  /**
      The #hb_tag_t tag of the feature
  */
  hb_tag_t tag;

  /**
      The value of the feature. 0 disables the feature, non-zero (usually
    1) enables the feature.  For features implemented as lookup type 3 (like
    'salt') the @value is a one based index into the alternates.
  */
  uint value;

  /**
      the cluster to start applying this feature setting (inclusive).
  */
  uint start;

  /**
      the cluster to end applying this feature setting (exclusive).
  */
  uint end;
}

/**
    Data type for holding fonts.
*/
struct hb_font_t;

/**
    Font-wide extent values, measured in font units.
  
  Note that typically @ascender is positive and @descender
  negative, in coordinate systems that grow up.
*/
struct hb_font_extents_t
{
  /**
      The height of typographic ascenders.
  */
  hb_position_t ascender;

  /**
      The depth of typographic descenders.
  */
  hb_position_t descender;

  /**
      The suggested line-spacing gap.
  */
  hb_position_t lineGap;

  /** */
  hb_position_t reserved9;

  /** */
  hb_position_t reserved8;

  /** */
  hb_position_t reserved7;

  /** */
  hb_position_t reserved6;

  /** */
  hb_position_t reserved5;

  /** */
  hb_position_t reserved4;

  /** */
  hb_position_t reserved3;

  /** */
  hb_position_t reserved2;

  /** */
  hb_position_t reserved1;
}

/**
    Data type containing a set of virtual methods used for
  working on #hb_font_t font objects.
  
  HarfBuzz provides a lightweight default function for each of
  the methods in #hb_font_funcs_t. Client programs can implement
  their own replacements for the individual font functions, as
  needed, and replace the default by calling the setter for a
  method.
*/
struct hb_font_funcs_t;

/**
    Glyph extent values, measured in font units.
  
  Note that @height is negative, in coordinate systems that grow up.
*/
struct hb_glyph_extents_t
{
  /**
      Distance from the x-origin to the left extremum of the glyph.
  */
  hb_position_t xBearing;

  /**
      Distance from the top extremum of the glyph to the y-origin.
  */
  hb_position_t yBearing;

  /**
      Distance from the left extremum of the glyph to the right extremum.
  */
  hb_position_t width;

  /**
      Distance from the top extremum of the glyph to the bottom extremum.
  */
  hb_position_t height;
}

/**
    The #hb_glyph_info_t is the structure that holds information about the
  glyphs and their relation to input text.
*/
struct hb_glyph_info_t
{
  /**
      either a Unicode code point (before shaping) or a glyph index
                (after shaping).
  */
  hb_codepoint_t codepoint;

  /** */
  hb_mask_t mask;

  /**
      the index of the character in the original text that corresponds
              to this #hb_glyph_info_t, or whatever the client passes to
              [harfbuzz.global.bufferAdd]. More than one #hb_glyph_info_t can have the same
              @cluster value, if they resulted from the same character (e.g. one
              to many glyph substitution), and when more than one character gets
              merged in the same glyph (e.g. many to one glyph substitution) the
              #hb_glyph_info_t will have the smallest cluster value of them.
              By default some characters are merged into the same cluster
              (e.g. combining marks have the same cluster as their bases)
              even if they are separate glyphs, [harfbuzz.global.bufferSetClusterLevel]
              allow selecting more fine-grained cluster handling.
  */
  uint cluster;

  /** */
  hb_var_int_t var1;

  /** */
  hb_var_int_t var2;
}

/**
    The #hb_glyph_position_t is the structure that holds the positions of the
  glyph in both horizontal and vertical directions. All positions in
  #hb_glyph_position_t are relative to the current point.
*/
struct hb_glyph_position_t
{
  /**
      how much the line advances after drawing this glyph when setting
                text in horizontal direction.
  */
  hb_position_t xAdvance;

  /**
      how much the line advances after drawing this glyph when setting
                text in vertical direction.
  */
  hb_position_t yAdvance;

  /**
      how much the glyph moves on the X-axis before drawing it, this
               should not affect how much the line advances.
  */
  hb_position_t xOffset;

  /**
      how much the glyph moves on the Y-axis before drawing it, this
               should not affect how much the line advances.
  */
  hb_position_t yOffset;

  /** */
  hb_var_int_t var;
}

/**
    Data type for languages. Each #hb_language_t corresponds to a BCP 47
  language tag.
*/
alias hb_language_t = hb_language_t_st*;

struct hb_language_t_st;

/**
    Data type for holding integer-to-integer hash maps.
*/
struct hb_map_t;

/**
    Pairs of glyph and color index.
  
  A color index of 0xFFFF does not refer to a palette
  color, but indicates that the foreground color should
  be used.
*/
struct hb_ot_color_layer_t
{
  /**
      the glyph ID of the layer
  */
  hb_codepoint_t glyph;

  /**
      the palette color index of the layer
  */
  uint colorIndex;
}

/**
    Data type to hold information for a "part" component of a math-variant glyph.
  Large variants for stretchable math glyphs (such as parentheses) can be constructed
  on the fly from parts.
*/
struct hb_ot_math_glyph_part_t
{
  /**
      The glyph index of the variant part
  */
  hb_codepoint_t glyph;

  /**
      The length of the connector on the starting side of the variant part
  */
  hb_position_t startConnectorLength;

  /**
      The length of the connector on the ending side of the variant part
  */
  hb_position_t endConnectorLength;

  /**
      The total advance of the part
  */
  hb_position_t fullAdvance;

  /**
      #hb_ot_math_glyph_part_flags_t flags for the part
  */
  hb_ot_math_glyph_part_flags_t flags;
}

/**
    Data type to hold math-variant information for a glyph.
*/
struct hb_ot_math_glyph_variant_t
{
  /**
      The glyph index of the variant
  */
  hb_codepoint_t glyph;

  /**
      The advance width of the variant
  */
  hb_position_t advance;
}

/**
    Data type to hold math kerning (cut-in) information for a glyph.
*/
struct hb_ot_math_kern_entry_t
{
  /**
      The maximum height at which this entry should be used
  */
  hb_position_t maxCorrectionHeight;

  /**
      The kern value of the entry
  */
  hb_position_t kernValue;
}

/**
    Structure representing a name ID in a particular language.
*/
struct hb_ot_name_entry_t
{
  /**
      name ID
  */
  hb_ot_name_id_t nameId;

  /** */
  hb_var_int_t var;

  /**
      language
  */
  hb_language_t language;
}

/**
    Use #hb_ot_var_axis_info_t instead.
*/
struct hb_ot_var_axis_t
{
  /**
      axis tag
  */
  hb_tag_t tag;

  /**
      axis name identifier
  */
  hb_ot_name_id_t nameId;

  /**
      minimum value of the axis
  */
  float minValue;

  /**
      default value of the axis
  */
  float defaultValue;

  /**
      maximum value of the axis
  */
  float maxValue;
}

/**
    Data type for holding variation-axis values.
  
  The minimum, default, and maximum values are in un-normalized, user scales.
  
  <note>Note: at present, the only flag defined for @flags is
  #HB_OT_VAR_AXIS_FLAG_HIDDEN.</note>
*/
struct hb_ot_var_axis_info_t
{
  /**
      Index of the axis in the variation-axis array
  */
  uint axisIndex;

  /**
      The #hb_tag_t tag identifying the design variation of the axis
  */
  hb_tag_t tag;

  /**
      The `name` table Name ID that provides display names for the axis
  */
  hb_ot_name_id_t nameId;

  /**
      The #hb_ot_var_axis_flags_t flags for the axis
  */
  hb_ot_var_axis_flags_t flags;

  /**
      The minimum value on the variation axis that the font covers
  */
  float minValue;

  /**
      The position on the variation axis corresponding to the font's defaults
  */
  float defaultValue;

  /**
      The maximum value on the variation axis that the font covers
  */
  float maxValue;

  /** */
  uint reserved;
}

/**
    Glyph paint callbacks.
  
  The callbacks assume that the caller maintains a stack
  of current transforms, clips and intermediate surfaces,
  as evidenced by the pairs of push/pop callbacks. The
  push/pop calls will be properly nested, so it is fine
  to store the different kinds of object on a single stack.
  
  Not all callbacks are required for all kinds of glyphs.
  For rendering COLRv0 or non-color outline glyphs, the
  gradient callbacks are not needed, and the composite
  callback only needs to handle simple alpha compositing
  (#HB_PAINT_COMPOSITE_MODE_SRC_OVER).
  
  The paint-image callback is only needed for glyphs
  with image blobs in the CBDT, sbix or SVG tables.
  
  The custom-palette-color callback is only necessary if
  you want to override colors from the font palette with
  custom colors.
*/
struct hb_paint_funcs_t;

/**
    The structure that holds various text properties of an #hb_buffer_t. Can be
  set and retrieved using [harfbuzz.global.bufferSetSegmentProperties] and
  [harfbuzz.global.bufferGetSegmentProperties], respectively.
*/
struct hb_segment_properties_t
{
  /**
      the #hb_direction_t of the buffer, see [harfbuzz.global.bufferSetDirection].
  */
  hb_direction_t direction;

  /**
      the #hb_script_t of the buffer, see [harfbuzz.global.bufferSetScript].
  */
  hb_script_t script;

  /**
      the #hb_language_t of the buffer, see [harfbuzz.global.bufferSetLanguage].
  */
  hb_language_t language;

  /** */
  void* reserved1;

  /** */
  void* reserved2;
}

/**
    Data type for holding a set of integers. #hb_set_t's are
  used to gather and contain glyph IDs, Unicode code
  points, and various other collections of discrete
  values.
*/
struct hb_set_t;

/**
    Data type for holding a shaping plan.
  
  Shape plans contain information about how HarfBuzz will shape a
  particular text segment, based on the segment's properties and the
  capabilities in the font face in use.
  
  Shape plans can be queried about how shaping will perform, given a set
  of specific input parameters (script, language, direction, features,
  etc.).
*/
struct hb_shape_plan_t;

/**
    Data type containing a set of virtual methods used for
  accessing various Unicode character properties.
  
  HarfBuzz provides a default function for each of the
  methods in #hb_unicode_funcs_t. Client programs can implement
  their own replacements for the individual Unicode functions, as
  needed, and replace the default by calling the setter for a
  method.
*/
struct hb_unicode_funcs_t;

/**
    Data structure for holding user-data keys.
*/
struct hb_user_data_key_t
{
  /** */
  char unused;
}

/** */
union hb_var_int_t
{
  /** */
  uint u32;

  /** */
  int i32;

  /** */
  ushort[2] u16;

  /** */
  short[2] i16;

  /** */
  ubyte[4] u8;

  /** */
  byte[4] i8;
}

/** */
union hb_var_num_t
{
  /** */
  float f;

  /** */
  uint u32;

  /** */
  int i32;

  /** */
  ushort[2] u16;

  /** */
  short[2] i16;

  /** */
  ubyte[4] u8;

  /** */
  byte[4] i8;
}

/**
    Data type for holding variation data. Registered OpenType
  variation-axis tags are listed in
  [OpenType Axis Tag Registry](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg).
*/
struct hb_variation_t
{
  /**
      The #hb_tag_t tag of the variation-axis name
  */
  hb_tag_t tag;

  /**
      The value of the variation axis
  */
  float value;
}

alias extern(C) hb_bool_t function(hb_buffer_t* buffer, hb_font_t* font, const(char)* message, void* userData) hb_buffer_message_func_t;

alias extern(C) uint function(hb_color_line_t* colorLine, void* colorLineData, uint start, uint* count, hb_color_stop_t* colorStops, void* userData) hb_color_line_get_color_stops_func_t;

alias extern(C) hb_paint_extend_t function(hb_color_line_t* colorLine, void* colorLineData, void* userData) hb_color_line_get_extend_func_t;

alias extern(C) void function(void* userData) hb_destroy_func_t;

alias extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, void* userData) hb_draw_close_path_func_t;

alias extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float control1X, float control1Y, float control2X, float control2Y, float toX, float toY, void* userData) hb_draw_cubic_to_func_t;

alias extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float toX, float toY, void* userData) hb_draw_line_to_func_t;

alias extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float toX, float toY, void* userData) hb_draw_move_to_func_t;

alias extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float controlX, float controlY, float toX, float toY, void* userData) hb_draw_quadratic_to_func_t;

alias extern(C) void function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_draw_funcs_t* drawFuncs, void* drawData, void* userData) hb_font_draw_glyph_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_font_extents_t* extents, void* userData) hb_font_get_font_extents_func_t;

alias extern(C) hb_position_t function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, void* userData) hb_font_get_glyph_advance_func_t;

alias extern(C) void function(hb_font_t* font, void* fontData, uint count, const(hb_codepoint_t)* firstGlyph, uint glyphStride, hb_position_t* firstAdvance, uint advanceStride, void* userData) hb_font_get_glyph_advances_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, uint pointIndex, hb_position_t* x, hb_position_t* y, void* userData) hb_font_get_glyph_contour_point_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_glyph_extents_t* extents, void* userData) hb_font_get_glyph_extents_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, const(char)* name, int len, hb_codepoint_t* glyph, void* userData) hb_font_get_glyph_from_name_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t unicode, hb_codepoint_t variationSelector, hb_codepoint_t* glyph, void* userData) hb_font_get_glyph_func_t;

alias extern(C) hb_position_t function(hb_font_t* font, void* fontData, hb_codepoint_t firstGlyph, hb_codepoint_t secondGlyph, void* userData) hb_font_get_glyph_kerning_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, char* name, uint size, void* userData) hb_font_get_glyph_name_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_position_t* x, hb_position_t* y, void* userData) hb_font_get_glyph_origin_func_t;

alias extern(C) void function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_draw_funcs_t* drawFuncs, void* drawData, void* userData) hb_font_get_glyph_shape_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t unicode, hb_codepoint_t* glyph, void* userData) hb_font_get_nominal_glyph_func_t;

alias extern(C) uint function(hb_font_t* font, void* fontData, uint count, const(hb_codepoint_t)* firstUnicode, uint unicodeStride, hb_codepoint_t* firstGlyph, uint glyphStride, void* userData) hb_font_get_nominal_glyphs_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t unicode, hb_codepoint_t variationSelector, hb_codepoint_t* glyph, void* userData) hb_font_get_variation_glyph_func_t;

alias extern(C) void function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_paint_funcs_t* paintFuncs, void* paintData, uint paletteIndex, hb_color_t foreground, void* userData) hb_font_paint_glyph_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_bool_t isForeground, hb_color_t color, void* userData) hb_paint_color_func_t;

alias extern(C) hb_bool_t function(hb_paint_funcs_t* funcs, void* paintData, hb_codepoint_t glyph, hb_font_t* font, void* userData) hb_paint_color_glyph_func_t;

alias extern(C) hb_bool_t function(hb_paint_funcs_t* funcs, void* paintData, uint colorIndex, hb_color_t* color, void* userData) hb_paint_custom_palette_color_func_t;

alias extern(C) hb_bool_t function(hb_paint_funcs_t* funcs, void* paintData, hb_blob_t* image, uint width, uint height, hb_tag_t format, float slant, hb_glyph_extents_t* extents, void* userData) hb_paint_image_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float x1, float y1, float x2, float y2, void* userData) hb_paint_linear_gradient_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, void* userData) hb_paint_pop_clip_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_paint_composite_mode_t mode, void* userData) hb_paint_pop_group_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, void* userData) hb_paint_pop_transform_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_codepoint_t glyph, hb_font_t* font, void* userData) hb_paint_push_clip_glyph_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, float xmin, float ymin, float xmax, float ymax, void* userData) hb_paint_push_clip_rectangle_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, void* userData) hb_paint_push_group_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, float xx, float yx, float xy, float yy, float dx, float dy, void* userData) hb_paint_push_transform_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float r0, float x1, float y1, float r1, void* userData) hb_paint_radial_gradient_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float startAngle, float endAngle, void* userData) hb_paint_sweep_gradient_func_t;

alias extern(C) hb_blob_t* function(hb_face_t* face, hb_tag_t tag, void* userData) hb_reference_table_func_t;

alias extern(C) hb_unicode_combining_class_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData) hb_unicode_combining_class_func_t;

alias extern(C) hb_bool_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t a, hb_codepoint_t b, hb_codepoint_t* ab, void* userData) hb_unicode_compose_func_t;

alias extern(C) uint function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t u, hb_codepoint_t* decomposed, void* userData) hb_unicode_decompose_compatibility_func_t;

alias extern(C) hb_bool_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t ab, hb_codepoint_t* a, hb_codepoint_t* b, void* userData) hb_unicode_decompose_func_t;

alias extern(C) uint function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData) hb_unicode_eastasian_width_func_t;

alias extern(C) hb_unicode_general_category_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData) hb_unicode_general_category_func_t;

alias extern(C) hb_codepoint_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData) hb_unicode_mirroring_func_t;

alias extern(C) hb_script_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData) hb_unicode_script_func_t;

