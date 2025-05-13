/// Module for [FlagsValue] class
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gobject.flags_value.FlagsValue");

    cInstance = *cast(GFlagsValue*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `value` field.
      Returns: the flags value
  */
  @property uint value()
  {
    return (cast(GFlagsValue*)this._cPtr).value;
  }

  /**
      Set `value` field.
      Params:
        propval = the flags value
  */
  @property void value(uint propval)
  {
    (cast(GFlagsValue*)this._cPtr).value = propval;
  }

  /**
      Get `valueName` field.
      Returns: the name of the value
  */
  @property string valueName()
  {
    return cToD!(string)(cast(void*)(cast(GFlagsValue*)this._cPtr).valueName);
  }

  /**
      Set `valueName` field.
      Params:
        propval = the name of the value
  */
  @property void valueName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GFlagsValue*)this._cPtr).valueName);
    dToC(propval, cast(void*)&(cast(GFlagsValue*)this._cPtr).valueName);
  }

  /**
      Get `valueNick` field.
      Returns: the nickname of the value
  */
  @property string valueNick()
  {
    return cToD!(string)(cast(void*)(cast(GFlagsValue*)this._cPtr).valueNick);
  }

  /**
      Set `valueNick` field.
      Params:
        propval = the nickname of the value
  */
  @property void valueNick(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GFlagsValue*)this._cPtr).valueNick);
    dToC(propval, cast(void*)&(cast(GFlagsValue*)this._cPtr).valueNick);
  }
}
