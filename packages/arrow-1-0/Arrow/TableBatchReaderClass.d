module Arrow.TableBatchReaderClass;

import Arrow.RecordBatchReaderClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class TableBatchReaderClass
{
  GArrowTableBatchReaderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.TableBatchReaderClass");

    cInstance = *cast(GArrowTableBatchReaderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property RecordBatchReaderClass parentClass()
  {
    return new RecordBatchReaderClass(cast(GArrowRecordBatchReaderClass*)&(cast(GArrowTableBatchReaderClass*)cPtr).parentClass);
  }
}
