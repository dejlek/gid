/// Module for [ListScalar] class
module arrow.list_scalar;

import arrow.base_list_scalar;
import arrow.c.functions;
import arrow.c.types;
import arrow.list_array;
import arrow.types;
import gid.gid;

/** */
class ListScalar : arrow.base_list_scalar.BaseListScalar
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_list_scalar_get_type != &gidSymbolNotFound ? garrow_list_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ListScalar self()
  {
    return this;
  }

  /** */
  this(arrow.list_array.ListArray value)
  {
    GArrowListScalar* _cretval;
    _cretval = garrow_list_scalar_new(value ? cast(GArrowListArray*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
