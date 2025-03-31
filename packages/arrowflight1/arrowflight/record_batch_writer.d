/// Module for [RecordBatchWriter] class
module arrowflight.record_batch_writer;

import arrow.buffer;
import arrow.record_batch;
import arrow.record_batch_writer;
import arrow.schema;
import arrow.write_options;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import glib.error;

/** */
class RecordBatchWriter : arrow.record_batch_writer.RecordBatchWriter
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_record_batch_writer_get_type != &gidSymbolNotFound ? gaflight_record_batch_writer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override RecordBatchWriter self()
  {
    return this;
  }

  /**
      Begins writing data with the given schema. Only used with
      `DoExchange`.
  
      Params:
        schema = A #GArrowSchema.
        options = A #GArrowWriteOptions.
      Returns: true on success, false on error.
      Throws: [ErrorG]
  */
  bool begin(arrow.schema.Schema schema, arrow.write_options.WriteOptions options = null)
  {
    bool _retval;
    GError *_err;
    _retval = gaflight_record_batch_writer_begin(cast(GAFlightRecordBatchWriter*)cPtr, schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, options ? cast(GArrowWriteOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Write metadata.
  
      Params:
        metadata = A #GArrowBuffer.
      Returns: true on success, false on error.
      Throws: [ErrorG]
  */
  bool writeMetadata(arrow.buffer.Buffer metadata)
  {
    bool _retval;
    GError *_err;
    _retval = gaflight_record_batch_writer_write_metadata(cast(GAFlightRecordBatchWriter*)cPtr, metadata ? cast(GArrowBuffer*)metadata.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  alias writeRecordBatch = arrow.record_batch_writer.RecordBatchWriter.writeRecordBatch;

  /**
      Write a record batch with metadata.
  
      Params:
        recordBatch = A #GArrowRecordBatch.
        metadata = A #GArrowBuffer.
      Returns: true on success, false on error.
      Throws: [ErrorG]
  */
  bool writeRecordBatch(arrow.record_batch.RecordBatch recordBatch, arrow.buffer.Buffer metadata = null)
  {
    bool _retval;
    GError *_err;
    _retval = gaflight_record_batch_writer_write_record_batch(cast(GAFlightRecordBatchWriter*)cPtr, recordBatch ? cast(GArrowRecordBatch*)recordBatch.cPtr(No.Dup) : null, metadata ? cast(GArrowBuffer*)metadata.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
