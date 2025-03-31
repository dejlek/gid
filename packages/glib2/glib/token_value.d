/// Module for [TokenValue] class
module glib.token_value;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    A union holding the value of the token.
*/
class TokenValue
{
  GTokenValue cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GLib.TokenValue");

    cInstance = *cast(GTokenValue*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string vIdentifier()
  {
    return cToD!(string)(cast(void*)(cast(GTokenValue*)cPtr).vIdentifier);
  }

  @property void vIdentifier(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GTokenValue*)cPtr).vIdentifier);
    dToC(propval, cast(void*)&(cast(GTokenValue*)cPtr).vIdentifier);
  }

  @property gulong vBinary()
  {
    return (cast(GTokenValue*)cPtr).vBinary;
  }

  @property void vBinary(gulong propval)
  {
    (cast(GTokenValue*)cPtr).vBinary = propval;
  }

  @property gulong vOctal()
  {
    return (cast(GTokenValue*)cPtr).vOctal;
  }

  @property void vOctal(gulong propval)
  {
    (cast(GTokenValue*)cPtr).vOctal = propval;
  }

  @property gulong vInt()
  {
    return (cast(GTokenValue*)cPtr).vInt;
  }

  @property void vInt(gulong propval)
  {
    (cast(GTokenValue*)cPtr).vInt = propval;
  }

  @property ulong vInt64()
  {
    return (cast(GTokenValue*)cPtr).vInt64;
  }

  @property void vInt64(ulong propval)
  {
    (cast(GTokenValue*)cPtr).vInt64 = propval;
  }

  @property double vFloat()
  {
    return (cast(GTokenValue*)cPtr).vFloat;
  }

  @property void vFloat(double propval)
  {
    (cast(GTokenValue*)cPtr).vFloat = propval;
  }

  @property gulong vHex()
  {
    return (cast(GTokenValue*)cPtr).vHex;
  }

  @property void vHex(gulong propval)
  {
    (cast(GTokenValue*)cPtr).vHex = propval;
  }

  @property string vString()
  {
    return cToD!(string)(cast(void*)(cast(GTokenValue*)cPtr).vString);
  }

  @property void vString(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GTokenValue*)cPtr).vString);
    dToC(propval, cast(void*)&(cast(GTokenValue*)cPtr).vString);
  }

  @property string vComment()
  {
    return cToD!(string)(cast(void*)(cast(GTokenValue*)cPtr).vComment);
  }

  @property void vComment(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GTokenValue*)cPtr).vComment);
    dToC(propval, cast(void*)&(cast(GTokenValue*)cPtr).vComment);
  }

  @property ubyte vChar()
  {
    return (cast(GTokenValue*)cPtr).vChar;
  }

  @property void vChar(ubyte propval)
  {
    (cast(GTokenValue*)cPtr).vChar = propval;
  }

  @property uint vError()
  {
    return (cast(GTokenValue*)cPtr).vError;
  }

  @property void vError(uint propval)
  {
    (cast(GTokenValue*)cPtr).vError = propval;
  }
}
