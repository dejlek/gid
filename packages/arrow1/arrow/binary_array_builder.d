module arrow.binary_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.global;
import glib.bytes;
import glib.error;

class BinaryArrayBuilder : ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_binary_array_builder_get_type != &gidSymbolNotFound ? garrow_binary_array_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowBinaryArrayBuilder* _cretval;
    _cretval = garrow_binary_array_builder_new();
    this(_cretval, Yes.Take);
  }

  bool append(ubyte[] value)
  {
    bool _retval;
    int _length;
    if (value)
      _length = cast(int)value.length;

    auto _value = cast(const(ubyte)*)value.ptr;
    GError *_err;
    _retval = garrow_binary_array_builder_append(cast(GArrowBinaryArrayBuilder*)cPtr, _value, _length, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool appendValue(ubyte[] value)
  {
    bool _retval;
    int _length;
    if (value)
      _length = cast(int)value.length;

    auto _value = cast(const(ubyte)*)value.ptr;
    GError *_err;
    _retval = garrow_binary_array_builder_append_value(cast(GArrowBinaryArrayBuilder*)cPtr, _value, _length, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool appendValueBytes(Bytes value)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_binary_array_builder_append_value_bytes(cast(GArrowBinaryArrayBuilder*)cPtr, value ? cast(GBytes*)value.cPtr(No.Dup) : null, &_err);
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
    _retval = garrow_binary_array_builder_append_values(cast(GArrowBinaryArrayBuilder*)cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
