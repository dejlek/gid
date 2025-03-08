module arrow.decimal32_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal32;
import arrow.decimal32_data_type;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class Decimal32Scalar : arrow.scalar.Scalar
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal32_scalar_get_type != &gidSymbolNotFound ? garrow_decimal32_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.decimal32_data_type.Decimal32DataType dataType, arrow.decimal32.Decimal32 value)
  {
    GArrowDecimal32Scalar* _cretval;
    _cretval = garrow_decimal32_scalar_new(dataType ? cast(GArrowDecimal32DataType*)dataType.cPtr(No.dup) : null, value ? cast(GArrowDecimal32*)value.cPtr(No.dup) : null);
    this(_cretval, Yes.take);
  }

  /** */
  arrow.decimal32.Decimal32 getValue()
  {
    GArrowDecimal32* _cretval;
    _cretval = garrow_decimal32_scalar_get_value(cast(GArrowDecimal32Scalar*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.decimal32.Decimal32)(cast(GArrowDecimal32*)_cretval, No.take);
    return _retval;
  }
}
