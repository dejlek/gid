module arrow.execute_context;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class ExecuteContext : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_execute_context_get_type != &gidSymbolNotFound ? garrow_execute_context_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this()
  {
    GArrowExecuteContext* _cretval;
    _cretval = garrow_execute_context_new();
    this(_cretval, Yes.take);
  }
}
