/// Module for [Decimal256DataType] class
module arrow.decimal256_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal_data_type;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class Decimal256DataType : arrow.decimal_data_type.DecimalDataType
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
    return cast(void function())garrow_decimal256_data_type_get_type != &gidSymbolNotFound ? garrow_decimal256_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Decimal256DataType self()
  {
    return this;
  }

  /** */
  this(int precision, int scale)
  {
    GArrowDecimal256DataType* _cretval;
    GError *_err;
    _cretval = garrow_decimal256_data_type_new(precision, scale, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  static int maxPrecision()
  {
    int _retval;
    _retval = garrow_decimal256_data_type_max_precision();
    return _retval;
  }
}
