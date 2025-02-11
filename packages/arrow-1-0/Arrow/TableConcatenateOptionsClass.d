module Arrow.TableConcatenateOptionsClass;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectClass;
import Gid.gid;

class TableConcatenateOptionsClass
{
  GArrowTableConcatenateOptionsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.TableConcatenateOptionsClass");

    cInstance = *cast(GArrowTableConcatenateOptionsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GArrowTableConcatenateOptionsClass*)cPtr).parentClass);
  }
}
