module arrow.decimal64_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal64;
import arrow.decimal64_data_type;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class Decimal64Scalar : arrow.scalar.Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal64_scalar_get_type != &gidSymbolNotFound ? garrow_decimal64_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  this(arrow.decimal64_data_type.Decimal64DataType dataType, arrow.decimal64.Decimal64 value)
  {
    GArrowDecimal64Scalar* _cretval;
    _cretval = garrow_decimal64_scalar_new(dataType ? cast(GArrowDecimal64DataType*)dataType.cPtr(No.Dup) : null, value ? cast(GArrowDecimal64*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.decimal64.Decimal64 getValue()
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_scalar_get_value(cast(GArrowDecimal64Scalar*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, No.Take);
    return _retval;
  }
}
