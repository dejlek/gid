module gsk.subsurface_node;

import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
 * A render node that potentially diverts a part of the scene graph to a subsurface.
 */
class SubsurfaceNode : RenderNode
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.SubsurfaceNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
   * Gets the child node that is getting drawn by the given node.
   * Returns: the child `GskRenderNode`
   */
  RenderNode getChild()
  {
    GskRenderNode* _cretval;
    _cretval = gsk_subsurface_node_get_child(cast(GskRenderNode*)cPtr);
    auto _retval = _cretval ? new RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }
}
