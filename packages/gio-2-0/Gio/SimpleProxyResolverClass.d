module Gio.SimpleProxyResolverClass;

import GObject.ObjectClass;
import Gid.gid;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

class SimpleProxyResolverClass
{
  GSimpleProxyResolverClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.SimpleProxyResolverClass");

    cInstance = *cast(GSimpleProxyResolverClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GSimpleProxyResolverClass*)cPtr).parentClass);
  }
}
