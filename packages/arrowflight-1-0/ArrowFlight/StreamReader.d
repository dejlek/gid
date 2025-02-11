module ArrowFlight.StreamReader;

import ArrowFlight.RecordBatchReader;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import Gid.gid;

class StreamReader : RecordBatchReader
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_stream_reader_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }
}
