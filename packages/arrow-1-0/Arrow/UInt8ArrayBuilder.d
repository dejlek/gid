module Arrow.UInt8ArrayBuilder;

import Arrow.ArrayBuilder;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class UInt8ArrayBuilder : ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_uint8_array_builder_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowUInt8ArrayBuilder* _cretval;
    _cretval = garrow_uint8_array_builder_new();
    this(_cretval, Yes.Take);
  }

  bool append(ubyte value)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_uint8_array_builder_append(cast(GArrowUInt8ArrayBuilder*)cPtr, value, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool appendValue(ubyte value)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_uint8_array_builder_append_value(cast(GArrowUInt8ArrayBuilder*)cPtr, value, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Append multiple values at once. It's more efficient than multiple
   * `append` and `append_null` calls.
   * Params:
   *   values = The array of uint8.
   *   isValids = The array of
   *     boolean that shows whether the Nth value is valid or not. If the
   *     Nth `is_valids` is %TRUE, the Nth `values` is valid value. Otherwise
   *     the Nth value is null value.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool appendValues(ubyte[] values, bool[] isValids)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    auto _values = cast(const(ubyte)*)values.ptr;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(bool)*)isValids.ptr;
    GError *_err;
    _retval = garrow_uint8_array_builder_append_values(cast(GArrowUInt8ArrayBuilder*)cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
