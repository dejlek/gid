module Arrow.Decimal32Scalar;

import Arrow.Decimal32;
import Arrow.Decimal32DataType;
import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class Decimal32Scalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_decimal32_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Decimal32DataType dataType, Decimal32 value)
  {
    GArrowDecimal32Scalar* _cretval;
    _cretval = garrow_decimal32_scalar_new(dataType ? cast(GArrowDecimal32DataType*)dataType.cPtr(No.Dup) : null, value ? cast(GArrowDecimal32*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  Decimal32 getValue()
  {
    GArrowDecimal32* _cretval;
    _cretval = garrow_decimal32_scalar_get_value(cast(GArrowDecimal32Scalar*)cPtr);
    auto _retval = ObjectG.getDObject!Decimal32(cast(GArrowDecimal32*)_cretval, No.Take);
    return _retval;
  }
}
