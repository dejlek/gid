module Arrow.MonthDayNanoIntervalArrayBuilder;

import Arrow.ArrayBuilder;
import Arrow.MonthDayNano;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class MonthDayNanoIntervalArrayBuilder : ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_month_day_nano_interval_array_builder_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowMonthDayNanoIntervalArrayBuilder* _cretval;
    _cretval = garrow_month_day_nano_interval_array_builder_new();
    this(_cretval, Yes.Take);
  }

  bool appendValue(MonthDayNano value)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_month_day_nano_interval_array_builder_append_value(cast(GArrowMonthDayNanoIntervalArrayBuilder*)cPtr, value ? cast(GArrowMonthDayNano*)value.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Append multiple values at once. It's more efficient than multiple
   * `append` calls.
   * Params:
   *   values = The array of a #GArrowMonthDayNano.
   *   isValids = The array of
   *     boolean that shows whether the Nth value is valid or not. If the
   *     Nth `is_valids` is %TRUE, the Nth `values` is valid value. Otherwise
   *     the Nth value is null value.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool appendValues(MonthDayNano[] values, bool[] isValids)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    GArrowMonthDayNano*[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= obj ? cast(GArrowMonthDayNano*)obj.cPtr : null;
    const(GArrowMonthDayNano*)* _values = cast(const(GArrowMonthDayNano*)*)_tmpvalues.ptr;

    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(bool)*)isValids.ptr;
    GError *_err;
    _retval = garrow_month_day_nano_interval_array_builder_append_values(cast(GArrowMonthDayNanoIntervalArrayBuilder*)cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
