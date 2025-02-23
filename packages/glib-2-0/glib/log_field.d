module glib.log_field;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
 * Structure representing a single field in a structured log entry. See
 * [GLib.Global.logStructured] for details.
 * Log fields may contain arbitrary values, including binary with embedded nul
 * bytes. If the field contains a string, the string must be UTF-8 encoded and
 * have a trailing nul byte. Otherwise, @length must be set to a non-negative
 * value.
 */
class LogField
{
  GLogField cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GLib.LogField");

    cInstance = *cast(GLogField*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string key()
  {
    return (cast(GLogField*)cPtr).key.fromCString(No.Free);
  }

  @property void key(string propval)
  {
    safeFree(cast(void*)(cast(GLogField*)cPtr).key);
    (cast(GLogField*)cPtr).key = propval.toCString(Yes.Alloc);
  }

  @property ptrdiff_t length()
  {
    return (cast(GLogField*)cPtr).length;
  }

  @property void length(ptrdiff_t propval)
  {
    (cast(GLogField*)cPtr).length = propval;
  }
}
