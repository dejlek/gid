module arrow.array;

import arrow.boolean_array;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.cast_options;
import arrow.chunked_array;
import arrow.count_options;
import arrow.data_type;
import arrow.dictionary_array;
import arrow.equal_options;
import arrow.filter_options;
import arrow.run_end_encode_options;
import arrow.run_end_encoded_array;
import arrow.struct_array;
import arrow.take_options;
import arrow.types;
import arrow.uint64_array;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class Array : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_array_get_type != &gidSymbolNotFound ? garrow_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  static arrow.array.Array import_(void* cAbiArray, arrow.data_type.DataType dataType)
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_array_import(cAbiArray, dataType ? cast(GArrowDataType*)dataType.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array cast_(arrow.data_type.DataType targetDataType, arrow.cast_options.CastOptions options = null)
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_array_cast(cast(GArrowArray*)cPtr, targetDataType ? cast(GArrowDataType*)targetDataType.cPtr(No.Dup) : null, options ? cast(GArrowCastOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array concatenate(arrow.array.Array[] otherArrays)
  {
    GArrowArray* _cretval;
    auto _otherArrays = gListFromD!(arrow.array.Array)(otherArrays);
    scope(exit) containerFree!(GList*, arrow.array.Array, GidOwnership.None)(_otherArrays);
    GError *_err;
    _cretval = garrow_array_concatenate(cast(GArrowArray*)cPtr, _otherArrays, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  long count(arrow.count_options.CountOptions options = null)
  {
    long _retval;
    GError *_err;
    _retval = garrow_array_count(cast(GArrowArray*)cPtr, options ? cast(GArrowCountOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /** */
  arrow.struct_array.StructArray countValues()
  {
    GArrowStructArray* _cretval;
    GError *_err;
    _cretval = garrow_array_count_values(cast(GArrowArray*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.struct_array.StructArray)(cast(GArrowStructArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.dictionary_array.DictionaryArray dictionaryEncode()
  {
    GArrowDictionaryArray* _cretval;
    GError *_err;
    _cretval = garrow_array_dictionary_encode(cast(GArrowArray*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.dictionary_array.DictionaryArray)(cast(GArrowDictionaryArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  string diffUnified(arrow.array.Array otherArray)
  {
    char* _cretval;
    _cretval = garrow_array_diff_unified(cast(GArrowArray*)cPtr, otherArray ? cast(GArrowArray*)otherArray.cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  bool equal(arrow.array.Array otherArray)
  {
    bool _retval;
    _retval = garrow_array_equal(cast(GArrowArray*)cPtr, otherArray ? cast(GArrowArray*)otherArray.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool equalApprox(arrow.array.Array otherArray)
  {
    bool _retval;
    _retval = garrow_array_equal_approx(cast(GArrowArray*)cPtr, otherArray ? cast(GArrowArray*)otherArray.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool equalOptions(arrow.array.Array otherArray, arrow.equal_options.EqualOptions options = null)
  {
    bool _retval;
    _retval = garrow_array_equal_options(cast(GArrowArray*)cPtr, otherArray ? cast(GArrowArray*)otherArray.cPtr(No.Dup) : null, options ? cast(GArrowEqualOptions*)options.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool equalRange(long startIndex, arrow.array.Array otherArray, long otherStartIndex, long endIndex, arrow.equal_options.EqualOptions options = null)
  {
    bool _retval;
    _retval = garrow_array_equal_range(cast(GArrowArray*)cPtr, startIndex, otherArray ? cast(GArrowArray*)otherArray.cPtr(No.Dup) : null, otherStartIndex, endIndex, options ? cast(GArrowEqualOptions*)options.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool export_(out void* cAbiArray, out void* cAbiSchema)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_array_export(cast(GArrowArray*)cPtr, cast(void**)&cAbiArray, cast(void**)&cAbiSchema, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /** */
  arrow.array.Array filter(arrow.boolean_array.BooleanArray filter, arrow.filter_options.FilterOptions options = null)
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_array_filter(cast(GArrowArray*)cPtr, filter ? cast(GArrowBooleanArray*)filter.cPtr(No.Dup) : null, options ? cast(GArrowFilterOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  long getLength()
  {
    long _retval;
    _retval = garrow_array_get_length(cast(GArrowArray*)cPtr);
    return _retval;
  }

  /** */
  long getNNulls()
  {
    long _retval;
    _retval = garrow_array_get_n_nulls(cast(GArrowArray*)cPtr);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer getNullBitmap()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_array_get_null_bitmap(cast(GArrowArray*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  long getOffset()
  {
    long _retval;
    _retval = garrow_array_get_offset(cast(GArrowArray*)cPtr);
    return _retval;
  }

  /** */
  arrow.data_type.DataType getValueDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_array_get_value_data_type(cast(GArrowArray*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.types.Type getValueType()
  {
    GArrowType _cretval;
    _cretval = garrow_array_get_value_type(cast(GArrowArray*)cPtr);
    arrow.types.Type _retval = cast(arrow.types.Type)_cretval;
    return _retval;
  }

  /** */
  arrow.boolean_array.BooleanArray isIn(arrow.array.Array right)
  {
    GArrowBooleanArray* _cretval;
    GError *_err;
    _cretval = garrow_array_is_in(cast(GArrowArray*)cPtr, right ? cast(GArrowArray*)right.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.boolean_array.BooleanArray)(cast(GArrowBooleanArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.boolean_array.BooleanArray isInChunkedArray(arrow.chunked_array.ChunkedArray right)
  {
    GArrowBooleanArray* _cretval;
    GError *_err;
    _cretval = garrow_array_is_in_chunked_array(cast(GArrowArray*)cPtr, right ? cast(GArrowChunkedArray*)right.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.boolean_array.BooleanArray)(cast(GArrowBooleanArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool isNull(long i)
  {
    bool _retval;
    _retval = garrow_array_is_null(cast(GArrowArray*)cPtr, i);
    return _retval;
  }

  /** */
  bool isValid(long i)
  {
    bool _retval;
    _retval = garrow_array_is_valid(cast(GArrowArray*)cPtr, i);
    return _retval;
  }

  /** */
  arrow.run_end_encoded_array.RunEndEncodedArray runEndEncode(arrow.run_end_encode_options.RunEndEncodeOptions options = null)
  {
    GArrowRunEndEncodedArray* _cretval;
    GError *_err;
    _cretval = garrow_array_run_end_encode(cast(GArrowArray*)cPtr, options ? cast(GArrowRunEndEncodeOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.run_end_encoded_array.RunEndEncodedArray)(cast(GArrowRunEndEncodedArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array slice(long offset, long length)
  {
    GArrowArray* _cretval;
    _cretval = garrow_array_slice(cast(GArrowArray*)cPtr, offset, length);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.uint64_array.UInt64Array sortIndices(arrow.types.SortOrder order)
  {
    GArrowUInt64Array* _cretval;
    GError *_err;
    _cretval = garrow_array_sort_indices(cast(GArrowArray*)cPtr, order, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.uint64_array.UInt64Array)(cast(GArrowUInt64Array*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.uint64_array.UInt64Array sortToIndices()
  {
    GArrowUInt64Array* _cretval;
    GError *_err;
    _cretval = garrow_array_sort_to_indices(cast(GArrowArray*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.uint64_array.UInt64Array)(cast(GArrowUInt64Array*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array take(arrow.array.Array indices, arrow.take_options.TakeOptions options = null)
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_array_take(cast(GArrowArray*)cPtr, indices ? cast(GArrowArray*)indices.cPtr(No.Dup) : null, options ? cast(GArrowTakeOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.chunked_array.ChunkedArray takeChunkedArray(arrow.chunked_array.ChunkedArray indices, arrow.take_options.TakeOptions options = null)
  {
    GArrowChunkedArray* _cretval;
    GError *_err;
    _cretval = garrow_array_take_chunked_array(cast(GArrowArray*)cPtr, indices ? cast(GArrowChunkedArray*)indices.cPtr(No.Dup) : null, options ? cast(GArrowTakeOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.chunked_array.ChunkedArray)(cast(GArrowChunkedArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    GError *_err;
    _cretval = garrow_array_to_string(cast(GArrowArray*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  arrow.array.Array unique()
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_array_unique(cast(GArrowArray*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array view(arrow.data_type.DataType returnType)
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_array_view(cast(GArrowArray*)cPtr, returnType ? cast(GArrowDataType*)returnType.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}
