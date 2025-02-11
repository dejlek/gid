module Arrow.Decimal128DataType;

import Arrow.DecimalDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class Decimal128DataType : DecimalDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_decimal128_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(int precision, int scale)
  {
    GArrowDecimal128DataType* _cretval;
    GError *_err;
    _cretval = garrow_decimal128_data_type_new(precision, scale, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  static int maxPrecision()
  {
    int _retval;
    _retval = garrow_decimal128_data_type_max_precision();
    return _retval;
  }
}
