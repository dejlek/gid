/// Module for [RepeatingLinearGradientNode] class
module gsk.repeating_linear_gradient_node;

import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node for a repeating linear gradient.
*/
class RepeatingLinearGradientNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gsk.repeating_linear_gradient_node.RepeatingLinearGradientNode");

    super(cast(GskRenderNode*)ptr, take);
  }
}
