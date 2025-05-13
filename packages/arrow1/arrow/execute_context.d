/// Module for [ExecuteContext] class
module arrow.execute_context;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class ExecuteContext : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_execute_context_get_type != &gidSymbolNotFound ? garrow_execute_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ExecuteContext self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowExecuteContext* _cretval;
    _cretval = garrow_execute_context_new();
    this(_cretval, Yes.Take);
  }
}
