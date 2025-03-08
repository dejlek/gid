module gtk.settings_value;

import gid.gid;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class SettingsValue
{
  GtkSettingsValue cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.SettingsValue");

    cInstance = *cast(GtkSettingsValue*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string origin()
  {
    return (cast(GtkSettingsValue*)cPtr).origin.fromCString(No.Free);
  }

  @property void origin(string propval)
  {
    safeFree(cast(void*)(cast(GtkSettingsValue*)cPtr).origin);
    (cast(GtkSettingsValue*)cPtr).origin = propval.toCString(Yes.Alloc);
  }

  @property gobject.value.Value value()
  {
    return new gobject.value.Value(cast(GValue*)&(cast(GtkSettingsValue*)cPtr).value);
  }
}
