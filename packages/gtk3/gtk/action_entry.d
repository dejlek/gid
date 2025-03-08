module gtk.action_entry;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    #GtkActionEntry structs are used with [gtk.action_group.ActionGroup.addActions] to
  construct actions.
*/
class ActionEntry
{
  GtkActionEntry cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.ActionEntry");

    cInstance = *cast(GtkActionEntry*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string name()
  {
    return (cast(GtkActionEntry*)cPtr).name.fromCString(No.Free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GtkActionEntry*)cPtr).name);
    (cast(GtkActionEntry*)cPtr).name = propval.toCString(Yes.Alloc);
  }

  @property string stockId()
  {
    return (cast(GtkActionEntry*)cPtr).stockId.fromCString(No.Free);
  }

  @property void stockId(string propval)
  {
    safeFree(cast(void*)(cast(GtkActionEntry*)cPtr).stockId);
    (cast(GtkActionEntry*)cPtr).stockId = propval.toCString(Yes.Alloc);
  }

  @property string label()
  {
    return (cast(GtkActionEntry*)cPtr).label.fromCString(No.Free);
  }

  @property void label(string propval)
  {
    safeFree(cast(void*)(cast(GtkActionEntry*)cPtr).label);
    (cast(GtkActionEntry*)cPtr).label = propval.toCString(Yes.Alloc);
  }

  @property string accelerator()
  {
    return (cast(GtkActionEntry*)cPtr).accelerator.fromCString(No.Free);
  }

  @property void accelerator(string propval)
  {
    safeFree(cast(void*)(cast(GtkActionEntry*)cPtr).accelerator);
    (cast(GtkActionEntry*)cPtr).accelerator = propval.toCString(Yes.Alloc);
  }

  @property string tooltip()
  {
    return (cast(GtkActionEntry*)cPtr).tooltip.fromCString(No.Free);
  }

  @property void tooltip(string propval)
  {
    safeFree(cast(void*)(cast(GtkActionEntry*)cPtr).tooltip);
    (cast(GtkActionEntry*)cPtr).tooltip = propval.toCString(Yes.Alloc);
  }

  @property GCallback callback()
  {
    return (cast(GtkActionEntry*)cPtr).callback;
  }

  @property void callback(GCallback propval)
  {
    (cast(GtkActionEntry*)cPtr).callback = propval;
  }
}
