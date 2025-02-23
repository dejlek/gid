module arrow.decimal32_array;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal32;
import arrow.fixed_size_binary_array;
import arrow.types;
import gid.gid;
import gobject.object;

class Decimal32Array : FixedSizeBinaryArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal32_array_get_type != &gidSymbolNotFound ? garrow_decimal32_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  string formatValue(long i)
  {
    char* _cretval;
    _cretval = garrow_decimal32_array_format_value(cast(GArrowDecimal32Array*)cPtr, i);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  alias getValue = FixedSizeBinaryArray.getValue;

  Decimal32 getValue(long i)
  {
    GArrowDecimal32* _cretval;
    _cretval = garrow_decimal32_array_get_value(cast(GArrowDecimal32Array*)cPtr, i);
    auto _retval = ObjectG.getDObject!Decimal32(cast(GArrowDecimal32*)_cretval, Yes.Take);
    return _retval;
  }
}
