module gsk.repeating_linear_gradient_node;

import gid.global;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
 * A render node for a repeating linear gradient.
 */
class RepeatingLinearGradientNode : RenderNode
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.RepeatingLinearGradientNode");

    super(cast(GskRenderNode*)ptr, take);
  }
}
