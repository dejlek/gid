module arrowflight.stream_chunk;

import arrow.buffer;
import arrow.record_batch;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.global;
import gobject.object;

class StreamChunk : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_stream_chunk_get_type != &gidSymbolNotFound ? gaflight_stream_chunk_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  alias getData = ObjectG.getData;

  RecordBatch getData()
  {
    GArrowRecordBatch* _cretval;
    _cretval = gaflight_stream_chunk_get_data(cast(GAFlightStreamChunk*)cPtr);
    auto _retval = ObjectG.getDObject!RecordBatch(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  Buffer getMetadata()
  {
    GArrowBuffer* _cretval;
    _cretval = gaflight_stream_chunk_get_metadata(cast(GAFlightStreamChunk*)cPtr);
    auto _retval = ObjectG.getDObject!Buffer(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }
}
