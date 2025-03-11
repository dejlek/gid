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
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GtkActionEntry*)cPtr).name);
  }

  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkActionEntry*)cPtr).name);
    dToC(propval, cast(void*)&(cast(GtkActionEntry*)cPtr).name);
  }

  @property string stockId()
  {
    return cToD!(string)(cast(void*)(cast(GtkActionEntry*)cPtr).stockId);
  }

  @property void stockId(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkActionEntry*)cPtr).stockId);
    dToC(propval, cast(void*)&(cast(GtkActionEntry*)cPtr).stockId);
  }

  @property string label()
  {
    return cToD!(string)(cast(void*)(cast(GtkActionEntry*)cPtr).label);
  }

  @property void label(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkActionEntry*)cPtr).label);
    dToC(propval, cast(void*)&(cast(GtkActionEntry*)cPtr).label);
  }

  @property string accelerator()
  {
    return cToD!(string)(cast(void*)(cast(GtkActionEntry*)cPtr).accelerator);
  }

  @property void accelerator(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkActionEntry*)cPtr).accelerator);
    dToC(propval, cast(void*)&(cast(GtkActionEntry*)cPtr).accelerator);
  }

  @property string tooltip()
  {
    return cToD!(string)(cast(void*)(cast(GtkActionEntry*)cPtr).tooltip);
  }

  @property void tooltip(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkActionEntry*)cPtr).tooltip);
    dToC(propval, cast(void*)&(cast(GtkActionEntry*)cPtr).tooltip);
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
