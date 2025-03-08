module gsk.color_node;

import gdk.rgba;
import gid.gid;
import graphene.rect;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node for a solid color.
*/
class ColorNode : gsk.render_node.RenderNode
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.ColorNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will render the color specified by rgba into
    the area given by bounds.
    Params:
      rgba =       a [gdk.rgba.RGBA] specifying a color
      bounds =       the rectangle to render the color into
    Returns:     A new [gsk.render_node.RenderNode]
  */
  this(gdk.rgba.RGBA rgba, graphene.rect.Rect bounds)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_color_node_new(rgba ? cast(const(GdkRGBA)*)rgba.cPtr(No.dup) : null, bounds ? cast(const(graphene_rect_t)*)bounds.cPtr(No.dup) : null);
    this(_cretval, Yes.take);
  }

  /**
      Retrieves the color of the given node.
    Returns:     the color of the node
  */
  gdk.rgba.RGBA getColor()
  {
    const(GdkRGBA)* _cretval;
    _cretval = gsk_color_node_get_color(cast(const(GskRenderNode)*)cPtr);
    auto _retval = _cretval ? new gdk.rgba.RGBA(cast(void*)_cretval, No.take) : null;
    return _retval;
  }
}
