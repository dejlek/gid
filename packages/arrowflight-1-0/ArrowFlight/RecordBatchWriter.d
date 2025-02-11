module ArrowFlight.RecordBatchWriter;

import Arrow.Buffer;
import Arrow.RecordBatch;
import Arrow.RecordBatchWriter : DArrowRecordBatchWriter = RecordBatchWriter;
import Arrow.Schema;
import Arrow.WriteOptions;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GLib.ErrorG;
import Gid.gid;

class RecordBatchWriter : DArrowRecordBatchWriter
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_record_batch_writer_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Begins writing data with the given schema. Only used with
   * `DoExchange`.
   * Params:
   *   schema = A #GArrowSchema.
   *   options = A #GArrowWriteOptions.
   * Returns: %TRUE on success, %FALSE on error.
   */
  bool begin(Schema schema, WriteOptions options)
  {
    bool _retval;
    GError *_err;
    _retval = gaflight_record_batch_writer_begin(cast(GAFlightRecordBatchWriter*)cPtr, schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, options ? cast(GArrowWriteOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Write metadata.
   * Params:
   *   metadata = A #GArrowBuffer.
   * Returns: %TRUE on success, %FALSE on error.
   */
  bool writeMetadata(Buffer metadata)
  {
    bool _retval;
    GError *_err;
    _retval = gaflight_record_batch_writer_write_metadata(cast(GAFlightRecordBatchWriter*)cPtr, metadata ? cast(GArrowBuffer*)metadata.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  alias writeRecordBatch = DArrowRecordBatchWriter.writeRecordBatch;

  /**
   * Write a record batch with metadata.
   * Params:
   *   recordBatch = A #GArrowRecordBatch.
   *   metadata = A #GArrowBuffer.
   * Returns: %TRUE on success, %FALSE on error.
   */
  bool writeRecordBatch(RecordBatch recordBatch, Buffer metadata)
  {
    bool _retval;
    GError *_err;
    _retval = gaflight_record_batch_writer_write_record_batch(cast(GAFlightRecordBatchWriter*)cPtr, recordBatch ? cast(GArrowRecordBatch*)recordBatch.cPtr(No.Dup) : null, metadata ? cast(GArrowBuffer*)metadata.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
