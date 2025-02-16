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
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_list_scalar_get_type != &gidSymbolNotFound ? garrow_list_scalar_get_type() : cast(GType)0;
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
