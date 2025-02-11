module Arrow.Decimal128Scalar;

import Arrow.Decimal128;
import Arrow.Decimal128DataType;
import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class Decimal128Scalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_decimal128_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Decimal128DataType dataType, Decimal128 value)
  {
    GArrowDecimal128Scalar* _cretval;
    _cretval = garrow_decimal128_scalar_new(dataType ? cast(GArrowDecimal128DataType*)dataType.cPtr(No.Dup) : null, value ? cast(GArrowDecimal128*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  Decimal128 getValue()
  {
    GArrowDecimal128* _cretval;
    _cretval = garrow_decimal128_scalar_get_value(cast(GArrowDecimal128Scalar*)cPtr);
    auto _retval = ObjectG.getDObject!Decimal128(cast(GArrowDecimal128*)_cretval, No.Take);
    return _retval;
  }
}
