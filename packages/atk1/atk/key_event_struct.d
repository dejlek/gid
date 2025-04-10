/// Module for [KeyEventStruct] class
module atk.key_event_struct;

import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;

/**
    Encapsulates information about a key event.
*/
class KeyEventStruct
{
  AtkKeyEventStruct cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Atk.KeyEventStruct");

    cInstance = *cast(AtkKeyEventStruct*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property int type()
  {
    return (cast(AtkKeyEventStruct*)cPtr).type;
  }

  @property void type(int propval)
  {
    (cast(AtkKeyEventStruct*)cPtr).type = propval;
  }

  @property uint state()
  {
    return (cast(AtkKeyEventStruct*)cPtr).state;
  }

  @property void state(uint propval)
  {
    (cast(AtkKeyEventStruct*)cPtr).state = propval;
  }

  @property uint keyval()
  {
    return (cast(AtkKeyEventStruct*)cPtr).keyval;
  }

  @property void keyval(uint propval)
  {
    (cast(AtkKeyEventStruct*)cPtr).keyval = propval;
  }

  @property int length()
  {
    return (cast(AtkKeyEventStruct*)cPtr).length;
  }

  @property void length(int propval)
  {
    (cast(AtkKeyEventStruct*)cPtr).length = propval;
  }

  @property string string_()
  {
    return cToD!(string)(cast(void*)(cast(AtkKeyEventStruct*)cPtr).string_);
  }

  @property void string_(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(AtkKeyEventStruct*)cPtr).string_);
    dToC(propval, cast(void*)&(cast(AtkKeyEventStruct*)cPtr).string_);
  }

  @property ushort keycode()
  {
    return (cast(AtkKeyEventStruct*)cPtr).keycode;
  }

  @property void keycode(ushort propval)
  {
    (cast(AtkKeyEventStruct*)cPtr).keycode = propval;
  }

  @property uint timestamp()
  {
    return (cast(AtkKeyEventStruct*)cPtr).timestamp;
  }

  @property void timestamp(uint propval)
  {
    (cast(AtkKeyEventStruct*)cPtr).timestamp = propval;
  }
}
