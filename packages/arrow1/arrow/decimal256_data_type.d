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

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal256_data_type_get_type != &gidSymbolNotFound ? garrow_decimal256_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(int precision, int scale)
  {
    GArrowDecimal256DataType* _cretval;
    GError *_err;
    _cretval = garrow_decimal256_data_type_new(precision, scale, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.take);
  }

  /** */
  static int maxPrecision()
  {
    int _retval;
    _retval = garrow_decimal256_data_type_max_precision();
    return _retval;
  }
}
