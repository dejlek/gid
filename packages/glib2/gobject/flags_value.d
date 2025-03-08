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
      safeFree(ptr);
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
    return (cast(GFlagsValue*)cPtr).valueName.fromCString(No.Free);
  }

  @property void valueName(string propval)
  {
    safeFree(cast(void*)(cast(GFlagsValue*)cPtr).valueName);
    (cast(GFlagsValue*)cPtr).valueName = propval.toCString(Yes.Alloc);
  }

  @property string valueNick()
  {
    return (cast(GFlagsValue*)cPtr).valueNick.fromCString(No.Free);
  }

  @property void valueNick(string propval)
  {
    safeFree(cast(void*)(cast(GFlagsValue*)cPtr).valueNick);
    (cast(GFlagsValue*)cPtr).valueNick = propval.toCString(Yes.Alloc);
  }
}
