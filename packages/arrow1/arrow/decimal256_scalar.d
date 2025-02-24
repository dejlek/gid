module arrow.decimal256_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal256;
import arrow.decimal256_data_type;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.object;

class Decimal256Scalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal256_scalar_get_type != &gidSymbolNotFound ? garrow_decimal256_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Decimal256DataType dataType, Decimal256 value)
  {
    GArrowDecimal256Scalar* _cretval;
    _cretval = garrow_decimal256_scalar_new(dataType ? cast(GArrowDecimal256DataType*)dataType.cPtr(No.Dup) : null, value ? cast(GArrowDecimal256*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  Decimal256 getValue()
  {
    GArrowDecimal256* _cretval;
    _cretval = garrow_decimal256_scalar_get_value(cast(GArrowDecimal256Scalar*)cPtr);
    auto _retval = ObjectG.getDObject!Decimal256(cast(GArrowDecimal256*)_cretval, No.Take);
    return _retval;
  }
}
