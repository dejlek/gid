module Arrow.ExecuteNodeOptions;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class ExecuteNodeOptions : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_execute_node_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }
}
