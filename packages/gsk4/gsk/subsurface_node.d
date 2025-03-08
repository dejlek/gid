module gsk.subsurface_node;

import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node that potentially diverts a part of the scene graph to a subsurface.
*/
class SubsurfaceNode : gsk.render_node.RenderNode
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.SubsurfaceNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Gets the child node that is getting drawn by the given node.
    Returns:     the child [gsk.render_node.RenderNode]
  */
  gsk.render_node.RenderNode getChild()
  {
    GskRenderNode* _cretval;
    _cretval = gsk_subsurface_node_get_child(cast(const(GskRenderNode)*)cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.take) : null;
    return _retval;
  }
}
