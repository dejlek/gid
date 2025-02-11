module Arrow.MapScalar;

import Arrow.BaseListScalar;
import Arrow.StructArray;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class MapScalar : BaseListScalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_map_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(StructArray value)
  {
    GArrowMapScalar* _cretval;
    _cretval = garrow_map_scalar_new(value ? cast(GArrowStructArray*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
