/// Module for [EventKey] class
module gdk.event_key;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Describes a key press or key release event.
*/
class EventKey
{
  GdkEventKey cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventKey");

    cInstance = *cast(GdkEventKey*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventKey*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventKey*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventKey*)cPtr).window);
  }

  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventKey*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventKey*)cPtr).window);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventKey*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventKey*)cPtr).sendEvent = propval;
  }

  @property uint time()
  {
    return (cast(GdkEventKey*)cPtr).time;
  }

  @property void time(uint propval)
  {
    (cast(GdkEventKey*)cPtr).time = propval;
  }

  @property gdk.types.ModifierType state()
  {
    return cast(gdk.types.ModifierType)(cast(GdkEventKey*)cPtr).state;
  }

  @property void state(gdk.types.ModifierType propval)
  {
    (cast(GdkEventKey*)cPtr).state = cast(GdkModifierType)propval;
  }

  @property uint keyval()
  {
    return (cast(GdkEventKey*)cPtr).keyval;
  }

  @property void keyval(uint propval)
  {
    (cast(GdkEventKey*)cPtr).keyval = propval;
  }

  @property int length()
  {
    return (cast(GdkEventKey*)cPtr).length;
  }

  @property void length(int propval)
  {
    (cast(GdkEventKey*)cPtr).length = propval;
  }

  @property string string_()
  {
    return cToD!(string)(cast(void*)(cast(GdkEventKey*)cPtr).string_);
  }

  @property void string_(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkEventKey*)cPtr).string_);
    dToC(propval, cast(void*)&(cast(GdkEventKey*)cPtr).string_);
  }

  @property ushort hardwareKeycode()
  {
    return (cast(GdkEventKey*)cPtr).hardwareKeycode;
  }

  @property void hardwareKeycode(ushort propval)
  {
    (cast(GdkEventKey*)cPtr).hardwareKeycode = propval;
  }

  @property ubyte group()
  {
    return (cast(GdkEventKey*)cPtr).group;
  }

  @property void group(ubyte propval)
  {
    (cast(GdkEventKey*)cPtr).group = propval;
  }

  @property uint isModifier()
  {
    return (cast(GdkEventKey*)cPtr).isModifier;
  }

  @property void isModifier(uint propval)
  {
    (cast(GdkEventKey*)cPtr).isModifier = propval;
  }
}
