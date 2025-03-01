module arrow.decimal128_array;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal128;
import arrow.fixed_size_binary_array;
import arrow.types;
import gid.global;
import glib.bytes;
import gobject.object;

class Decimal128Array : FixedSizeBinaryArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal128_array_get_type != &gidSymbolNotFound ? garrow_decimal128_array_get_type() : cast(GType)0;
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
