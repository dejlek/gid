/// Module for [EventPadGroupMode] class
module gdk.event_pad_group_mode;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated during [gdk.types.InputSource.TabletPad] mode switches in a group.
*/
class EventPadGroupMode
{
  GdkEventPadGroupMode cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_pad_group_mode.EventPadGroupMode");

    cInstance = *cast(GdkEventPadGroupMode*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.PadGroupMode]).
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventPadGroupMode*)cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.PadGroupMode]).
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventPadGroupMode*)cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventPadGroupMode*)cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventPadGroupMode*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventPadGroupMode*)cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventPadGroupMode*)cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventPadGroupMode*)cPtr).sendEvent = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time()
  {
    return (cast(GdkEventPadGroupMode*)cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval)
  {
    (cast(GdkEventPadGroupMode*)cPtr).time = propval;
  }

  /**
      Get `group` field.
      Returns: the pad group that is switching mode. A [gdk.types.InputSource.TabletPad]
        device may have one or more groups containing a set of buttons/rings/strips
        each.
  */
  @property uint group()
  {
    return (cast(GdkEventPadGroupMode*)cPtr).group;
  }

  /**
      Set `group` field.
      Params:
        propval = the pad group that is switching mode. A [gdk.types.InputSource.TabletPad]
          device may have one or more groups containing a set of buttons/rings/strips
          each.
  */
  @property void group(uint propval)
  {
    (cast(GdkEventPadGroupMode*)cPtr).group = propval;
  }

  /**
      Get `mode` field.
      Returns: The new mode of @group. Different groups in a [gdk.types.InputSource.TabletPad]
        device may have different current modes.
  */
  @property uint mode()
  {
    return (cast(GdkEventPadGroupMode*)cPtr).mode;
  }

  /**
      Set `mode` field.
      Params:
        propval = The new mode of @group. Different groups in a [gdk.types.InputSource.TabletPad]
          device may have different current modes.
  */
  @property void mode(uint propval)
  {
    (cast(GdkEventPadGroupMode*)cPtr).mode = propval;
  }
}
