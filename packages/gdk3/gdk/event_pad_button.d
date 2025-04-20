/// Module for [EventPadButton] class
module gdk.event_pad_button;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated during [gdk.types.InputSource.TabletPad] button presses and releases.
*/
class EventPadButton
{
  GdkEventPadButton cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_pad_button.EventPadButton");

    cInstance = *cast(GdkEventPadButton*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.PadButtonPress] or [gdk.types.EventType.PadButtonRelease]).
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventPadButton*)cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.PadButtonPress] or [gdk.types.EventType.PadButtonRelease]).
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventPadButton*)cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventPadButton*)cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventPadButton*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventPadButton*)cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventPadButton*)cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventPadButton*)cPtr).sendEvent = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time()
  {
    return (cast(GdkEventPadButton*)cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval)
  {
    (cast(GdkEventPadButton*)cPtr).time = propval;
  }

  /**
      Get `group` field.
      Returns: the pad group the button belongs to. A [gdk.types.InputSource.TabletPad] device
        may have one or more groups containing a set of buttons/rings/strips each.
  */
  @property uint group()
  {
    return (cast(GdkEventPadButton*)cPtr).group;
  }

  /**
      Set `group` field.
      Params:
        propval = the pad group the button belongs to. A [gdk.types.InputSource.TabletPad] device
          may have one or more groups containing a set of buttons/rings/strips each.
  */
  @property void group(uint propval)
  {
    (cast(GdkEventPadButton*)cPtr).group = propval;
  }

  /**
      Get `button` field.
      Returns: The pad button that was pressed.
  */
  @property uint button()
  {
    return (cast(GdkEventPadButton*)cPtr).button;
  }

  /**
      Set `button` field.
      Params:
        propval = The pad button that was pressed.
  */
  @property void button(uint propval)
  {
    (cast(GdkEventPadButton*)cPtr).button = propval;
  }

  /**
      Get `mode` field.
      Returns: The current mode of @group. Different groups in a [gdk.types.InputSource.TabletPad]
        device may have different current modes.
  */
  @property uint mode()
  {
    return (cast(GdkEventPadButton*)cPtr).mode;
  }

  /**
      Set `mode` field.
      Params:
        propval = The current mode of @group. Different groups in a [gdk.types.InputSource.TabletPad]
          device may have different current modes.
  */
  @property void mode(uint propval)
  {
    (cast(GdkEventPadButton*)cPtr).mode = propval;
  }
}
