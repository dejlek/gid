module arrow.decimal_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.fixed_size_binary_data_type;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class DecimalDataType : arrow.fixed_size_binary_data_type.FixedSizeBinaryDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal_data_type_get_type != &gidSymbolNotFound ? garrow_decimal_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  this(int precision, int scale)
  {
    GArrowDecimalDataType* _cretval;
    GError *_err;
    _cretval = garrow_decimal_data_type_new(precision, scale, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  int getPrecision()
  {
    int _retval;
    _retval = garrow_decimal_data_type_get_precision(cast(GArrowDecimalDataType*)cPtr);
    return _retval;
  }

  /** */
  int getScale()
  {
    int _retval;
    _retval = garrow_decimal_data_type_get_scale(cast(GArrowDecimalDataType*)cPtr);
    return _retval;
  }
}
