module Arrow.RecordBatchStreamWriterClass;

import Arrow.RecordBatchWriterClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class RecordBatchStreamWriterClass
{
  GArrowRecordBatchStreamWriterClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.RecordBatchStreamWriterClass");

    cInstance = *cast(GArrowRecordBatchStreamWriterClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property RecordBatchWriterClass parentClass()
  {
    return new RecordBatchWriterClass(cast(GArrowRecordBatchWriterClass*)&(cast(GArrowRecordBatchStreamWriterClass*)cPtr).parentClass);
  }
}
