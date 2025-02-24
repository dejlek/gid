module arrow.record_batch_reader;

import arrow.c.functions;
import arrow.c.types;
import arrow.record_batch;
import arrow.schema;
import arrow.table;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

class RecordBatchReader : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_record_batch_reader_get_type != &gidSymbolNotFound ? garrow_record_batch_reader_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(RecordBatch[] recordBatches, Schema schema)
  {
    GArrowRecordBatchReader* _cretval;
    auto _recordBatches = gListFromD!(RecordBatch)(recordBatches);
    scope(exit) containerFree!(GList*, RecordBatch, GidOwnership.None)(_recordBatches);
    GError *_err;
    _cretval = garrow_record_batch_reader_new(_recordBatches, schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  static RecordBatchReader import_(void* cAbiArrayStream)
  {
    GArrowRecordBatchReader* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_reader_import(cAbiArrayStream, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!RecordBatchReader(cast(GArrowRecordBatchReader*)_cretval, Yes.Take);
    return _retval;
  }

  void* export_()
  {
    GError *_err;
    auto _retval = garrow_record_batch_reader_export(cast(GArrowRecordBatchReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  RecordBatch getNextRecordBatch()
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_reader_get_next_record_batch(cast(GArrowRecordBatchReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!RecordBatch(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  Schema getSchema()
  {
    GArrowSchema* _cretval;
    _cretval = garrow_record_batch_reader_get_schema(cast(GArrowRecordBatchReader*)cPtr);
    auto _retval = ObjectG.getDObject!Schema(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  ObjectG[] getSources()
  {
    GList* _cretval;
    _cretval = garrow_record_batch_reader_get_sources(cast(GArrowRecordBatchReader*)cPtr);
    auto _retval = gListToD!(ObjectG, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  Table readAll()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_reader_read_all(cast(GArrowRecordBatchReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  RecordBatch readNext()
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_reader_read_next(cast(GArrowRecordBatchReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!RecordBatch(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  RecordBatch readNextRecordBatch()
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_reader_read_next_record_batch(cast(GArrowRecordBatchReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!RecordBatch(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }
}
