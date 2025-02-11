module Arrow.RecordBatchStreamReaderClass;

import Arrow.RecordBatchReaderClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class RecordBatchStreamReaderClass
{
  GArrowRecordBatchStreamReaderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.RecordBatchStreamReaderClass");

    cInstance = *cast(GArrowRecordBatchStreamReaderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property RecordBatchReaderClass parentClass()
  {
    return new RecordBatchReaderClass(cast(GArrowRecordBatchReaderClass*)&(cast(GArrowRecordBatchStreamReaderClass*)cPtr).parentClass);
  }
}
