/// Module for [ToggleActionEntry] class
module gtk.toggle_action_entry;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    #GtkToggleActionEntry structs are used with
    [gtk.action_group.ActionGroup.addToggleActions] to construct toggle actions.
*/
class ToggleActionEntry
{
  GtkToggleActionEntry cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.ToggleActionEntry");

    cInstance = *cast(GtkToggleActionEntry*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).name);
  }

  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).name);
    dToC(propval, cast(void*)&(cast(GtkToggleActionEntry*)cPtr).name);
  }

  @property string stockId()
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).stockId);
  }

  @property void stockId(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).stockId);
    dToC(propval, cast(void*)&(cast(GtkToggleActionEntry*)cPtr).stockId);
  }

  @property string label()
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).label);
  }

  @property void label(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).label);
    dToC(propval, cast(void*)&(cast(GtkToggleActionEntry*)cPtr).label);
  }

  @property string accelerator()
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).accelerator);
  }

  @property void accelerator(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).accelerator);
    dToC(propval, cast(void*)&(cast(GtkToggleActionEntry*)cPtr).accelerator);
  }

  @property string tooltip()
  {
    return cToD!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).tooltip);
  }

  @property void tooltip(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkToggleActionEntry*)cPtr).tooltip);
    dToC(propval, cast(void*)&(cast(GtkToggleActionEntry*)cPtr).tooltip);
  }

  @property GCallback callback()
  {
    return (cast(GtkToggleActionEntry*)cPtr).callback;
  }

  @property void callback(GCallback propval)
  {
    (cast(GtkToggleActionEntry*)cPtr).callback = propval;
  }

  @property bool isActive()
  {
    return (cast(GtkToggleActionEntry*)cPtr).isActive;
  }

  @property void isActive(bool propval)
  {
    (cast(GtkToggleActionEntry*)cPtr).isActive = propval;
  }
}
