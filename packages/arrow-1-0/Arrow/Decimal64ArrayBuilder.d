module Arrow.Decimal64ArrayBuilder;

import Arrow.Decimal64;
import Arrow.Decimal64DataType;
import Arrow.FixedSizeBinaryArrayBuilder;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class Decimal64ArrayBuilder : FixedSizeBinaryArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal64_array_builder_get_type != &gidSymbolNotFound ? garrow_decimal64_array_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Decimal64DataType dataType)
  {
    GArrowDecimal64ArrayBuilder* _cretval;
    _cretval = garrow_decimal64_array_builder_new(dataType ? cast(GArrowDecimal64DataType*)dataType.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  alias appendValue = FixedSizeBinaryArrayBuilder.appendValue;

  bool appendValue(Decimal64 value)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_decimal64_array_builder_append_value(cast(GArrowDecimal64ArrayBuilder*)cPtr, value ? cast(GArrowDecimal64*)value.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  alias appendValues = FixedSizeBinaryArrayBuilder.appendValues;

  /**
   * Append multiple values at once. It's more efficient than multiple
   * `append` and `append_null` calls.
   * Params:
   *   values = The array of #GArrowDecimal64.
   *   isValids = The array of
   *     boolean that shows whether the Nth value is valid or not. If the
   *     Nth is_valids is %TRUE, the Nth values is valid value. Otherwise
   *     the Nth value is null value.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool appendValues(Decimal64[] values, bool[] isValids)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    GArrowDecimal64*[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= obj ? cast(GArrowDecimal64*)obj.cPtr : null;
    GArrowDecimal64** _values = cast(GArrowDecimal64**)_tmpvalues.ptr;

    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(bool)*)isValids.ptr;
    GError *_err;
    _retval = garrow_decimal64_array_builder_append_values(cast(GArrowDecimal64ArrayBuilder*)cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
