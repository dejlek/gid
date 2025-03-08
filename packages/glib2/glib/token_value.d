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

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GLib.TokenValue");

    cInstance = *cast(GTokenValue*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string vIdentifier()
  {
    return (cast(GTokenValue*)cPtr).vIdentifier.fromCString(No.free);
  }

  @property void vIdentifier(string propval)
  {
    safeFree(cast(void*)(cast(GTokenValue*)cPtr).vIdentifier);
    (cast(GTokenValue*)cPtr).vIdentifier = propval.toCString(Yes.alloc);
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
    return (cast(GTokenValue*)cPtr).vString.fromCString(No.free);
  }

  @property void vString(string propval)
  {
    safeFree(cast(void*)(cast(GTokenValue*)cPtr).vString);
    (cast(GTokenValue*)cPtr).vString = propval.toCString(Yes.alloc);
  }

  @property string vComment()
  {
    return (cast(GTokenValue*)cPtr).vComment.fromCString(No.free);
  }

  @property void vComment(string propval)
  {
    safeFree(cast(void*)(cast(GTokenValue*)cPtr).vComment);
    (cast(GTokenValue*)cPtr).vComment = propval.toCString(Yes.alloc);
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
