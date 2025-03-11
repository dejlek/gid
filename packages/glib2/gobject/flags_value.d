module gobject.flags_value;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;

/**
    A structure which contains a single flags value, its name, and its
  nickname.
*/
class FlagsValue
{
  GFlagsValue cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.FlagsValue");

    cInstance = *cast(GFlagsValue*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property uint value()
  {
    return (cast(GFlagsValue*)cPtr).value;
  }

  @property void value(uint propval)
  {
    (cast(GFlagsValue*)cPtr).value = propval;
  }

  @property string valueName()
  {
    return cToD!(string)(cast(void*)(cast(GFlagsValue*)cPtr).valueName);
  }

  @property void valueName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GFlagsValue*)cPtr).valueName);
    dToC(propval, cast(void*)&(cast(GFlagsValue*)cPtr).valueName);
  }

  @property string valueNick()
  {
    return cToD!(string)(cast(void*)(cast(GFlagsValue*)cPtr).valueNick);
  }

  @property void valueNick(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GFlagsValue*)cPtr).valueNick);
    dToC(propval, cast(void*)&(cast(GFlagsValue*)cPtr).valueNick);
  }
}
