module arrowflight.stream_chunk;

import arrow.buffer;
import arrow.record_batch;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import gobject.object;

/** */
class StreamChunk : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_stream_chunk_get_type != &gidSymbolNotFound ? gaflight_stream_chunk_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override StreamChunk self()
  {
    return this;
  }

  alias getData = gobject.object.ObjectG.getData;

  /** */
  arrow.record_batch.RecordBatch getData()
  {
    GArrowRecordBatch* _cretval;
    _cretval = gaflight_stream_chunk_get_data(cast(GAFlightStreamChunk*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer getMetadata()
  {
    GArrowBuffer* _cretval;
    _cretval = gaflight_stream_chunk_get_metadata(cast(GAFlightStreamChunk*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }
}
