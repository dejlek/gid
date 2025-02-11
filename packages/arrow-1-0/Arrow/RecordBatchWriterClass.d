module Arrow.RecordBatchWriterClass;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectClass;
import Gid.gid;

class RecordBatchWriterClass
{
  GArrowRecordBatchWriterClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.RecordBatchWriterClass");

    cInstance = *cast(GArrowRecordBatchWriterClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GArrowRecordBatchWriterClass*)cPtr).parentClass);
  }
}
