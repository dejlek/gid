module Gio.ProxyAddressEnumeratorClass;

import Gid.gid;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * Class structure for #GProxyAddressEnumerator.
 */
class ProxyAddressEnumeratorClass
{
  GProxyAddressEnumeratorClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.ProxyAddressEnumeratorClass");

    cInstance = *cast(GProxyAddressEnumeratorClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }
}
