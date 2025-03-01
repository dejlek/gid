module arrow.large_list_scalar;

import arrow.base_list_scalar;
import arrow.c.functions;
import arrow.c.types;
import arrow.large_list_array;
import arrow.types;
import gid.global;

class LargeListScalar : BaseListScalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_large_list_scalar_get_type != &gidSymbolNotFound ? garrow_large_list_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(LargeListArray value)
  {
    GArrowLargeListScalar* _cretval;
    _cretval = garrow_large_list_scalar_new(value ? cast(GArrowLargeListArray*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
