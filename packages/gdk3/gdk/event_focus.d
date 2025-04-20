/// Module for [EventFocus] class
module gdk.event_focus;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Describes a change of keyboard focus.
*/
class EventFocus
{
  GdkEventFocus cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_focus.EventFocus");

    cInstance = *cast(GdkEventFocus*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.FocusChange]).
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventFocus*)cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.FocusChange]).
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventFocus*)cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventFocus*)cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventFocus*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventFocus*)cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventFocus*)cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventFocus*)cPtr).sendEvent = propval;
  }

  /**
      Get `in_` field.
      Returns: true if the window has gained the keyboard focus, false if
        it has lost the focus.
  */
  @property short in_()
  {
    return (cast(GdkEventFocus*)cPtr).in_;
  }

  /**
      Set `in_` field.
      Params:
        propval = true if the window has gained the keyboard focus, false if
          it has lost the focus.
  */
  @property void in_(short propval)
  {
    (cast(GdkEventFocus*)cPtr).in_ = propval;
  }
}
