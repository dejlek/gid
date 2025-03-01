module gsk.repeating_radial_gradient_node;

import gid.global;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
 * A render node for a repeating radial gradient.
 */
class RepeatingRadialGradientNode : RenderNode
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.RepeatingRadialGradientNode");

    super(cast(GskRenderNode*)ptr, take);
  }
}
