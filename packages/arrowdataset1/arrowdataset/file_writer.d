module arrowdataset.file_writer;

import arrow.record_batch;
import arrow.record_batch_reader;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.gid;
import glib.error;
import gobject.object;

class FileWriter : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_file_writer_get_type != &gidSymbolNotFound ? gadataset_file_writer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  bool finish()
  {
    bool _retval;
    GError *_err;
    _retval = gadataset_file_writer_finish(cast(GADatasetFileWriter*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool writeRecordBatch(arrow.record_batch.RecordBatch recordBatch)
  {
    bool _retval;
    GError *_err;
    _retval = gadataset_file_writer_write_record_batch(cast(GADatasetFileWriter*)cPtr, recordBatch ? cast(GArrowRecordBatch*)recordBatch.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool writeRecordBatchReader(arrow.record_batch_reader.RecordBatchReader reader)
  {
    bool _retval;
    GError *_err;
    _retval = gadataset_file_writer_write_record_batch_reader(cast(GADatasetFileWriter*)cPtr, reader ? cast(GArrowRecordBatchReader*)reader.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
