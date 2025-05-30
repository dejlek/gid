/// Module for [Decimal256Scalar] class
module arrow.decimal256_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal256;
import arrow.decimal256_data_type;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class Decimal256Scalar : arrow.scalar.Scalar
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal256_scalar_get_type != &gidSymbolNotFound ? garrow_decimal256_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Decimal256Scalar self()
  {
    return this;
  }

  /** */
  this(arrow.decimal256_data_type.Decimal256DataType dataType, arrow.decimal256.Decimal256 value)
  {
    GArrowDecimal256Scalar* _cretval;
    _cretval = garrow_decimal256_scalar_new(dataType ? cast(GArrowDecimal256DataType*)dataType._cPtr(No.Dup) : null, value ? cast(GArrowDecimal256*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.decimal256.Decimal256 getValue()
  {
    GArrowDecimal256* _cretval;
    _cretval = garrow_decimal256_scalar_get_value(cast(GArrowDecimal256Scalar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal256.Decimal256)(cast(GArrowDecimal256*)_cretval, No.Take);
    return _retval;
  }
}
