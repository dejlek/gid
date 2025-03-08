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

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal64_scalar_get_type != &gidSymbolNotFound ? garrow_decimal64_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.decimal64_data_type.Decimal64DataType dataType, arrow.decimal64.Decimal64 value)
  {
    GArrowDecimal64Scalar* _cretval;
    _cretval = garrow_decimal64_scalar_new(dataType ? cast(GArrowDecimal64DataType*)dataType.cPtr(No.dup) : null, value ? cast(GArrowDecimal64*)value.cPtr(No.dup) : null);
    this(_cretval, Yes.take);
  }

  /** */
  arrow.decimal64.Decimal64 getValue()
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_scalar_get_value(cast(GArrowDecimal64Scalar*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, No.take);
    return _retval;
  }
}
