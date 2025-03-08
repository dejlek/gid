module arrow.table;

import arrow.array;
import arrow.boolean_array;
import arrow.c.functions;
import arrow.c.types;
import arrow.chunked_array;
import arrow.feather_write_properties;
import arrow.field;
import arrow.filter_options;
import arrow.output_stream;
import arrow.record_batch;
import arrow.schema;
import arrow.sort_options;
import arrow.table_concatenate_options;
import arrow.take_options;
import arrow.types;
import arrow.uint64_array;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class Table : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_table_get_type != &gidSymbolNotFound ? garrow_table_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  static arrow.table.Table newArrays(arrow.schema.Schema schema, arrow.array.Array[] arrays)
  {
    GArrowTable* _cretval;
    size_t _nArrays;
    if (arrays)
      _nArrays = cast(size_t)arrays.length;

    GArrowArray*[] _tmparrays;
    foreach (obj; arrays)
      _tmparrays ~= obj ? cast(GArrowArray*)obj.cPtr : null;
    GArrowArray** _arrays = cast(GArrowArray**)_tmparrays.ptr;

    GError *_err;
    _cretval = garrow_table_new_arrays(schema ? cast(GArrowSchema*)schema.cPtr(No.dup) : null, _arrays, _nArrays, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  static arrow.table.Table newChunkedArrays(arrow.schema.Schema schema, arrow.chunked_array.ChunkedArray[] chunkedArrays)
  {
    GArrowTable* _cretval;
    size_t _nChunkedArrays;
    if (chunkedArrays)
      _nChunkedArrays = cast(size_t)chunkedArrays.length;

    GArrowChunkedArray*[] _tmpchunkedArrays;
    foreach (obj; chunkedArrays)
      _tmpchunkedArrays ~= obj ? cast(GArrowChunkedArray*)obj.cPtr : null;
    GArrowChunkedArray** _chunkedArrays = cast(GArrowChunkedArray**)_tmpchunkedArrays.ptr;

    GError *_err;
    _cretval = garrow_table_new_chunked_arrays(schema ? cast(GArrowSchema*)schema.cPtr(No.dup) : null, _chunkedArrays, _nChunkedArrays, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  static arrow.table.Table newRecordBatches(arrow.schema.Schema schema, arrow.record_batch.RecordBatch[] recordBatches)
  {
    GArrowTable* _cretval;
    size_t _nRecordBatches;
    if (recordBatches)
      _nRecordBatches = cast(size_t)recordBatches.length;

    GArrowRecordBatch*[] _tmprecordBatches;
    foreach (obj; recordBatches)
      _tmprecordBatches ~= obj ? cast(GArrowRecordBatch*)obj.cPtr : null;
    GArrowRecordBatch** _recordBatches = cast(GArrowRecordBatch**)_tmprecordBatches.ptr;

    GError *_err;
    _cretval = garrow_table_new_record_batches(schema ? cast(GArrowSchema*)schema.cPtr(No.dup) : null, _recordBatches, _nRecordBatches, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.table.Table addColumn(uint i, arrow.field.Field field, arrow.chunked_array.ChunkedArray chunkedArray)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_add_column(cast(GArrowTable*)cPtr, i, field ? cast(GArrowField*)field.cPtr(No.dup) : null, chunkedArray ? cast(GArrowChunkedArray*)chunkedArray.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.table.Table combineChunks()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_combine_chunks(cast(GArrowTable*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.table.Table concatenate(arrow.table.Table[] otherTables, arrow.table_concatenate_options.TableConcatenateOptions options = null)
  {
    GArrowTable* _cretval;
    auto _otherTables = gListFromD!(arrow.table.Table)(otherTables);
    scope(exit) containerFree!(GList*, arrow.table.Table, GidOwnership.None)(_otherTables);
    GError *_err;
    _cretval = garrow_table_concatenate(cast(GArrowTable*)cPtr, _otherTables, options ? cast(GArrowTableConcatenateOptions*)options.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  bool equal(arrow.table.Table otherTable)
  {
    bool _retval;
    _retval = garrow_table_equal(cast(GArrowTable*)cPtr, otherTable ? cast(GArrowTable*)otherTable.cPtr(No.dup) : null);
    return _retval;
  }

  /** */
  bool equalMetadata(arrow.table.Table otherTable, bool checkMetadata)
  {
    bool _retval;
    _retval = garrow_table_equal_metadata(cast(GArrowTable*)cPtr, otherTable ? cast(GArrowTable*)otherTable.cPtr(No.dup) : null, checkMetadata);
    return _retval;
  }

  /** */
  arrow.table.Table filter(arrow.boolean_array.BooleanArray filter, arrow.filter_options.FilterOptions options = null)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_filter(cast(GArrowTable*)cPtr, filter ? cast(GArrowBooleanArray*)filter.cPtr(No.dup) : null, options ? cast(GArrowFilterOptions*)options.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.table.Table filterChunkedArray(arrow.chunked_array.ChunkedArray filter, arrow.filter_options.FilterOptions options = null)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_filter_chunked_array(cast(GArrowTable*)cPtr, filter ? cast(GArrowChunkedArray*)filter.cPtr(No.dup) : null, options ? cast(GArrowFilterOptions*)options.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.chunked_array.ChunkedArray getColumnData(int i)
  {
    GArrowChunkedArray* _cretval;
    _cretval = garrow_table_get_column_data(cast(GArrowTable*)cPtr, i);
    auto _retval = ObjectG.getDObject!(arrow.chunked_array.ChunkedArray)(cast(GArrowChunkedArray*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  uint getNColumns()
  {
    uint _retval;
    _retval = garrow_table_get_n_columns(cast(GArrowTable*)cPtr);
    return _retval;
  }

  /** */
  ulong getNRows()
  {
    ulong _retval;
    _retval = garrow_table_get_n_rows(cast(GArrowTable*)cPtr);
    return _retval;
  }

  /** */
  arrow.schema.Schema getSchema()
  {
    GArrowSchema* _cretval;
    _cretval = garrow_table_get_schema(cast(GArrowTable*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.table.Table removeColumn(uint i)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_remove_column(cast(GArrowTable*)cPtr, i, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.table.Table replaceColumn(uint i, arrow.field.Field field, arrow.chunked_array.ChunkedArray chunkedArray)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_replace_column(cast(GArrowTable*)cPtr, i, field ? cast(GArrowField*)field.cPtr(No.dup) : null, chunkedArray ? cast(GArrowChunkedArray*)chunkedArray.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.table.Table slice(long offset, long length)
  {
    GArrowTable* _cretval;
    _cretval = garrow_table_slice(cast(GArrowTable*)cPtr, offset, length);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.uint64_array.UInt64Array sortIndices(arrow.sort_options.SortOptions options)
  {
    GArrowUInt64Array* _cretval;
    GError *_err;
    _cretval = garrow_table_sort_indices(cast(GArrowTable*)cPtr, options ? cast(GArrowSortOptions*)options.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.uint64_array.UInt64Array)(cast(GArrowUInt64Array*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.table.Table take(arrow.array.Array indices, arrow.take_options.TakeOptions options = null)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_take(cast(GArrowTable*)cPtr, indices ? cast(GArrowArray*)indices.cPtr(No.dup) : null, options ? cast(GArrowTakeOptions*)options.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.table.Table takeChunkedArray(arrow.chunked_array.ChunkedArray indices, arrow.take_options.TakeOptions options = null)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_take_chunked_array(cast(GArrowTable*)cPtr, indices ? cast(GArrowChunkedArray*)indices.cPtr(No.dup) : null, options ? cast(GArrowTakeOptions*)options.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    GError *_err;
    _cretval = garrow_table_to_string(cast(GArrowTable*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
    return _retval;
  }

  /**
      Writes the table as Feather format data to the sink.
    Params:
      sink =       The output.
      properties =       The properties for this write.
    Returns:     true on success, false if there was an error.
  */
  bool writeAsFeather(arrow.output_stream.OutputStream sink, arrow.feather_write_properties.FeatherWriteProperties properties = null)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_table_write_as_feather(cast(GArrowTable*)cPtr, sink ? cast(GArrowOutputStream*)sink.cPtr(No.dup) : null, properties ? cast(GArrowFeatherWriteProperties*)properties.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
