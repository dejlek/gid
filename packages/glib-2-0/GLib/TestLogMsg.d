module GLib.TestLogMsg;

import GLib.Types;
import GLib.c.functions;
import GLib.c.types;
import Gid.gid;

class TestLogMsg
{
  GTestLogMsg cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GLib.TestLogMsg");

    cInstance = *cast(GTestLogMsg*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }
}
