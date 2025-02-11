module Arrow.UInt64Scalar;

import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class UInt64Scalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_uint64_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(ulong value)
  {
    GArrowUInt64Scalar* _cretval;
    _cretval = garrow_uint64_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  ulong getValue()
  {
    ulong _retval;
    _retval = garrow_uint64_scalar_get_value(cast(GArrowUInt64Scalar*)cPtr);
    return _retval;
  }
}
