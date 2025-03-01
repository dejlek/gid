module gsk.texture_scale_node;

import gdk.texture;
import gid.global;
import gobject.object;
import graphene.rect;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
 * A render node for a `GdkTexture`.
 */
class TextureScaleNode : RenderNode
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.TextureScaleNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
   * Creates a node that scales the texture to the size given by the
   * bounds using the filter and then places it at the bounds' position.
   * Note that further scaling and other transformations which are
   * applied to the node will apply linear filtering to the resulting
   * texture, as usual.
   * This node is intended for tight control over scaling applied
   * to a texture, such as in image editors and requires the
   * application to be aware of the whole render tree as further
   * transforms may be applied that conflict with the desired effect
   * of this node.
   * Params:
   *   texture = the texture to scale
   *   bounds = the size of the texture to scale to
   *   filter = how to scale the texture
   * Returns: A new `GskRenderNode`
   */
  this(Texture texture, Rect bounds, ScalingFilter filter)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_texture_scale_node_new(texture ? cast(GdkTexture*)texture.cPtr(No.Dup) : null, bounds ? cast(graphene_rect_t*)bounds.cPtr(No.Dup) : null, filter);
    this(_cretval, Yes.Take);
  }

  /**
   * Retrieves the `GskScalingFilter` used when creating this `GskRenderNode`.
   * Returns: the `GskScalingFilter`
   */
  ScalingFilter getFilter()
  {
    GskScalingFilter _cretval;
    _cretval = gsk_texture_scale_node_get_filter(cast(GskRenderNode*)cPtr);
    ScalingFilter _retval = cast(ScalingFilter)_cretval;
    return _retval;
  }

  /**
   * Retrieves the `GdkTexture` used when creating this `GskRenderNode`.
   * Returns: the `GdkTexture`
   */
  Texture getTexture()
  {
    GdkTexture* _cretval;
    _cretval = gsk_texture_scale_node_get_texture(cast(GskRenderNode*)cPtr);
    auto _retval = ObjectG.getDObject!Texture(cast(GdkTexture*)_cretval, No.Take);
    return _retval;
  }
}
