module Gio.UnixCredentialsMessageClass;

import Gid.gid;
import Gio.SocketControlMessageClass;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * Class structure for #GUnixCredentialsMessage.
 */
class UnixCredentialsMessageClass
{
  GUnixCredentialsMessageClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.UnixCredentialsMessageClass");

    cInstance = *cast(GUnixCredentialsMessageClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property SocketControlMessageClass parentClass()
  {
    return new SocketControlMessageClass(cast(GSocketControlMessageClass*)&(cast(GUnixCredentialsMessageClass*)cPtr).parentClass);
  }
}
