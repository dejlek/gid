/// Module for [Decimal128Array] class
module arrow.decimal128_array;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal128;
import arrow.fixed_size_binary_array;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class Decimal128Array : arrow.fixed_size_binary_array.FixedSizeBinaryArray
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
    return cast(void function())garrow_decimal128_array_get_type != &gidSymbolNotFound ? garrow_decimal128_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Decimal128Array self()
  {
    return this;
  }

  /** */
  string formatValue(long i)
  {
    char* _cretval;
    _cretval = garrow_decimal128_array_format_value(cast(GArrowDecimal128Array*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  alias getValue = arrow.fixed_size_binary_array.FixedSizeBinaryArray.getValue;

  /** */
  arrow.decimal128.Decimal128 getValue(long i)
  {
    GArrowDecimal128* _cretval;
    _cretval = garrow_decimal128_array_get_value(cast(GArrowDecimal128Array*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal128.Decimal128)(cast(GArrowDecimal128*)_cretval, Yes.Take);
    return _retval;
  }
}
