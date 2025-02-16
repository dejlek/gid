module Arrow.RecordBatch;

import Arrow.Array;
import Arrow.BooleanArray;
import Arrow.Buffer;
import Arrow.Field;
import Arrow.FilterOptions;
import Arrow.Schema;
import Arrow.SortOptions;
import Arrow.TakeOptions;
import Arrow.Types;
import Arrow.UInt64Array;
import Arrow.WriteOptions;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class RecordBatch : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_record_batch_get_type != &gidSymbolNotFound ? garrow_record_batch_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Schema schema, uint nRows, Array[] columns)
  {
    GArrowRecordBatch* _cretval;
    auto _columns = gListFromD!(Array)(columns);
    scope(exit) containerFree!(GList*, Array, GidOwnership.None)(_columns);
    GError *_err;
    _cretval = garrow_record_batch_new(schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, nRows, _columns, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  static RecordBatch import_(void* cAbiArray, Schema schema)
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_import(cAbiArray, schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!RecordBatch(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  RecordBatch addColumn(uint i, Field field, Array column)
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_add_column(cast(GArrowRecordBatch*)cPtr, i, field ? cast(GArrowField*)field.cPtr(No.Dup) : null, column ? cast(GArrowArray*)column.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!RecordBatch(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  bool equal(RecordBatch otherRecordBatch)
  {
    bool _retval;
    _retval = garrow_record_batch_equal(cast(GArrowRecordBatch*)cPtr, otherRecordBatch ? cast(GArrowRecordBatch*)otherRecordBatch.cPtr(No.Dup) : null);
    return _retval;
  }

  bool equalMetadata(RecordBatch otherRecordBatch, bool checkMetadata)
  {
    bool _retval;
    _retval = garrow_record_batch_equal_metadata(cast(GArrowRecordBatch*)cPtr, otherRecordBatch ? cast(GArrowRecordBatch*)otherRecordBatch.cPtr(No.Dup) : null, checkMetadata);
    return _retval;
  }

  bool export_(out void* cAbiArray, out void* cAbiSchema)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_record_batch_export(cast(GArrowRecordBatch*)cPtr, cast(void**)&cAbiArray, cast(void**)&cAbiSchema, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  RecordBatch filter(BooleanArray filter, FilterOptions options)
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_filter(cast(GArrowRecordBatch*)cPtr, filter ? cast(GArrowBooleanArray*)filter.cPtr(No.Dup) : null, options ? cast(GArrowFilterOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!RecordBatch(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  Array getColumnData(int i)
  {
    GArrowArray* _cretval;
    _cretval = garrow_record_batch_get_column_data(cast(GArrowRecordBatch*)cPtr, i);
    auto _retval = ObjectG.getDObject!Array(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  string getColumnName(int i)
  {
    const(char)* _cretval;
    _cretval = garrow_record_batch_get_column_name(cast(GArrowRecordBatch*)cPtr, i);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  uint getNColumns()
  {
    uint _retval;
    _retval = garrow_record_batch_get_n_columns(cast(GArrowRecordBatch*)cPtr);
    return _retval;
  }

  long getNRows()
  {
    long _retval;
    _retval = garrow_record_batch_get_n_rows(cast(GArrowRecordBatch*)cPtr);
    return _retval;
  }

  Schema getSchema()
  {
    GArrowSchema* _cretval;
    _cretval = garrow_record_batch_get_schema(cast(GArrowRecordBatch*)cPtr);
    auto _retval = ObjectG.getDObject!Schema(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  RecordBatch removeColumn(uint i)
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_remove_column(cast(GArrowRecordBatch*)cPtr, i, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!RecordBatch(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  Buffer serialize(WriteOptions options)
  {
    GArrowBuffer* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_serialize(cast(GArrowRecordBatch*)cPtr, options ? cast(GArrowWriteOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Buffer(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  RecordBatch slice(long offset, long length)
  {
    GArrowRecordBatch* _cretval;
    _cretval = garrow_record_batch_slice(cast(GArrowRecordBatch*)cPtr, offset, length);
    auto _retval = ObjectG.getDObject!RecordBatch(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  UInt64Array sortIndices(SortOptions options)
  {
    GArrowUInt64Array* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_sort_indices(cast(GArrowRecordBatch*)cPtr, options ? cast(GArrowSortOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!UInt64Array(cast(GArrowUInt64Array*)_cretval, Yes.Take);
    return _retval;
  }

  RecordBatch take(Array indices, TakeOptions options)
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_take(cast(GArrowRecordBatch*)cPtr, indices ? cast(GArrowArray*)indices.cPtr(No.Dup) : null, options ? cast(GArrowTakeOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!RecordBatch(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  string toString_()
  {
    char* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_to_string(cast(GArrowRecordBatch*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }
}
