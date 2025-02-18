module Gsk.RepeatingRadialGradientNode;

import Gid.gid;
import Gsk.RenderNode;
import Gsk.Types;
import Gsk.c.functions;
import Gsk.c.types;

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
