module arrow.record_batch_file_reader;

import arrow.c.functions;
import arrow.c.types;
import arrow.record_batch;
import arrow.schema;
import arrow.seekable_input_stream;
import arrow.types;
import gid.global;
import glib.error;
import gobject.object;

class RecordBatchFileReader : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_record_batch_file_reader_get_type != &gidSymbolNotFound ? garrow_record_batch_file_reader_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(SeekableInputStream file)
  {
    GArrowRecordBatchFileReader* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_file_reader_new(file ? cast(GArrowSeekableInputStream*)file.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  uint getNRecordBatches()
  {
    uint _retval;
    _retval = garrow_record_batch_file_reader_get_n_record_batches(cast(GArrowRecordBatchFileReader*)cPtr);
    return _retval;
  }

  RecordBatch getRecordBatch(uint i)
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_file_reader_get_record_batch(cast(GArrowRecordBatchFileReader*)cPtr, i, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!RecordBatch(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  Schema getSchema()
  {
    GArrowSchema* _cretval;
    _cretval = garrow_record_batch_file_reader_get_schema(cast(GArrowRecordBatchFileReader*)cPtr);
    auto _retval = ObjectG.getDObject!Schema(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  MetadataVersion getVersion()
  {
    GArrowMetadataVersion _cretval;
    _cretval = garrow_record_batch_file_reader_get_version(cast(GArrowRecordBatchFileReader*)cPtr);
    MetadataVersion _retval = cast(MetadataVersion)_cretval;
    return _retval;
  }

  RecordBatch readRecordBatch(uint i)
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_file_reader_read_record_batch(cast(GArrowRecordBatchFileReader*)cPtr, i, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!RecordBatch(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }
}
