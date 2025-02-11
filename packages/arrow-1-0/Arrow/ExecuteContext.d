module Arrow.ExecuteContext;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class ExecuteContext : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_execute_context_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowExecuteContext* _cretval;
    _cretval = garrow_execute_context_new();
    this(_cretval, Yes.Take);
  }
}
