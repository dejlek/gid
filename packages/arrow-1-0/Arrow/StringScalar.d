module Arrow.StringScalar;

import Arrow.BaseBinaryScalar;
import Arrow.Buffer;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class StringScalar : BaseBinaryScalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_string_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Buffer value)
  {
    GArrowStringScalar* _cretval;
    _cretval = garrow_string_scalar_new(value ? cast(GArrowBuffer*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
