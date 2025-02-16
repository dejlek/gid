module Arrow.DecimalDataType;

import Arrow.FixedSizeBinaryDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class DecimalDataType : FixedSizeBinaryDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal_data_type_get_type != &gidSymbolNotFound ? garrow_decimal_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(int precision, int scale)
  {
    GArrowDecimalDataType* _cretval;
    GError *_err;
    _cretval = garrow_decimal_data_type_new(precision, scale, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  int getPrecision()
  {
    int _retval;
    _retval = garrow_decimal_data_type_get_precision(cast(GArrowDecimalDataType*)cPtr);
    return _retval;
  }

  int getScale()
  {
    int _retval;
    _retval = garrow_decimal_data_type_get_scale(cast(GArrowDecimalDataType*)cPtr);
    return _retval;
  }
}
