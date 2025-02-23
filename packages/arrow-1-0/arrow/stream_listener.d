module arrow.stream_listener;

import arrow.c.functions;
import arrow.c.types;
import arrow.record_batch;
import arrow.schema;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

class StreamListener : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_stream_listener_get_type != &gidSymbolNotFound ? garrow_stream_listener_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Processes an EOS event.
   * Returns: %TRUE on success, %FALSE on error.
   */
  bool onEos()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_stream_listener_on_eos(cast(GArrowStreamListener*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Processes a decoded record batch.
   * Params:
   *   recordBatch = A decoded #GArrowRecordBatch.
   *   metadata = A decoded metadata.
   * Returns: %TRUE on success, %FALSE on error.
   */
  bool onRecordBatchDecoded(RecordBatch recordBatch, string[string] metadata)
  {
    bool _retval;
    auto _metadata = gHashTableFromD!(string, string)(metadata);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_metadata);
    GError *_err;
    _retval = garrow_stream_listener_on_record_batch_decoded(cast(GArrowStreamListener*)cPtr, recordBatch ? cast(GArrowRecordBatch*)recordBatch.cPtr(No.Dup) : null, _metadata, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Processes a decoded schema.
   * Params:
   *   schema = A decoded #GArrowSchema.
   *   filteredSchema = A decoded #GArrowSchema that only has read fields.
   * Returns: %TRUE on success, %FALSE on error.
   */
  bool onSchemaDecoded(Schema schema, Schema filteredSchema)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_stream_listener_on_schema_decoded(cast(GArrowStreamListener*)cPtr, schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, filteredSchema ? cast(GArrowSchema*)filteredSchema.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
