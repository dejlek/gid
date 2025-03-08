module arrow.decimal256_array;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal256;
import arrow.fixed_size_binary_array;
import arrow.types;
import gid.gid;
import glib.bytes;
import gobject.object;

/** */
class Decimal256Array : arrow.fixed_size_binary_array.FixedSizeBinaryArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal256_array_get_type != &gidSymbolNotFound ? garrow_decimal256_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  string formatValue(long i)
  {
    char* _cretval;
    _cretval = garrow_decimal256_array_format_value(cast(GArrowDecimal256Array*)cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  alias getValue = arrow.fixed_size_binary_array.FixedSizeBinaryArray.getValue;

  /** */
  arrow.decimal256.Decimal256 getValue(long i)
  {
    GArrowDecimal256* _cretval;
    _cretval = garrow_decimal256_array_get_value(cast(GArrowDecimal256Array*)cPtr, i);
    auto _retval = ObjectG.getDObject!(arrow.decimal256.Decimal256)(cast(GArrowDecimal256*)_cretval, Yes.Take);
    return _retval;
  }
}
