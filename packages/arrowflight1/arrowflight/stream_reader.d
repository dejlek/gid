/// Module for [StreamReader] class
module arrowflight.stream_reader;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.record_batch_reader;
import arrowflight.types;
import gid.gid;

/** */
class StreamReader : arrowflight.record_batch_reader.RecordBatchReader
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_stream_reader_get_type != &gidSymbolNotFound ? gaflight_stream_reader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamReader self()
  {
    return this;
  }
}
