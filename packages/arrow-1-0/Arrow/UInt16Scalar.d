module Arrow.UInt16Scalar;

import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class UInt16Scalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_uint16_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(ushort value)
  {
    GArrowUInt16Scalar* _cretval;
    _cretval = garrow_uint16_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  ushort getValue()
  {
    ushort _retval;
    _retval = garrow_uint16_scalar_get_value(cast(GArrowUInt16Scalar*)cPtr);
    return _retval;
  }
}
