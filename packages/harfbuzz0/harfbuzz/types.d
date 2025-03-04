module harfbuzz.types;

import gid.gid;
import harfbuzz.blob;
import harfbuzz.buffer;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.color_line;
import harfbuzz.color_stop;
import harfbuzz.draw_funcs;
import harfbuzz.draw_state;
import harfbuzz.face;
import harfbuzz.font;
import harfbuzz.paint_funcs;
import harfbuzz.unicode_funcs;


// Aliases
alias Bool = hb_bool_t;
alias Codepoint = hb_codepoint_t;
alias Color = hb_color_t;
alias FontGetFontHExtentsFunc = harfbuzz.types.FontGetFontExtentsFunc;
alias FontGetFontVExtentsFunc = harfbuzz.types.FontGetFontExtentsFunc;
alias FontGetGlyphHAdvanceFunc = harfbuzz.types.FontGetGlyphAdvanceFunc;
alias FontGetGlyphHKerningFunc = harfbuzz.types.FontGetGlyphKerningFunc;
alias FontGetGlyphHOriginFunc = harfbuzz.types.FontGetGlyphOriginFunc;
alias FontGetGlyphVAdvanceFunc = harfbuzz.types.FontGetGlyphAdvanceFunc;
alias FontGetGlyphVKerningFunc = harfbuzz.types.FontGetGlyphKerningFunc;
alias FontGetGlyphVOriginFunc = harfbuzz.types.FontGetGlyphOriginFunc;
alias Mask = hb_mask_t;
alias OtNameId = hb_ot_name_id_t;
alias Position = hb_position_t;
alias Tag = hb_tag_t;

// Enums
alias AatLayoutFeatureSelector = hb_aat_layout_feature_selector_t;
alias AatLayoutFeatureType = hb_aat_layout_feature_type_t;
alias BufferClusterLevel = hb_buffer_cluster_level_t;
alias BufferContentType = hb_buffer_content_type_t;
alias BufferDiffFlags = hb_buffer_diff_flags_t;
alias BufferFlags = hb_buffer_flags_t;
alias BufferSerializeFlags = hb_buffer_serialize_flags_t;
alias BufferSerializeFormat = hb_buffer_serialize_format_t;
alias Direction = hb_direction_t;
alias GlyphFlags = hb_glyph_flags_t;
alias MemoryMode = hb_memory_mode_t;
alias OtColorPaletteFlags = hb_ot_color_palette_flags_t;
alias OtLayoutBaselineTag = hb_ot_layout_baseline_tag_t;
alias OtLayoutGlyphClass = hb_ot_layout_glyph_class_t;
alias OtMathConstant = hb_ot_math_constant_t;
alias OtMathGlyphPartFlags = hb_ot_math_glyph_part_flags_t;
alias OtMathKern = hb_ot_math_kern_t;
alias OtMetaTag = hb_ot_meta_tag_t;
alias OtMetricsTag = hb_ot_metrics_tag_t;
alias OtNameIdPredefined = hb_ot_name_id_predefined_t;
alias OtVarAxisFlags = hb_ot_var_axis_flags_t;
alias PaintCompositeMode = hb_paint_composite_mode_t;
alias PaintExtend = hb_paint_extend_t;
alias Script = hb_script_t;
alias StyleTag = hb_style_tag_t;
alias UnicodeCombiningClass = hb_unicode_combining_class_t;
alias UnicodeGeneralCategory = hb_unicode_general_category_t;

// Structs
alias AatLayoutFeatureSelectorInfo = hb_aat_layout_feature_selector_info_t;
alias FontExtents = hb_font_extents_t;
alias GlyphExtents = hb_glyph_extents_t;
alias Language = hb_language_t;
alias OtColorLayer = hb_ot_color_layer_t;
alias OtMathKernEntry = hb_ot_math_kern_entry_t;
alias OtVarAxis = hb_ot_var_axis_t;
alias VarInt = hb_var_int_t;
alias VarNum = hb_var_num_t;

