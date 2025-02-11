module Arrow.DayTimeIntervalArrayBuilder;

import Arrow.ArrayBuilder;
import Arrow.DayMillisecond;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class DayTimeIntervalArrayBuilder : ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_day_time_interval_array_builder_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowDayTimeIntervalArrayBuilder* _cretval;
    _cretval = garrow_day_time_interval_array_builder_new();
    this(_cretval, Yes.Take);
  }

  bool appendValue(DayMillisecond value)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_day_time_interval_array_builder_append_value(cast(GArrowDayTimeIntervalArrayBuilder*)cPtr, value ? cast(GArrowDayMillisecond*)value.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Append multiple values at once. It's more efficient than multiple
   * `append` calls.
   * Params:
   *   values = The array of a #GArrowDayMillisecond.
   *   isValids = The array of
   *     boolean that shows whether the Nth value is valid or not. If the
   *     Nth `is_valids` is %TRUE, the Nth `values` is valid value. Otherwise
   *     the Nth value is null value.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool appendValues(DayMillisecond[] values, bool[] isValids)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    GArrowDayMillisecond*[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= obj ? cast(GArrowDayMillisecond*)obj.cPtr : null;
    const(GArrowDayMillisecond*)* _values = cast(const(GArrowDayMillisecond*)*)_tmpvalues.ptr;

    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(bool)*)isValids.ptr;
    GError *_err;
    _retval = garrow_day_time_interval_array_builder_append_values(cast(GArrowDayTimeIntervalArrayBuilder*)cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
