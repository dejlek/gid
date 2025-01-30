module GLib.DebugKey;

import GLib.Types;
import GLib.c.functions;
import GLib.c.types;
import Gid.gid;

/**
 * Associates a string with a bit flag.
 * Used in [GLib.Global.parseDebugString].
 */
class DebugKey
{
  GDebugKey cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
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
    return (cast(GDebugKey*)cPtr).key.fromCString(No.Free);
  }

  @property void key(string propval)
  {
    safeFree(cast(void*)(cast(GDebugKey*)cPtr).key);
    (cast(GDebugKey*)cPtr).key = propval.toCString(Yes.Alloc);
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
