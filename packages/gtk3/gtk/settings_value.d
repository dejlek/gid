/// Module for [SettingsValue] class
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.SettingsValue");

    cInstance = *cast(GtkSettingsValue*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string origin()
  {
    return cToD!(string)(cast(void*)(cast(GtkSettingsValue*)cPtr).origin);
  }

  @property void origin(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkSettingsValue*)cPtr).origin);
    dToC(propval, cast(void*)&(cast(GtkSettingsValue*)cPtr).origin);
  }

  @property gobject.value.Value value()
  {
    return cToD!(gobject.value.Value)(cast(void*)&(cast(GtkSettingsValue*)cPtr).value);
  }
}
