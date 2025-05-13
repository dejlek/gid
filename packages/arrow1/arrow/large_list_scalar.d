/// Module for [LargeListScalar] class
module arrow.large_list_scalar;

import arrow.base_list_scalar;
import arrow.c.functions;
import arrow.c.types;
import arrow.large_list_array;
import arrow.types;
import gid.gid;

/** */
class LargeListScalar : arrow.base_list_scalar.BaseListScalar
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
    return cast(void function())garrow_large_list_scalar_get_type != &gidSymbolNotFound ? garrow_large_list_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LargeListScalar self()
  {
    return this;
  }

  /** */
  this(arrow.large_list_array.LargeListArray value)
  {
    GArrowLargeListScalar* _cretval;
    _cretval = garrow_large_list_scalar_new(value ? cast(GArrowLargeListArray*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
