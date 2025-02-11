module Arrow.TableDatumClass;

import Arrow.DatumClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class TableDatumClass
{
  GArrowTableDatumClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.TableDatumClass");

    cInstance = *cast(GArrowTableDatumClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DatumClass parentClass()
  {
    return new DatumClass(cast(GArrowDatumClass*)&(cast(GArrowTableDatumClass*)cPtr).parentClass);
  }
}
