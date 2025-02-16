module Arrow.Decimal32DataType;

import Arrow.DecimalDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class Decimal32DataType : DecimalDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal32_data_type_get_type != &gidSymbolNotFound ? garrow_decimal32_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(int precision, int scale)
  {
    GArrowDecimal32DataType* _cretval;
    GError *_err;
    _cretval = garrow_decimal32_data_type_new(precision, scale, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  static int maxPrecision()
  {
    int _retval;
    _retval = garrow_decimal32_data_type_max_precision();
    return _retval;
  }
}
