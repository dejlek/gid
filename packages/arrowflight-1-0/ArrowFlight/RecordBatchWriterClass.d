module ArrowFlight.RecordBatchWriterClass;

import Arrow.RecordBatchWriterClass : DArrowRecordBatchWriterClass = RecordBatchWriterClass;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import Gid.gid;

class RecordBatchWriterClass
{
  GAFlightRecordBatchWriterClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowFlight.RecordBatchWriterClass");

    cInstance = *cast(GAFlightRecordBatchWriterClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DArrowRecordBatchWriterClass parentClass()
  {
    return new DArrowRecordBatchWriterClass(cast(GArrowRecordBatchWriterClass*)&(cast(GAFlightRecordBatchWriterClass*)cPtr).parentClass);
  }
}
