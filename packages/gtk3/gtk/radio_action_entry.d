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

  this(void* ptr, Flag!"Take" take = No.Take)
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
    return (cast(GtkRadioActionEntry*)cPtr).name.fromCString(No.Free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GtkRadioActionEntry*)cPtr).name);
    (cast(GtkRadioActionEntry*)cPtr).name = propval.toCString(Yes.Alloc);
  }

  @property string stockId()
  {
    return (cast(GtkRadioActionEntry*)cPtr).stockId.fromCString(No.Free);
  }

  @property void stockId(string propval)
  {
    safeFree(cast(void*)(cast(GtkRadioActionEntry*)cPtr).stockId);
    (cast(GtkRadioActionEntry*)cPtr).stockId = propval.toCString(Yes.Alloc);
  }

  @property string label()
  {
    return (cast(GtkRadioActionEntry*)cPtr).label.fromCString(No.Free);
  }

  @property void label(string propval)
  {
    safeFree(cast(void*)(cast(GtkRadioActionEntry*)cPtr).label);
    (cast(GtkRadioActionEntry*)cPtr).label = propval.toCString(Yes.Alloc);
  }

  @property string accelerator()
  {
    return (cast(GtkRadioActionEntry*)cPtr).accelerator.fromCString(No.Free);
  }

  @property void accelerator(string propval)
  {
    safeFree(cast(void*)(cast(GtkRadioActionEntry*)cPtr).accelerator);
    (cast(GtkRadioActionEntry*)cPtr).accelerator = propval.toCString(Yes.Alloc);
  }

  @property string tooltip()
  {
    return (cast(GtkRadioActionEntry*)cPtr).tooltip.fromCString(No.Free);
  }

  @property void tooltip(string propval)
  {
    safeFree(cast(void*)(cast(GtkRadioActionEntry*)cPtr).tooltip);
    (cast(GtkRadioActionEntry*)cPtr).tooltip = propval.toCString(Yes.Alloc);
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
