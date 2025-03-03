module gsk.text_node;

import gdk.rgba;
import gid.gid;
import gobject.object;
import graphene.point;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;
import pango.font;
import pango.glyph_string;

/**
 * A render node drawing a set of glyphs.
 */
class TextNode : gsk.render_node.RenderNode
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.TextNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
   * Creates a render node that renders the given glyphs.
   * Note that color may not be used if the font contains
   * color glyphs.
   * Params:
   *   font = the `PangoFont` containing the glyphs
   *   glyphs = the `PangoGlyphString` to render
   *   color = the foreground color to render with
   *   offset = offset of the baseline
   * Returns: a new `GskRenderNode`
   */
  this(pango.font.Font font, pango.glyph_string.GlyphString glyphs, gdk.rgba.RGBA color, graphene.point.Point offset)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_text_node_new(font ? cast(PangoFont*)font.cPtr(No.Dup) : null, glyphs ? cast(PangoGlyphString*)glyphs.cPtr(No.Dup) : null, color ? cast(const(GdkRGBA)*)color.cPtr(No.Dup) : null, offset ? cast(const(graphene_point_t)*)offset.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Retrieves the color used by the text node.
   * Returns: the text color
   */
  gdk.rgba.RGBA getColor()
  {
    const(GdkRGBA)* _cretval;
    _cretval = gsk_text_node_get_color(cast(const(GskRenderNode)*)cPtr);
    auto _retval = _cretval ? new gdk.rgba.RGBA(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Returns the font used by the text node.
   * Returns: the font
   */
  pango.font.Font getFont()
  {
    PangoFont* _cretval;
    _cretval = gsk_text_node_get_font(cast(const(GskRenderNode)*)cPtr);
    auto _retval = ObjectG.getDObject!(pango.font.Font)(cast(PangoFont*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Retrieves the number of glyphs in the text node.
   * Returns: the number of glyphs
   */
  uint getNumGlyphs()
  {
    uint _retval;
    _retval = gsk_text_node_get_num_glyphs(cast(const(GskRenderNode)*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the offset applied to the text.
   * Returns: a point with the horizontal and vertical offsets
   */
  graphene.point.Point getOffset()
  {
    const(graphene_point_t)* _cretval;
    _cretval = gsk_text_node_get_offset(cast(const(GskRenderNode)*)cPtr);
    auto _retval = _cretval ? new graphene.point.Point(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Checks whether the text node has color glyphs.
   * Returns: %TRUE if the text node has color glyphs
   */
  bool hasColorGlyphs()
  {
    bool _retval;
    _retval = gsk_text_node_has_color_glyphs(cast(const(GskRenderNode)*)cPtr);
    return _retval;
  }
}
