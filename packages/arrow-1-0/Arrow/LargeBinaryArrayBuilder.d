module Arrow.LargeBinaryArrayBuilder;

import Arrow.ArrayBuilder;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.Bytes;
import GLib.ErrorG;
import Gid.gid;

class LargeBinaryArrayBuilder : ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_large_binary_array_builder_get_type != &gidSymbolNotFound ? garrow_large_binary_array_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowLargeBinaryArrayBuilder* _cretval;
    _cretval = garrow_large_binary_array_builder_new();
    this(_cretval, Yes.Take);
  }

  bool appendValue(ubyte[] value)
  {
    bool _retval;
    long _length;
    if (value)
      _length = cast(long)value.length;

    auto _value = cast(const(ubyte)*)value.ptr;
    GError *_err;
    _retval = garrow_large_binary_array_builder_append_value(cast(GArrowLargeBinaryArrayBuilder*)cPtr, _value, _length, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool appendValueBytes(Bytes value)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_large_binary_array_builder_append_value_bytes(cast(GArrowLargeBinaryArrayBuilder*)cPtr, value ? cast(GBytes*)value.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Append multiple values at once. It's more efficient than multiple
   * `append` and `append_null` calls.
   * Params:
   *   values = The array of #GBytes.
   *   isValids = The array of
   *     boolean that shows whether the Nth value is valid or not. If the
   *     Nth is_valids is %TRUE, the Nth values is valid value. Otherwise
   *     the Nth value is null value.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool appendValues(Bytes[] values, bool[] isValids)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    GBytes*[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= cast(GBytes*)obj.cPtr;
    GBytes** _values = _tmpvalues.ptr;

    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(bool)*)isValids.ptr;
    GError *_err;
    _retval = garrow_large_binary_array_builder_append_values(cast(GArrowLargeBinaryArrayBuilder*)cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
