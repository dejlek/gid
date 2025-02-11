module Arrow.RecordBatchDatumClass;

import Arrow.DatumClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class RecordBatchDatumClass
{
  GArrowRecordBatchDatumClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.RecordBatchDatumClass");

    cInstance = *cast(GArrowRecordBatchDatumClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DatumClass parentClass()
  {
    return new DatumClass(cast(GArrowDatumClass*)&(cast(GArrowRecordBatchDatumClass*)cPtr).parentClass);
  }
}