// Callbacks
alias BufferMessageFunc = harfbuzz.types.Bool delegate(harfbuzz.buffer.Buffer buffer, harfbuzz.font.Font font, string message);
alias ColorLineGetColorStopsFunc = uint delegate(harfbuzz.color_line.ColorLine colorLine, void* colorLineData, uint start, ref harfbuzz.color_stop.ColorStop[] colorStops);
alias ColorLineGetExtendFunc = harfbuzz.types.PaintExtend delegate(harfbuzz.color_line.ColorLine colorLine, void* colorLineData);
alias DestroyFunc = void delegate();
alias DrawClosePathFunc = void delegate(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st);
alias DrawCubicToFunc = void delegate(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st, float control1X, float control1Y, float control2X, float control2Y, float toX, float toY);
alias DrawLineToFunc = void delegate(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st, float toX, float toY);
alias DrawMoveToFunc = void delegate(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st, float toX, float toY);
alias DrawQuadraticToFunc = void delegate(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st, float controlX, float controlY, float toX, float toY);
alias FontDrawGlyphFunc = void delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, harfbuzz.draw_funcs.DrawFuncs drawFuncs, void* drawData);
alias FontGetFontExtentsFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, out harfbuzz.types.FontExtents extents);
alias FontGetGlyphAdvanceFunc = harfbuzz.types.Position delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph);
alias FontGetGlyphContourPointFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, uint pointIndex, out harfbuzz.types.Position x, out harfbuzz.types.Position y);
alias FontGetGlyphExtentsFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, out harfbuzz.types.GlyphExtents extents);
alias FontGetGlyphFromNameFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, char[] name, out harfbuzz.types.Codepoint glyph);
alias FontGetGlyphFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint unicode, harfbuzz.types.Codepoint variationSelector, out harfbuzz.types.Codepoint glyph);
alias FontGetGlyphKerningFunc = harfbuzz.types.Position delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint firstGlyph, harfbuzz.types.Codepoint secondGlyph);
alias FontGetGlyphNameFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, ref char[] name);
alias FontGetGlyphOriginFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, out harfbuzz.types.Position x, out harfbuzz.types.Position y);
alias FontGetGlyphShapeFunc = void delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, harfbuzz.draw_funcs.DrawFuncs drawFuncs, void* drawData);
alias FontGetNominalGlyphFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint unicode, out harfbuzz.types.Codepoint glyph);
alias FontGetVariationGlyphFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint unicode, harfbuzz.types.Codepoint variationSelector, out harfbuzz.types.Codepoint glyph);
alias FontPaintGlyphFunc = void delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, harfbuzz.paint_funcs.PaintFuncs paintFuncs, void* paintData, uint paletteIndex, harfbuzz.types.Color foreground);
alias PaintColorFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.Bool isForeground, harfbuzz.types.Color color);
alias PaintColorGlyphFunc = harfbuzz.types.Bool delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.Codepoint glyph, harfbuzz.font.Font font);
alias PaintCustomPaletteColorFunc = harfbuzz.types.Bool delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, uint colorIndex, out harfbuzz.types.Color color);
alias PaintImageFunc = harfbuzz.types.Bool delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.blob.Blob image, uint width, uint height, harfbuzz.types.Tag format, float slant, harfbuzz.types.GlyphExtents extents);
alias PaintLinearGradientFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.color_line.ColorLine colorLine, float x0, float y0, float x1, float y1, float x2, float y2);
alias PaintPopClipFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData);
alias PaintPopGroupFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.PaintCompositeMode mode);
alias PaintPopTransformFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData);
alias PaintPushClipGlyphFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.Codepoint glyph, harfbuzz.font.Font font);
alias PaintPushClipRectangleFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, float xmin, float ymin, float xmax, float ymax);
alias PaintPushGroupFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData);
alias PaintPushTransformFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, float xx, float yx, float xy, float yy, float dx, float dy);
alias PaintRadialGradientFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.color_line.ColorLine colorLine, float x0, float y0, float r0, float x1, float y1, float r1);
alias PaintSweepGradientFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.color_line.ColorLine colorLine, float x0, float y0, float startAngle, float endAngle);
alias ReferenceTableFunc = harfbuzz.blob.Blob delegate(harfbuzz.face.Face face, harfbuzz.types.Tag tag);
alias UnicodeCombiningClassFunc = harfbuzz.types.UnicodeCombiningClass delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode);
alias UnicodeComposeFunc = harfbuzz.types.Bool delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint a, harfbuzz.types.Codepoint b, out harfbuzz.types.Codepoint ab);
alias UnicodeDecomposeFunc = harfbuzz.types.Bool delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint ab, out harfbuzz.types.Codepoint a, out harfbuzz.types.Codepoint b);
alias UnicodeEastasianWidthFunc = uint delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode);
alias UnicodeGeneralCategoryFunc = harfbuzz.types.UnicodeGeneralCategory delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode);
alias UnicodeMirroringFunc = harfbuzz.types.Codepoint delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode);
alias UnicodeScriptFunc = harfbuzz.types.Script delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode);

