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

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.ToggleActionEntry");

    cInstance = *cast(GtkToggleActionEntry*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string name()
  {
    return (cast(GtkToggleActionEntry*)cPtr).name.fromCString(No.Free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GtkToggleActionEntry*)cPtr).name);
    (cast(GtkToggleActionEntry*)cPtr).name = propval.toCString(Yes.Alloc);
  }

  @property string stockId()
  {
    return (cast(GtkToggleActionEntry*)cPtr).stockId.fromCString(No.Free);
  }

  @property void stockId(string propval)
  {
    safeFree(cast(void*)(cast(GtkToggleActionEntry*)cPtr).stockId);
    (cast(GtkToggleActionEntry*)cPtr).stockId = propval.toCString(Yes.Alloc);
  }

  @property string label()
  {
    return (cast(GtkToggleActionEntry*)cPtr).label.fromCString(No.Free);
  }

  @property void label(string propval)
  {
    safeFree(cast(void*)(cast(GtkToggleActionEntry*)cPtr).label);
    (cast(GtkToggleActionEntry*)cPtr).label = propval.toCString(Yes.Alloc);
  }

  @property string accelerator()
  {
    return (cast(GtkToggleActionEntry*)cPtr).accelerator.fromCString(No.Free);
  }

  @property void accelerator(string propval)
  {
    safeFree(cast(void*)(cast(GtkToggleActionEntry*)cPtr).accelerator);
    (cast(GtkToggleActionEntry*)cPtr).accelerator = propval.toCString(Yes.Alloc);
  }

  @property string tooltip()
  {
    return (cast(GtkToggleActionEntry*)cPtr).tooltip.fromCString(No.Free);
  }

  @property void tooltip(string propval)
  {
    safeFree(cast(void*)(cast(GtkToggleActionEntry*)cPtr).tooltip);
    (cast(GtkToggleActionEntry*)cPtr).tooltip = propval.toCString(Yes.Alloc);
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
