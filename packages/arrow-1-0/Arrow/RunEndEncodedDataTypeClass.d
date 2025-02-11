module Arrow.RunEndEncodedDataTypeClass;

import Arrow.FixedWidthDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class RunEndEncodedDataTypeClass
{
  GArrowRunEndEncodedDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.RunEndEncodedDataTypeClass");

    cInstance = *cast(GArrowRunEndEncodedDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FixedWidthDataTypeClass parentClass()
  {
    return new FixedWidthDataTypeClass(cast(GArrowFixedWidthDataTypeClass*)&(cast(GArrowRunEndEncodedDataTypeClass*)cPtr).parentClass);
  }
}
