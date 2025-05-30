/// Module for [Decimal256Array] class
module arrow.decimal256_array;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal256;
import arrow.fixed_size_binary_array;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class Decimal256Array : arrow.fixed_size_binary_array.FixedSizeBinaryArray
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal256_array_get_type != &gidSymbolNotFound ? garrow_decimal256_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Decimal256Array self()
  {
    return this;
  }

  /** */
  string formatValue(long i)
  {
    char* _cretval;
    _cretval = garrow_decimal256_array_format_value(cast(GArrowDecimal256Array*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  alias getValue = arrow.fixed_size_binary_array.FixedSizeBinaryArray.getValue;

  /** */
  arrow.decimal256.Decimal256 getValue(long i)
  {
    GArrowDecimal256* _cretval;
    _cretval = garrow_decimal256_array_get_value(cast(GArrowDecimal256Array*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal256.Decimal256)(cast(GArrowDecimal256*)_cretval, Yes.Take);
    return _retval;
  }
}
