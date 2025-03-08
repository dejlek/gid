module gtk.radio_action_entry;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    #GtkRadioActionEntry structs are used with
  [gtk.action_group.ActionGroup.addRadioActions] to construct groups of radio actions.
*/
class RadioActionEntry
{
  GtkRadioActionEntry cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.RadioActionEntry");

    cInstance = *cast(GtkRadioActionEntry*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string name()
  {
    return (cast(GtkRadioActionEntry*)cPtr).name.fromCString(No.free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GtkRadioActionEntry*)cPtr).name);
    (cast(GtkRadioActionEntry*)cPtr).name = propval.toCString(Yes.alloc);
  }

  @property string stockId()
  {
    return (cast(GtkRadioActionEntry*)cPtr).stockId.fromCString(No.free);
  }

  @property void stockId(string propval)
  {
    safeFree(cast(void*)(cast(GtkRadioActionEntry*)cPtr).stockId);
    (cast(GtkRadioActionEntry*)cPtr).stockId = propval.toCString(Yes.alloc);
  }

  @property string label()
  {
    return (cast(GtkRadioActionEntry*)cPtr).label.fromCString(No.free);
  }

  @property void label(string propval)
  {
    safeFree(cast(void*)(cast(GtkRadioActionEntry*)cPtr).label);
    (cast(GtkRadioActionEntry*)cPtr).label = propval.toCString(Yes.alloc);
  }

  @property string accelerator()
  {
    return (cast(GtkRadioActionEntry*)cPtr).accelerator.fromCString(No.free);
  }

  @property void accelerator(string propval)
  {
    safeFree(cast(void*)(cast(GtkRadioActionEntry*)cPtr).accelerator);
    (cast(GtkRadioActionEntry*)cPtr).accelerator = propval.toCString(Yes.alloc);
  }

  @property string tooltip()
  {
    return (cast(GtkRadioActionEntry*)cPtr).tooltip.fromCString(No.free);
  }

  @property void tooltip(string propval)
  {
    safeFree(cast(void*)(cast(GtkRadioActionEntry*)cPtr).tooltip);
    (cast(GtkRadioActionEntry*)cPtr).tooltip = propval.toCString(Yes.alloc);
  }

  @property int value()
  {
    return (cast(GtkRadioActionEntry*)cPtr).value;
  }

  @property void value(int propval)
  {
    (cast(GtkRadioActionEntry*)cPtr).value = propval;
  }
}
