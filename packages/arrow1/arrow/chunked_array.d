module arrow.chunked_array;

import arrow.array;
import arrow.boolean_array;
import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.filter_options;
import arrow.take_options;
import arrow.types;
import arrow.uint64_array;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class ChunkedArray : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_chunked_array_get_type != &gidSymbolNotFound ? garrow_chunked_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  this(arrow.array.Array[] chunks)
  {
    GArrowChunkedArray* _cretval;
    auto _chunks = gListFromD!(arrow.array.Array)(chunks);
    scope(exit) containerFree!(GList*, arrow.array.Array, GidOwnership.None)(_chunks);
    GError *_err;
    _cretval = garrow_chunked_array_new(_chunks, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  static arrow.chunked_array.ChunkedArray newEmpty(arrow.data_type.DataType dataType)
  {
    GArrowChunkedArray* _cretval;
    GError *_err;
    _cretval = garrow_chunked_array_new_empty(dataType ? cast(GArrowDataType*)dataType.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.chunked_array.ChunkedArray)(cast(GArrowChunkedArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array combine()
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_chunked_array_combine(cast(GArrowChunkedArray*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool equal(arrow.chunked_array.ChunkedArray otherChunkedArray)
  {
    bool _retval;
    _retval = garrow_chunked_array_equal(cast(GArrowChunkedArray*)cPtr, otherChunkedArray ? cast(GArrowChunkedArray*)otherChunkedArray.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.chunked_array.ChunkedArray filter(arrow.boolean_array.BooleanArray filter, arrow.filter_options.FilterOptions options = null)
  {
    GArrowChunkedArray* _cretval;
    GError *_err;
    _cretval = garrow_chunked_array_filter(cast(GArrowChunkedArray*)cPtr, filter ? cast(GArrowBooleanArray*)filter.cPtr(No.Dup) : null, options ? cast(GArrowFilterOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.chunked_array.ChunkedArray)(cast(GArrowChunkedArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.chunked_array.ChunkedArray filterChunkedArray(arrow.chunked_array.ChunkedArray filter, arrow.filter_options.FilterOptions options = null)
  {
    GArrowChunkedArray* _cretval;
    GError *_err;
    _cretval = garrow_chunked_array_filter_chunked_array(cast(GArrowChunkedArray*)cPtr, filter ? cast(GArrowChunkedArray*)filter.cPtr(No.Dup) : null, options ? cast(GArrowFilterOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.chunked_array.ChunkedArray)(cast(GArrowChunkedArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array getChunk(uint i)
  {
    GArrowArray* _cretval;
    _cretval = garrow_chunked_array_get_chunk(cast(GArrowChunkedArray*)cPtr, i);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array[] getChunks()
  {
    GList* _cretval;
    _cretval = garrow_chunked_array_get_chunks(cast(GArrowChunkedArray*)cPtr);
    auto _retval = gListToD!(arrow.array.Array, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  ulong getLength()
  {
    ulong _retval;
    _retval = garrow_chunked_array_get_length(cast(GArrowChunkedArray*)cPtr);
    return _retval;
  }

  /** */
  uint getNChunks()
  {
    uint _retval;
    _retval = garrow_chunked_array_get_n_chunks(cast(GArrowChunkedArray*)cPtr);
    return _retval;
  }

  /** */
  ulong getNNulls()
  {
    ulong _retval;
    _retval = garrow_chunked_array_get_n_nulls(cast(GArrowChunkedArray*)cPtr);
    return _retval;
  }

  /** */
  ulong getNRows()
  {
    ulong _retval;
    _retval = garrow_chunked_array_get_n_rows(cast(GArrowChunkedArray*)cPtr);
    return _retval;
  }

  /** */
  arrow.data_type.DataType getValueDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_chunked_array_get_value_data_type(cast(GArrowChunkedArray*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.types.Type getValueType()
  {
    GArrowType _cretval;
    _cretval = garrow_chunked_array_get_value_type(cast(GArrowChunkedArray*)cPtr);
    arrow.types.Type _retval = cast(arrow.types.Type)_cretval;
    return _retval;
  }

  /** */
  arrow.chunked_array.ChunkedArray slice(ulong offset, ulong length)
  {
    GArrowChunkedArray* _cretval;
    _cretval = garrow_chunked_array_slice(cast(GArrowChunkedArray*)cPtr, offset, length);
    auto _retval = ObjectG.getDObject!(arrow.chunked_array.ChunkedArray)(cast(GArrowChunkedArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.uint64_array.UInt64Array sortIndices(arrow.types.SortOrder order)
  {
    GArrowUInt64Array* _cretval;
    GError *_err;
    _cretval = garrow_chunked_array_sort_indices(cast(GArrowChunkedArray*)cPtr, order, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.uint64_array.UInt64Array)(cast(GArrowUInt64Array*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.chunked_array.ChunkedArray take(arrow.array.Array indices, arrow.take_options.TakeOptions options = null)
  {
    GArrowChunkedArray* _cretval;
    GError *_err;
    _cretval = garrow_chunked_array_take(cast(GArrowChunkedArray*)cPtr, indices ? cast(GArrowArray*)indices.cPtr(No.Dup) : null, options ? cast(GArrowTakeOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.chunked_array.ChunkedArray)(cast(GArrowChunkedArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.chunked_array.ChunkedArray takeChunkedArray(arrow.chunked_array.ChunkedArray indices, arrow.take_options.TakeOptions options = null)
  {
    GArrowChunkedArray* _cretval;
    GError *_err;
    _cretval = garrow_chunked_array_take_chunked_array(cast(GArrowChunkedArray*)cPtr, indices ? cast(GArrowChunkedArray*)indices.cPtr(No.Dup) : null, options ? cast(GArrowTakeOptions*)options.cPtr(No.Dup) : null, &_err);
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
    _cretval = garrow_chunked_array_to_string(cast(GArrowChunkedArray*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
