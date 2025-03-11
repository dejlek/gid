module gdk.event_grab_broken;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated when a pointer or keyboard grab is broken. On X11, this happens
  when the grab window becomes unviewable (i.e. it or one of its ancestors
  is unmapped), or if the same application grabs the pointer or keyboard
  again. Note that implicit grabs (which are initiated by button presses)
  can also cause #GdkEventGrabBroken events.
*/
class EventGrabBroken
{
  GdkEventGrabBroken cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventGrabBroken");

    cInstance = *cast(GdkEventGrabBroken*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventGrabBroken*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventGrabBroken*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventGrabBroken*)cPtr).window);
  }

  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventGrabBroken*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventGrabBroken*)cPtr).window);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventGrabBroken*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventGrabBroken*)cPtr).sendEvent = propval;
  }

  @property bool keyboard()
  {
    return (cast(GdkEventGrabBroken*)cPtr).keyboard;
  }

  @property void keyboard(bool propval)
  {
    (cast(GdkEventGrabBroken*)cPtr).keyboard = propval;
  }

  @property bool implicit()
  {
    return (cast(GdkEventGrabBroken*)cPtr).implicit;
  }

  @property void implicit(bool propval)
  {
    (cast(GdkEventGrabBroken*)cPtr).implicit = propval;
  }

  @property gdk.window.Window grabWindow()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventGrabBroken*)cPtr).grabWindow);
  }

  @property void grabWindow(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventGrabBroken*)cPtr).grabWindow);
    dToC(propval, cast(void*)&(cast(GdkEventGrabBroken*)cPtr).grabWindow);
  }
}
