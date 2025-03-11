module gdk.event_setting;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated when a setting is modified.
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
      gFree(ptr);
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
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventSetting*)cPtr).window);
  }

  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventSetting*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventSetting*)cPtr).window);
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
    return cToD!(string)(cast(void*)(cast(GdkEventSetting*)cPtr).name);
  }

  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkEventSetting*)cPtr).name);
    dToC(propval, cast(void*)&(cast(GdkEventSetting*)cPtr).name);
  }
}
