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
    return garrow_large_list_scalar_get_type();
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
