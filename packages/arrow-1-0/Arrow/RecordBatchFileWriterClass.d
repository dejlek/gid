module Arrow.RecordBatchFileWriterClass;

import Arrow.RecordBatchStreamWriterClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class RecordBatchFileWriterClass
{
  GArrowRecordBatchFileWriterClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.RecordBatchFileWriterClass");

    cInstance = *cast(GArrowRecordBatchFileWriterClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property RecordBatchStreamWriterClass parentClass()
  {
    return new RecordBatchStreamWriterClass(cast(GArrowRecordBatchStreamWriterClass*)&(cast(GArrowRecordBatchFileWriterClass*)cPtr).parentClass);
  }
}
