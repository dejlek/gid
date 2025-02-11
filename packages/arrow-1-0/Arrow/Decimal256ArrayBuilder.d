module Arrow.Decimal256ArrayBuilder;

import Arrow.Decimal256;
import Arrow.Decimal256DataType;
import Arrow.FixedSizeBinaryArrayBuilder;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class Decimal256ArrayBuilder : FixedSizeBinaryArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_decimal256_array_builder_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Decimal256DataType dataType)
  {
    GArrowDecimal256ArrayBuilder* _cretval;
    _cretval = garrow_decimal256_array_builder_new(dataType ? cast(GArrowDecimal256DataType*)dataType.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  alias appendValue = FixedSizeBinaryArrayBuilder.appendValue;

  bool appendValue(Decimal256 value)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_decimal256_array_builder_append_value(cast(GArrowDecimal256ArrayBuilder*)cPtr, value ? cast(GArrowDecimal256*)value.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  alias appendValues = FixedSizeBinaryArrayBuilder.appendValues;

  /**
   * Append multiple values at once. It's more efficient than multiple
   * `append` and `append_null` calls.
   * Params:
   *   values = The array of #GArrowDecimal256.
   *   isValids = The array of
   *     boolean that shows whether the Nth value is valid or not. If the
   *     Nth is_valids is %TRUE, the Nth values is valid value. Otherwise
   *     the Nth value is null value.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool appendValues(Decimal256[] values, bool[] isValids)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    GArrowDecimal256*[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= obj ? cast(GArrowDecimal256*)obj.cPtr : null;
    GArrowDecimal256** _values = cast(GArrowDecimal256**)_tmpvalues.ptr;

    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(bool)*)isValids.ptr;
    GError *_err;
    _retval = garrow_decimal256_array_builder_append_values(cast(GArrowDecimal256ArrayBuilder*)cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
