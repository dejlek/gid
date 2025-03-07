module arrowflight.stream_writer;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.record_batch_writer;
import arrowflight.types;
import gid.gid;
import glib.error;

/** */
class StreamWriter : arrowflight.record_batch_writer.RecordBatchWriter
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_stream_writer_get_type != &gidSymbolNotFound ? gaflight_stream_writer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  bool doneWriting()
  {
    bool _retval;
    GError *_err;
    _retval = gaflight_stream_writer_done_writing(cast(GAFlightStreamWriter*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
