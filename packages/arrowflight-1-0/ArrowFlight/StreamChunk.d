module ArrowFlight.StreamChunk;

import Arrow.Buffer;
import Arrow.RecordBatch;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GObject.ObjectG;
import Gid.gid;

class StreamChunk : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_stream_chunk_get_type();
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
