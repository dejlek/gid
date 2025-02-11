module Arrow.ListScalar;

import Arrow.BaseListScalar;
import Arrow.ListArray;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class ListScalar : BaseListScalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_list_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(ListArray value)
  {
    GArrowListScalar* _cretval;
    _cretval = garrow_list_scalar_new(value ? cast(GArrowListArray*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