/**
 * Used when getting or setting AAT feature selectors. Indicates that
 * there is no selector index corresponding to the selector of interest.
 */
enum AAT_LAYOUT_NO_SELECTOR_INDEX = 65535;


/**
 * The default code point for replacing invalid characters in a given encoding.
 * Set to U+FFFD REPLACEMENT CHARACTER.
 */
enum BUFFER_REPLACEMENT_CODEPOINT_DEFAULT = 65533;


/**
 * Unused #hb_codepoint_t value.
 */
enum CODEPOINT_INVALID = 4294967295;


/**
 * Special setting for #hb_feature_t.start to apply the feature from the start
 * of the buffer.
 */
enum FEATURE_GLOBAL_START = 0;


/**
 * Constant signifying that a font does not have any
 * named-instance index set.  This is the default of
 * a font.
 */
enum FONT_NO_VAR_NAMED_INSTANCE = 4294967295;


/**
 * An unset #hb_language_t.
 */
enum LANGUAGE_INVALID = 0;


/**
 * Special value for language index indicating default or unsupported language.
 */
enum OT_LAYOUT_DEFAULT_LANGUAGE_INDEX = 65535;


/**
 * Special value for feature index indicating unsupported feature.
 */
enum OT_LAYOUT_NO_FEATURE_INDEX = 65535;


/**
 * Special value for script index indicating unsupported script.
 */
enum OT_LAYOUT_NO_SCRIPT_INDEX = 65535;


/**
 * Special value for variations index indicating unsupported variation.
 */
enum OT_LAYOUT_NO_VARIATIONS_INDEX = 4294967295;


/**
 * Maximum number of OpenType tags that can correspond to a give #hb_language_t.
 */
enum OT_MAX_TAGS_PER_LANGUAGE = 3;


/**
 * Maximum number of OpenType tags that can correspond to a give #hb_script_t.
 */
enum OT_MAX_TAGS_PER_SCRIPT = 3;


/**
 * Do not use.
 */
enum OT_VAR_NO_AXIS_INDEX = 4294967295;


/**
 * [Tibetan]
 */
enum UNICODE_COMBINING_CLASS_CCC133 = 133;


/**
 * Maximum valid Unicode code point.
 */
enum UNICODE_MAX = 1114111;


/**
 * See Unicode 6.1 for details on the maximum decomposition length.
 */
enum UNICODE_MAX_DECOMPOSITION_LEN = 19;


enum VERSION_MAJOR = 8;


enum VERSION_MICRO = 0;


enum VERSION_MINOR = 3;


enum VERSION_STRING = "8.3.0";

