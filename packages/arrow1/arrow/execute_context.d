module arrow.execute_context;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.global;
import gobject.object;

class ExecuteContext : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_execute_context_get_type != &gidSymbolNotFound ? garrow_execute_context_get_type() : cast(GType)0;
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
