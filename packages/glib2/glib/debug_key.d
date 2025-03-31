/// Module for [DebugKey] class
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GLib.DebugKey");

    cInstance = *cast(GDebugKey*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string key()
  {
    return cToD!(string)(cast(void*)(cast(GDebugKey*)cPtr).key);
  }

  @property void key(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDebugKey*)cPtr).key);
    dToC(propval, cast(void*)&(cast(GDebugKey*)cPtr).key);
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
