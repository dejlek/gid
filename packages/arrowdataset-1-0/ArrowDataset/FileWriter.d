module ArrowDataset.FileWriter;

import Arrow.RecordBatch;
import Arrow.RecordBatchReader;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class FileWriter : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
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

  bool writeRecordBatch(RecordBatch recordBatch)
  {
    bool _retval;
    GError *_err;
    _retval = gadataset_file_writer_write_record_batch(cast(GADatasetFileWriter*)cPtr, recordBatch ? cast(GArrowRecordBatch*)recordBatch.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool writeRecordBatchReader(RecordBatchReader reader)
  {
    bool _retval;
    GError *_err;
    _retval = gadataset_file_writer_write_record_batch_reader(cast(GADatasetFileWriter*)cPtr, reader ? cast(GArrowRecordBatchReader*)reader.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
