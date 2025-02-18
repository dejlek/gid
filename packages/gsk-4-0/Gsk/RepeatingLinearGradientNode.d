module Gsk.RepeatingLinearGradientNode;

import Gid.gid;
import Gsk.RenderNode;
import Gsk.Types;
import Gsk.c.functions;
import Gsk.c.types;

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
