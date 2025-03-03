module gdk.event_setting;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.object;

/**
 * Generated when a setting is modified.
 */
class EventSetting
{
  GdkEventSetting cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventSetting");

    cInstance = *cast(GdkEventSetting*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventSetting*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventSetting*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return ObjectG.getDObject!(gdk.window.Window)((cast(GdkEventSetting*)cPtr).window, No.Take);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventSetting*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventSetting*)cPtr).sendEvent = propval;
  }

  @property gdk.types.SettingAction action()
  {
    return cast(gdk.types.SettingAction)(cast(GdkEventSetting*)cPtr).action;
  }

  @property void action(gdk.types.SettingAction propval)
  {
    (cast(GdkEventSetting*)cPtr).action = cast(GdkSettingAction)propval;
  }

  @property string name()
  {
    return (cast(GdkEventSetting*)cPtr).name.fromCString(No.Free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GdkEventSetting*)cPtr).name);
    (cast(GdkEventSetting*)cPtr).name = propval.toCString(Yes.Alloc);
  }
}
