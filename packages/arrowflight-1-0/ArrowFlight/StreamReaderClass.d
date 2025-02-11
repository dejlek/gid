module ArrowFlight.StreamReaderClass;

import ArrowFlight.RecordBatchReaderClass;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import Gid.gid;

class StreamReaderClass
{
  GAFlightStreamReaderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowFlight.StreamReaderClass");

    cInstance = *cast(GAFlightStreamReaderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property RecordBatchReaderClass parentClass()
  {
    return new RecordBatchReaderClass(cast(GAFlightRecordBatchReaderClass*)&(cast(GAFlightStreamReaderClass*)cPtr).parentClass);
  }
}
