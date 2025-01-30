module Gio.InetSocketAddressClass;

import Gid.gid;
import Gio.SocketAddressClass;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

class InetSocketAddressClass
{
  GInetSocketAddressClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.InetSocketAddressClass");

    cInstance = *cast(GInetSocketAddressClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property SocketAddressClass parentClass()
  {
    return new SocketAddressClass(cast(GSocketAddressClass*)&(cast(GInetSocketAddressClass*)cPtr).parentClass);
  }
}
