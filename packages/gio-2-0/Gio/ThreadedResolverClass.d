module Gio.ThreadedResolverClass;

import Gid.gid;
import Gio.ResolverClass;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

class ThreadedResolverClass
{
  GThreadedResolverClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.ThreadedResolverClass");

    cInstance = *cast(GThreadedResolverClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ResolverClass parentClass()
  {
    return new ResolverClass(cast(GResolverClass*)&(cast(GThreadedResolverClass*)cPtr).parentClass);
  }
}
