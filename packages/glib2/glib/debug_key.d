module glib.debug_key;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    Associates a string with a bit flag.
  Used in [glib.global.parseDebugString].
*/
class DebugKey
{
  GDebugKey cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GLib.DebugKey");

    cInstance = *cast(GDebugKey*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string key()
  {
    return (cast(GDebugKey*)cPtr).key.fromCString(No.free);
  }

  @property void key(string propval)
  {
    safeFree(cast(void*)(cast(GDebugKey*)cPtr).key);
    (cast(GDebugKey*)cPtr).key = propval.toCString(Yes.alloc);
  }

  @property uint value()
  {
    return (cast(GDebugKey*)cPtr).value;
  }

  @property void value(uint propval)
  {
    (cast(GDebugKey*)cPtr).value = propval;
  }
}
