module Arrow.StringArrayBuilder;

import Arrow.BinaryArrayBuilder;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class StringArrayBuilder : BinaryArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_string_array_builder_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowStringArrayBuilder* _cretval;
    _cretval = garrow_string_array_builder_new();
    this(_cretval, Yes.Take);
  }

  alias append = BinaryArrayBuilder.append;

  bool append(string value)
  {
    bool _retval;
    const(char)* _value = value.toCString(No.Alloc);
    GError *_err;
    _retval = garrow_string_array_builder_append(cast(GArrowStringArrayBuilder*)cPtr, _value, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool appendString(string value)
  {
    bool _retval;
    const(char)* _value = value.toCString(No.Alloc);
    GError *_err;
    _retval = garrow_string_array_builder_append_string(cast(GArrowStringArrayBuilder*)cPtr, _value, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool appendStringLen(string value, int length)
  {
    bool _retval;
    const(char)* _value = value.toCString(No.Alloc);
    GError *_err;
    _retval = garrow_string_array_builder_append_string_len(cast(GArrowStringArrayBuilder*)cPtr, _value, length, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Append multiple values at once. It's more efficient than multiple
   * `append` and `append_null` calls.
   * Params:
   *   values = The array of strings.
   *   isValids = The array of
   *     boolean that shows whether the Nth value is valid or not. If the
   *     Nth is_valids is %TRUE, the Nth values is valid value. Otherwise
   *     the Nth value is null value.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool appendStrings(string[] values, bool[] isValids)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    char*[] _tmpvalues;
    foreach (s; values)
      _tmpvalues ~= s.toCString(No.Alloc);
    const(char*)* _values = _tmpvalues.ptr;

    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(bool)*)isValids.ptr;
    GError *_err;
    _retval = garrow_string_array_builder_append_strings(cast(GArrowStringArrayBuilder*)cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
