module arrow.month_interval_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.global;
import glib.error;

class MonthIntervalArrayBuilder : ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_month_interval_array_builder_get_type != &gidSymbolNotFound ? garrow_month_interval_array_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowMonthIntervalArrayBuilder* _cretval;
    _cretval = garrow_month_interval_array_builder_new();
    this(_cretval, Yes.Take);
  }

  bool appendValue(int value)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_month_interval_array_builder_append_value(cast(GArrowMonthIntervalArrayBuilder*)cPtr, value, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Append multiple values at once. It's more efficient than multiple
   * `append` calls.
   * Params:
   *   values = The array of the month.
   *   isValids = The array of
   *     boolean that shows whether the Nth value is valid or not. If the
   *     Nth `is_valids` is %TRUE, the Nth `values` is valid value. Otherwise
   *     the Nth value is null value.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool appendValues(int[] values, bool[] isValids)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    auto _values = cast(const(int)*)values.ptr;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(bool)*)isValids.ptr;
    GError *_err;
    _retval = garrow_month_interval_array_builder_append_values(cast(GArrowMonthIntervalArrayBuilder*)cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
