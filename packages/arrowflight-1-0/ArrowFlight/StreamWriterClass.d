module ArrowFlight.StreamWriterClass;

import ArrowFlight.RecordBatchWriterClass;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import Gid.gid;

class StreamWriterClass
{
  GAFlightStreamWriterClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowFlight.StreamWriterClass");

    cInstance = *cast(GAFlightStreamWriterClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property RecordBatchWriterClass parentClass()
  {
    return new RecordBatchWriterClass(cast(GAFlightRecordBatchWriterClass*)&(cast(GAFlightStreamWriterClass*)cPtr).parentClass);
  }
}
