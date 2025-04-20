/// Module for [InsetShadowNode] class
module gsk.inset_shadow_node;

import gdk.rgba;
import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.rounded_rect;
import gsk.types;

/**
    A render node for an inset shadow.
*/
class InsetShadowNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gsk.inset_shadow_node.InsetShadowNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will render an inset shadow
      into the box given by outline.
  
      Params:
        outline = outline of the region containing the shadow
        color = color of the shadow
        dx = horizontal offset of shadow
        dy = vertical offset of shadow
        spread = how far the shadow spreads towards the inside
        blurRadius = how much blur to apply to the shadow
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(gsk.rounded_rect.RoundedRect outline, gdk.rgba.RGBA color, float dx, float dy, float spread, float blurRadius)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_inset_shadow_node_new(outline ? cast(const(GskRoundedRect)*)outline.cPtr : null, color ? cast(const(GdkRGBA)*)color.cPtr(No.Dup) : null, dx, dy, spread, blurRadius);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the blur radius to apply to the shadow.
      Returns: the blur radius, in pixels
  */
  float getBlurRadius()
  {
    float _retval;
    _retval = gsk_inset_shadow_node_get_blur_radius(cast(const(GskRenderNode)*)cPtr);
    return _retval;
  }

  /**
      Retrieves the color of the inset shadow.
      Returns: the color of the shadow
  */
  gdk.rgba.RGBA getColor()
  {
    const(GdkRGBA)* _cretval;
    _cretval = gsk_inset_shadow_node_get_color(cast(const(GskRenderNode)*)cPtr);
    auto _retval = _cretval ? new gdk.rgba.RGBA(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the horizontal offset of the inset shadow.
      Returns: an offset, in pixels
  */
  float getDx()
  {
    float _retval;
    _retval = gsk_inset_shadow_node_get_dx(cast(const(GskRenderNode)*)cPtr);
    return _retval;
  }

  /**
      Retrieves the vertical offset of the inset shadow.
      Returns: an offset, in pixels
  */
  float getDy()
  {
    float _retval;
    _retval = gsk_inset_shadow_node_get_dy(cast(const(GskRenderNode)*)cPtr);
    return _retval;
  }

  /**
      Retrieves the outline rectangle of the inset shadow.
      Returns: a rounded rectangle
  */
  gsk.rounded_rect.RoundedRect getOutline()
  {
    const(GskRoundedRect)* _cretval;
    _cretval = gsk_inset_shadow_node_get_outline(cast(const(GskRenderNode)*)cPtr);
    auto _retval = _cretval ? new gsk.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval) : null;
    return _retval;
  }

  /**
      Retrieves how much the shadow spreads inwards.
      Returns: the size of the shadow, in pixels
  */
  float getSpread()
  {
    float _retval;
    _retval = gsk_inset_shadow_node_get_spread(cast(const(GskRenderNode)*)cPtr);
    return _retval;
  }
}
