module gsk.texture_node;

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
class TextureNode : RenderNode
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.TextureNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
   * Creates a `GskRenderNode` that will render the given
   * texture into the area given by bounds.
   * Note that GSK applies linear filtering when textures are
   * scaled and transformed. See [gsk.texture_scale_node.TextureScaleNode]
   * for a way to influence filtering.
   * Params:
   *   texture = the `GdkTexture`
   *   bounds = the rectangle to render the texture into
   * Returns: A new `GskRenderNode`
   */
  this(Texture texture, Rect bounds)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_texture_node_new(texture ? cast(GdkTexture*)texture.cPtr(No.Dup) : null, bounds ? cast(graphene_rect_t*)bounds.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Retrieves the `GdkTexture` used when creating this `GskRenderNode`.
   * Returns: the `GdkTexture`
   */
  Texture getTexture()
  {
    GdkTexture* _cretval;
    _cretval = gsk_texture_node_get_texture(cast(GskRenderNode*)cPtr);
    auto _retval = ObjectG.getDObject!Texture(cast(GdkTexture*)_cretval, No.Take);
    return _retval;
  }
}
