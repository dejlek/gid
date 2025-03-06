module arrow.record_batch_writer;

import arrow.c.functions;
import arrow.c.types;
import arrow.record_batch;
import arrow.table;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class RecordBatchWriter : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_record_batch_writer_get_type != &gidSymbolNotFound ? garrow_record_batch_writer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  bool close()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_record_batch_writer_close(cast(GArrowRecordBatchWriter*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /** */
  bool isClosed()
  {
    bool _retval;
    _retval = garrow_record_batch_writer_is_closed(cast(GArrowRecordBatchWriter*)cPtr);
    return _retval;
  }

  /** */
  bool writeRecordBatch(arrow.record_batch.RecordBatch recordBatch)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_record_batch_writer_write_record_batch(cast(GArrowRecordBatchWriter*)cPtr, recordBatch ? cast(GArrowRecordBatch*)recordBatch.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /** */
  bool writeTable(arrow.table.Table table)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_record_batch_writer_write_table(cast(GArrowRecordBatchWriter*)cPtr, table ? cast(GArrowTable*)table.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
