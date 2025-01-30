module Gsk.TransformNode;

import Gid.gid;
import Gsk.RenderNode;
import Gsk.Transform;
import Gsk.Types;
import Gsk.c.functions;
import Gsk.c.types;

/**
 * A render node applying a `GskTransform` to its single child node.
 */
class TransformNode : RenderNode
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.TransformNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
   * Creates a `GskRenderNode` that will transform the given child
   * with the given transform.
   * Params:
   *   child = The node to transform
   *   transform = The transform to apply
   * Returns: A new `GskRenderNode`
   */
  this(RenderNode child, Transform transform)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_transform_node_new(child ? cast(GskRenderNode*)child.cPtr(No.Dup) : null, transform ? cast(GskTransform*)transform.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the child node that is getting transformed by the given node.
   * Returns: The child that is getting transformed
   */
  RenderNode getChild()
  {
    GskRenderNode* _cretval;
    _cretval = gsk_transform_node_get_child(cast(GskRenderNode*)cPtr);
    auto _retval = _cretval ? new RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Retrieves the `GskTransform` used by the node.
   * Returns: a `GskTransform`
   */
  Transform getTransform()
  {
    GskTransform* _cretval;
    _cretval = gsk_transform_node_get_transform(cast(GskRenderNode*)cPtr);
    auto _retval = _cretval ? new Transform(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
