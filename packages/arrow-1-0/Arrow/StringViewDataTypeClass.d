module Arrow.StringViewDataTypeClass;

import Arrow.BinaryViewDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class StringViewDataTypeClass
{
  GArrowStringViewDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.StringViewDataTypeClass");

    cInstance = *cast(GArrowStringViewDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property BinaryViewDataTypeClass parentClass()
  {
    return new BinaryViewDataTypeClass(cast(GArrowBinaryViewDataTypeClass*)&(cast(GArrowStringViewDataTypeClass*)cPtr).parentClass);
  }
}
