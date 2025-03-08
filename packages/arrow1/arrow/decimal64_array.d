module arrow.decimal64_array;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal64;
import arrow.fixed_size_binary_array;
import arrow.types;
import gid.gid;
import glib.bytes;
import gobject.object;

/** */
class Decimal64Array : arrow.fixed_size_binary_array.FixedSizeBinaryArray
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal64_array_get_type != &gidSymbolNotFound ? garrow_decimal64_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  string formatValue(long i)
  {
    char* _cretval;
    _cretval = garrow_decimal64_array_format_value(cast(GArrowDecimal64Array*)cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
    return _retval;
  }

  alias getValue = arrow.fixed_size_binary_array.FixedSizeBinaryArray.getValue;

  /** */
  arrow.decimal64.Decimal64 getValue(long i)
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_array_get_value(cast(GArrowDecimal64Array*)cPtr, i);
    auto _retval = ObjectG.getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.take);
    return _retval;
  }
}
