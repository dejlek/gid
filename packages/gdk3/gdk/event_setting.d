/// Module for [EventSetting] class
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_setting.EventSetting");

    cInstance = *cast(GdkEventSetting*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `type` field.
      Returns: the type of the event ([gdk.types.EventType.Setting]).
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventSetting*)cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.Setting]).
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventSetting*)cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventSetting*)cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventSetting*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventSetting*)cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventSetting*)cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventSetting*)cPtr).sendEvent = propval;
  }

  /**
      Get `action` field.
      Returns: what happened to the setting ([gdk.types.SettingAction.New],
        [gdk.types.SettingAction.Changed] or [gdk.types.SettingAction.Deleted]).
  */
  @property gdk.types.SettingAction action()
  {
    return cast(gdk.types.SettingAction)(cast(GdkEventSetting*)cPtr).action;
  }

  /**
      Set `action` field.
      Params:
        propval = what happened to the setting ([gdk.types.SettingAction.New],
          [gdk.types.SettingAction.Changed] or [gdk.types.SettingAction.Deleted]).
  */
  @property void action(gdk.types.SettingAction propval)
  {
    (cast(GdkEventSetting*)cPtr).action = cast(GdkSettingAction)propval;
  }

  /**
      Get `name` field.
      Returns: the name of the setting.
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GdkEventSetting*)cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = the name of the setting.
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkEventSetting*)cPtr).name);
    dToC(propval, cast(void*)&(cast(GdkEventSetting*)cPtr).name);
  }
}
