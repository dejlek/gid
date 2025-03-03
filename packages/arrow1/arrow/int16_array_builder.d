module arrow.int16_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;

class Int16ArrayBuilder : arrow.array_builder.ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_int16_array_builder_get_type != &gidSymbolNotFound ? garrow_int16_array_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowInt16ArrayBuilder* _cretval;
    _cretval = garrow_int16_array_builder_new();
    this(_cretval, Yes.Take);
  }

  bool append(short value)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_int16_array_builder_append(cast(GArrowInt16ArrayBuilder*)cPtr, value, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool appendValue(short value)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_int16_array_builder_append_value(cast(GArrowInt16ArrayBuilder*)cPtr, value, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Append multiple values at once. It's more efficient than multiple
   * `append` and `append_null` calls.
   * Params:
   *   values = The array of int16.
   *   isValids = The array of
   *     boolean that shows whether the Nth value is valid or not. If the
   *     Nth `is_valids` is %TRUE, the Nth `values` is valid value. Otherwise
   *     the Nth value is null value.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool appendValues(short[] values, bool[] isValids)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    auto _values = cast(const(short)*)values.ptr;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(bool)*)isValids.ptr;
    GError *_err;
    _retval = garrow_int16_array_builder_append_values(cast(GArrowInt16ArrayBuilder*)cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
