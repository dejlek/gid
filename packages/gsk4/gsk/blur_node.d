module gsk.blur_node;

import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
 * A render node applying a blur effect to its single child.
 */
class BlurNode : gsk.render_node.RenderNode
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.BlurNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
   * Creates a render node that blurs the child.
   * Params:
   *   child = the child node to blur
   *   radius = the blur radius. Must be positive
   * Returns: a new `GskRenderNode`
   */
  this(gsk.render_node.RenderNode child, float radius)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_blur_node_new(child ? cast(GskRenderNode*)child.cPtr(No.Dup) : null, radius);
    this(_cretval, Yes.Take);
  }

  /**
   * Retrieves the child `GskRenderNode` of the blur node.
   * Returns: the blurred child node
   */
  gsk.render_node.RenderNode getChild()
  {
    GskRenderNode* _cretval;
    _cretval = gsk_blur_node_get_child(cast(const(GskRenderNode)*)cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Retrieves the blur radius of the node.
   * Returns: the blur radius
   */
  float getRadius()
  {
    float _retval;
    _retval = gsk_blur_node_get_radius(cast(const(GskRenderNode)*)cPtr);
    return _retval;
  }
}
