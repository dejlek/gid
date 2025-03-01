module gsk.blur_node;

import gid.global;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
 * A render node applying a blur effect to its single child.
 */
class BlurNode : RenderNode
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
  this(RenderNode child, float radius)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_blur_node_new(child ? cast(GskRenderNode*)child.cPtr(No.Dup) : null, radius);
    this(_cretval, Yes.Take);
  }

  /**
   * Retrieves the child `GskRenderNode` of the blur node.
   * Returns: the blurred child node
   */
  RenderNode getChild()
  {
    GskRenderNode* _cretval;
    _cretval = gsk_blur_node_get_child(cast(GskRenderNode*)cPtr);
    auto _retval = _cretval ? new RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Retrieves the blur radius of the node.
   * Returns: the blur radius
   */
  float getRadius()
  {
    float _retval;
    _retval = gsk_blur_node_get_radius(cast(GskRenderNode*)cPtr);
    return _retval;
  }
}
