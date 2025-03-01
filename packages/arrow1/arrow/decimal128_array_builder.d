module arrow.decimal128_array_builder;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal128;
import arrow.decimal128_data_type;
import arrow.fixed_size_binary_array_builder;
import arrow.types;
import gid.global;
import glib.bytes;
import glib.error;

class Decimal128ArrayBuilder : FixedSizeBinaryArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal128_array_builder_get_type != &gidSymbolNotFound ? garrow_decimal128_array_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Decimal128DataType dataType)
  {
    GArrowDecimal128ArrayBuilder* _cretval;
    _cretval = garrow_decimal128_array_builder_new(dataType ? cast(GArrowDecimal128DataType*)dataType.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  bool append(Decimal128 value)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_decimal128_array_builder_append(cast(GArrowDecimal128ArrayBuilder*)cPtr, value ? cast(GArrowDecimal128*)value.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  alias appendValue = FixedSizeBinaryArrayBuilder.appendValue;

  bool appendValue(Decimal128 value)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_decimal128_array_builder_append_value(cast(GArrowDecimal128ArrayBuilder*)cPtr, value ? cast(GArrowDecimal128*)value.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  alias appendValues = FixedSizeBinaryArrayBuilder.appendValues;

  /**
   * Append multiple values at once. It's more efficient than multiple
   * `append` and `append_null` calls.
   * Params:
   *   values = The array of #GArrowDecimal128.
   *   isValids = The array of
   *     boolean that shows whether the Nth value is valid or not. If the
   *     Nth is_valids is %TRUE, the Nth values is valid value. Otherwise
   *     the Nth value is null value.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool appendValues(Decimal128[] values, bool[] isValids)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    GArrowDecimal128*[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= obj ? cast(GArrowDecimal128*)obj.cPtr : null;
    GArrowDecimal128** _values = cast(GArrowDecimal128**)_tmpvalues.ptr;

    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(bool)*)isValids.ptr;
    GError *_err;
    _retval = garrow_decimal128_array_builder_append_values(cast(GArrowDecimal128ArrayBuilder*)cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
