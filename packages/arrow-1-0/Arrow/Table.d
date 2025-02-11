module Arrow.Table;

import Arrow.Array;
import Arrow.BooleanArray;
import Arrow.ChunkedArray;
import Arrow.FeatherWriteProperties;
import Arrow.Field;
import Arrow.FilterOptions;
import Arrow.OutputStream;
import Arrow.RecordBatch;
import Arrow.Schema;
import Arrow.SortOptions;
import Arrow.TableConcatenateOptions;
import Arrow.TakeOptions;
import Arrow.Types;
import Arrow.UInt64Array;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class Table : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_table_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  static Table newArrays(Schema schema, Array[] arrays)
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
    _cretval = garrow_table_new_arrays(schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, _arrays, _nArrays, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  static Table newChunkedArrays(Schema schema, ChunkedArray[] chunkedArrays)
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
    _cretval = garrow_table_new_chunked_arrays(schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, _chunkedArrays, _nChunkedArrays, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  static Table newRecordBatches(Schema schema, RecordBatch[] recordBatches)
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
    _cretval = garrow_table_new_record_batches(schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, _recordBatches, _nRecordBatches, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  Table addColumn(uint i, Field field, ChunkedArray chunkedArray)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_add_column(cast(GArrowTable*)cPtr, i, field ? cast(GArrowField*)field.cPtr(No.Dup) : null, chunkedArray ? cast(GArrowChunkedArray*)chunkedArray.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  Table combineChunks()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_combine_chunks(cast(GArrowTable*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  Table concatenate(Table[] otherTables, TableConcatenateOptions options)
  {
    GArrowTable* _cretval;
    auto _otherTables = gListFromD!(Table)(otherTables);
    scope(exit) containerFree!(GList*, Table, GidOwnership.None)(_otherTables);
    GError *_err;
    _cretval = garrow_table_concatenate(cast(GArrowTable*)cPtr, _otherTables, options ? cast(GArrowTableConcatenateOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  bool equal(Table otherTable)
  {
    bool _retval;
    _retval = garrow_table_equal(cast(GArrowTable*)cPtr, otherTable ? cast(GArrowTable*)otherTable.cPtr(No.Dup) : null);
    return _retval;
  }

  bool equalMetadata(Table otherTable, bool checkMetadata)
  {
    bool _retval;
    _retval = garrow_table_equal_metadata(cast(GArrowTable*)cPtr, otherTable ? cast(GArrowTable*)otherTable.cPtr(No.Dup) : null, checkMetadata);
    return _retval;
  }

  Table filter(BooleanArray filter, FilterOptions options)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_filter(cast(GArrowTable*)cPtr, filter ? cast(GArrowBooleanArray*)filter.cPtr(No.Dup) : null, options ? cast(GArrowFilterOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  Table filterChunkedArray(ChunkedArray filter, FilterOptions options)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_filter_chunked_array(cast(GArrowTable*)cPtr, filter ? cast(GArrowChunkedArray*)filter.cPtr(No.Dup) : null, options ? cast(GArrowFilterOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  ChunkedArray getColumnData(int i)
  {
    GArrowChunkedArray* _cretval;
    _cretval = garrow_table_get_column_data(cast(GArrowTable*)cPtr, i);
    auto _retval = ObjectG.getDObject!ChunkedArray(cast(GArrowChunkedArray*)_cretval, Yes.Take);
    return _retval;
  }

  uint getNColumns()
  {
    uint _retval;
    _retval = garrow_table_get_n_columns(cast(GArrowTable*)cPtr);
    return _retval;
  }

  ulong getNRows()
  {
    ulong _retval;
    _retval = garrow_table_get_n_rows(cast(GArrowTable*)cPtr);
    return _retval;
  }

  Schema getSchema()
  {
    GArrowSchema* _cretval;
    _cretval = garrow_table_get_schema(cast(GArrowTable*)cPtr);
    auto _retval = ObjectG.getDObject!Schema(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  Table removeColumn(uint i)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_remove_column(cast(GArrowTable*)cPtr, i, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  Table replaceColumn(uint i, Field field, ChunkedArray chunkedArray)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_replace_column(cast(GArrowTable*)cPtr, i, field ? cast(GArrowField*)field.cPtr(No.Dup) : null, chunkedArray ? cast(GArrowChunkedArray*)chunkedArray.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  Table slice(long offset, long length)
  {
    GArrowTable* _cretval;
    _cretval = garrow_table_slice(cast(GArrowTable*)cPtr, offset, length);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  UInt64Array sortIndices(SortOptions options)
  {
    GArrowUInt64Array* _cretval;
    GError *_err;
    _cretval = garrow_table_sort_indices(cast(GArrowTable*)cPtr, options ? cast(GArrowSortOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!UInt64Array(cast(GArrowUInt64Array*)_cretval, Yes.Take);
    return _retval;
  }

  Table take(Array indices, TakeOptions options)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_take(cast(GArrowTable*)cPtr, indices ? cast(GArrowArray*)indices.cPtr(No.Dup) : null, options ? cast(GArrowTakeOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  Table takeChunkedArray(ChunkedArray indices, TakeOptions options)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_take_chunked_array(cast(GArrowTable*)cPtr, indices ? cast(GArrowChunkedArray*)indices.cPtr(No.Dup) : null, options ? cast(GArrowTakeOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  string toString_()
  {
    char* _cretval;
    GError *_err;
    _cretval = garrow_table_to_string(cast(GArrowTable*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Validate the given table. This is a cheap validation.
   * Returns: %TRUE on success, %FALSE on error.
   */
  bool validate()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_table_validate(cast(GArrowTable*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Writes the table as Feather format data to the sink.
   * Params:
   *   sink = The output.
   *   properties = The properties for this write.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool writeAsFeather(OutputStream sink, FeatherWriteProperties properties)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_table_write_as_feather(cast(GArrowTable*)cPtr, sink ? cast(GArrowOutputStream*)sink.cPtr(No.Dup) : null, properties ? cast(GArrowFeatherWriteProperties*)properties.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
