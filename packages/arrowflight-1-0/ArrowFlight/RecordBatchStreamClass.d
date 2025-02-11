module ArrowFlight.RecordBatchStreamClass;

import ArrowFlight.DataStreamClass;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import Gid.gid;

class RecordBatchStreamClass
{
  GAFlightRecordBatchStreamClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowFlight.RecordBatchStreamClass");

    cInstance = *cast(GAFlightRecordBatchStreamClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DataStreamClass parentClass()
  {
    return new DataStreamClass(cast(GAFlightDataStreamClass*)&(cast(GAFlightRecordBatchStreamClass*)cPtr).parentClass);
  }
}
