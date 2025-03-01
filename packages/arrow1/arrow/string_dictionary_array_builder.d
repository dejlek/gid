module arrow.string_dictionary_array_builder;

import arrow.array;
import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.string_array;
import arrow.types;
import gid.global;
import glib.error;

class StringDictionaryArrayBuilder : ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_string_dictionary_array_builder_get_type != &gidSymbolNotFound ? garrow_string_dictionary_array_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowStringDictionaryArrayBuilder* _cretval;
    _cretval = garrow_string_dictionary_array_builder_new();
    this(_cretval, Yes.Take);
  }

  bool appendArray(StringArray array)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_string_dictionary_array_builder_append_array(cast(GArrowStringDictionaryArrayBuilder*)cPtr, array ? cast(GArrowStringArray*)array.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Append dictionary indices directly without modifying the internal memo.
   * Params:
   *   values = The array of indices.
   *   isValids = The array of
   *     %TRUE or %FALSE that shows whether the Nth value is valid or not. If the
   *     Nth `is_valids` is %TRUE, the Nth `values` is valid value. Otherwise
   *     the Nth value is null value.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool appendIndices(long[] values, bool[] isValids)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    auto _values = cast(const(long)*)values.ptr;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(bool)*)isValids.ptr;
    GError *_err;
    _retval = garrow_string_dictionary_array_builder_append_indices(cast(GArrowStringDictionaryArrayBuilder*)cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool appendString(string value)
  {
    bool _retval;
    const(char)* _value = value.toCString(No.Alloc);
    GError *_err;
    _retval = garrow_string_dictionary_array_builder_append_string(cast(GArrowStringDictionaryArrayBuilder*)cPtr, _value, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool finishDelta(out Array outIndices, out Array outDelta)
  {
    bool _retval;
    GArrowArray* _outIndices;
    GArrowArray* _outDelta;
    GError *_err;
    _retval = garrow_string_dictionary_array_builder_finish_delta(cast(GArrowStringDictionaryArrayBuilder*)cPtr, &_outIndices, &_outDelta, &_err);
    if (_err)
      throw new ErrorG(_err);
    outIndices = new Array(cast(void*)_outIndices, Yes.Take);
    outDelta = new Array(cast(void*)_outDelta, Yes.Take);
    return _retval;
  }

  long getDictionaryLength()
  {
    long _retval;
    _retval = garrow_string_dictionary_array_builder_get_dictionary_length(cast(GArrowStringDictionaryArrayBuilder*)cPtr);
    return _retval;
  }

  bool insertMemoValues(StringArray values)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_string_dictionary_array_builder_insert_memo_values(cast(GArrowStringDictionaryArrayBuilder*)cPtr, values ? cast(GArrowStringArray*)values.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Reset and also clear accumulated dictionary values in memo table.
   */
  void resetFull()
  {
    garrow_string_dictionary_array_builder_reset_full(cast(GArrowStringDictionaryArrayBuilder*)cPtr);
  }
}
