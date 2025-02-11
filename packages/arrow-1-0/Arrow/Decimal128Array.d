module Arrow.Decimal128Array;

import Arrow.Decimal128;
import Arrow.FixedSizeBinaryArray;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class Decimal128Array : FixedSizeBinaryArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_decimal128_array_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  string formatValue(long i)
  {
    char* _cretval;
    _cretval = garrow_decimal128_array_format_value(cast(GArrowDecimal128Array*)cPtr, i);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  alias getValue = FixedSizeBinaryArray.getValue;

  Decimal128 getValue(long i)
  {
    GArrowDecimal128* _cretval;
    _cretval = garrow_decimal128_array_get_value(cast(GArrowDecimal128Array*)cPtr, i);
    auto _retval = ObjectG.getDObject!Decimal128(cast(GArrowDecimal128*)_cretval, Yes.Take);
    return _retval;
  }
}
