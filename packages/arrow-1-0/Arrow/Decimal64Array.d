module Arrow.Decimal64Array;

import Arrow.Decimal64;
import Arrow.FixedSizeBinaryArray;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class Decimal64Array : FixedSizeBinaryArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_decimal64_array_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  string formatValue(long i)
  {
    char* _cretval;
    _cretval = garrow_decimal64_array_format_value(cast(GArrowDecimal64Array*)cPtr, i);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  alias getValue = FixedSizeBinaryArray.getValue;

  Decimal64 getValue(long i)
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_array_get_value(cast(GArrowDecimal64Array*)cPtr, i);
    auto _retval = ObjectG.getDObject!Decimal64(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }
}
