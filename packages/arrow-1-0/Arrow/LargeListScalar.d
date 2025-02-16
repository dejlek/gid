module Arrow.LargeListScalar;

import Arrow.BaseListScalar;
import Arrow.LargeListArray;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class LargeListScalar : BaseListScalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
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
