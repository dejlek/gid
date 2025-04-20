/// Module for [EventOwnerChange] class
module gdk.event_owner_change;

import gdk.atom;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated when the owner of a selection changes. On X11, this
    information is only available if the X server supports the XFIXES
    extension.
*/
class EventOwnerChange
{
  GdkEventOwnerChange cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_owner_change.EventOwnerChange");

    cInstance = *cast(GdkEventOwnerChange*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.OwnerChange]).
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventOwnerChange*)cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.OwnerChange]).
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventOwnerChange*)cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventOwnerChange*)cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventOwnerChange*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventOwnerChange*)cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventOwnerChange*)cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventOwnerChange*)cPtr).sendEvent = propval;
  }

  /**
      Get `owner` field.
      Returns: the new owner of the selection, or null if there is none
  */
  @property gdk.window.Window owner()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventOwnerChange*)cPtr).owner);
  }

  /**
      Set `owner` field.
      Params:
        propval = the new owner of the selection, or null if there is none
  */
  @property void owner(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventOwnerChange*)cPtr).owner);
    dToC(propval, cast(void*)&(cast(GdkEventOwnerChange*)cPtr).owner);
  }

  /**
      Get `reason` field.
      Returns: the reason for the ownership change as a #GdkOwnerChange value
  */
  @property gdk.types.OwnerChange reason()
  {
    return cast(gdk.types.OwnerChange)(cast(GdkEventOwnerChange*)cPtr).reason;
  }

  /**
      Set `reason` field.
      Params:
        propval = the reason for the ownership change as a #GdkOwnerChange value
  */
  @property void reason(gdk.types.OwnerChange propval)
  {
    (cast(GdkEventOwnerChange*)cPtr).reason = cast(GdkOwnerChange)propval;
  }

  /**
      Get `selection` field.
      Returns: the atom identifying the selection
  */
  @property gdk.atom.Atom selection()
  {
    return new gdk.atom.Atom(cast(GdkAtom*)&(cast(GdkEventOwnerChange*)cPtr).selection);
  }

  /**
      Get `time` field.
      Returns: the timestamp of the event
  */
  @property uint time()
  {
    return (cast(GdkEventOwnerChange*)cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the timestamp of the event
  */
  @property void time(uint propval)
  {
    (cast(GdkEventOwnerChange*)cPtr).time = propval;
  }

  /**
      Get `selectionTime` field.
      Returns: the time at which the selection ownership was taken
        over
  */
  @property uint selectionTime()
  {
    return (cast(GdkEventOwnerChange*)cPtr).selectionTime;
  }

  /**
      Set `selectionTime` field.
      Params:
        propval = the time at which the selection ownership was taken
          over
  */
  @property void selectionTime(uint propval)
  {
    (cast(GdkEventOwnerChange*)cPtr).selectionTime = propval;
  }
}
