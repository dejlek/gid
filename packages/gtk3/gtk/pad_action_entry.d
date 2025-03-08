module gtk.pad_action_entry;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    Struct defining a pad action entry.
*/
class PadActionEntry
{
  GtkPadActionEntry cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.PadActionEntry");

    cInstance = *cast(GtkPadActionEntry*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gtk.types.PadActionType type()
  {
    return cast(gtk.types.PadActionType)(cast(GtkPadActionEntry*)cPtr).type;
  }

  @property void type(gtk.types.PadActionType propval)
  {
    (cast(GtkPadActionEntry*)cPtr).type = cast(GtkPadActionType)propval;
  }

  @property int index()
  {
    return (cast(GtkPadActionEntry*)cPtr).index;
  }

  @property void index(int propval)
  {
    (cast(GtkPadActionEntry*)cPtr).index = propval;
  }

  @property int mode()
  {
    return (cast(GtkPadActionEntry*)cPtr).mode;
  }

  @property void mode(int propval)
  {
    (cast(GtkPadActionEntry*)cPtr).mode = propval;
  }

  @property string label()
  {
    return (cast(GtkPadActionEntry*)cPtr).label.fromCString(No.free);
  }

  @property void label(string propval)
  {
    safeFree(cast(void*)(cast(GtkPadActionEntry*)cPtr).label);
    (cast(GtkPadActionEntry*)cPtr).label = propval.toCString(Yes.alloc);
  }

  @property string actionName()
  {
    return (cast(GtkPadActionEntry*)cPtr).actionName.fromCString(No.free);
  }

  @property void actionName(string propval)
  {
    safeFree(cast(void*)(cast(GtkPadActionEntry*)cPtr).actionName);
    (cast(GtkPadActionEntry*)cPtr).actionName = propval.toCString(Yes.alloc);
  }
}
