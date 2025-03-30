/// Module for [RadioActionEntry] class
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.RadioActionEntry");

    cInstance = *cast(GtkRadioActionEntry*)ptr;

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
    return cToD!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).name);
  }

  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).name);
    dToC(propval, cast(void*)&(cast(GtkRadioActionEntry*)cPtr).name);
  }

  @property string stockId()
  {
    return cToD!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).stockId);
  }

  @property void stockId(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).stockId);
    dToC(propval, cast(void*)&(cast(GtkRadioActionEntry*)cPtr).stockId);
  }

  @property string label()
  {
    return cToD!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).label);
  }

  @property void label(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).label);
    dToC(propval, cast(void*)&(cast(GtkRadioActionEntry*)cPtr).label);
  }

  @property string accelerator()
  {
    return cToD!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).accelerator);
  }

  @property void accelerator(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).accelerator);
    dToC(propval, cast(void*)&(cast(GtkRadioActionEntry*)cPtr).accelerator);
  }

  @property string tooltip()
  {
    return cToD!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).tooltip);
  }

  @property void tooltip(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRadioActionEntry*)cPtr).tooltip);
    dToC(propval, cast(void*)&(cast(GtkRadioActionEntry*)cPtr).tooltip);
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
