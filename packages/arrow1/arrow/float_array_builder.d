module arrow.float_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class FloatArrayBuilder : arrow.array_builder.ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_float_array_builder_get_type != &gidSymbolNotFound ? garrow_float_array_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this()
  {
    GArrowFloatArrayBuilder* _cretval;
    _cretval = garrow_float_array_builder_new();
    this(_cretval, Yes.Take);
  }

  /** */
  bool append(float value)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_float_array_builder_append(cast(GArrowFloatArrayBuilder*)cPtr, value, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /** */
  bool appendValue(float value)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_float_array_builder_append_value(cast(GArrowFloatArrayBuilder*)cPtr, value, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Append multiple values at once. It's more efficient than multiple
    `append` and `append_null` calls.
    Params:
      values =       The array of float.
      isValids =       The array of
          boolean that shows whether the Nth value is valid or not. If the
          Nth `is_valids` is true, the Nth `values` is valid value. Otherwise
          the Nth value is null value.
    Returns:     true on success, false if there was an error.
  */
  bool appendValues(float[] values, bool[] isValids = null)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    auto _values = cast(const(float)*)values.ptr;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(bool)*)isValids.ptr;
    GError *_err;
    _retval = garrow_float_array_builder_append_values(cast(GArrowFloatArrayBuilder*)cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
