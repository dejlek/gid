module Arrow.DictionaryArrayClass;

import Arrow.ArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class DictionaryArrayClass
{
  GArrowDictionaryArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.DictionaryArrayClass");

    cInstance = *cast(GArrowDictionaryArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ArrayClass parentClass()
  {
    return new ArrayClass(cast(GArrowArrayClass*)&(cast(GArrowDictionaryArrayClass*)cPtr).parentClass);
  }
}
