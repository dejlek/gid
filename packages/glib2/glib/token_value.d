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
      throw new GidConstructException("Null instance pointer for glib.token_value.TokenValue");

    cInstance = *cast(GTokenValue*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `vIdentifier` field.
      Returns: token identifier value
  */
  @property string vIdentifier()
  {
    return cToD!(string)(cast(void*)(cast(GTokenValue*)cPtr).vIdentifier);
  }

  /**
      Set `vIdentifier` field.
      Params:
        propval = token identifier value
  */
  @property void vIdentifier(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GTokenValue*)cPtr).vIdentifier);
    dToC(propval, cast(void*)&(cast(GTokenValue*)cPtr).vIdentifier);
  }

  /**
      Get `vBinary` field.
      Returns: token binary integer value
  */
  @property gulong vBinary()
  {
    return (cast(GTokenValue*)cPtr).vBinary;
  }

  /**
      Set `vBinary` field.
      Params:
        propval = token binary integer value
  */
  @property void vBinary(gulong propval)
  {
    (cast(GTokenValue*)cPtr).vBinary = propval;
  }

  /**
      Get `vOctal` field.
      Returns: octal integer value
  */
  @property gulong vOctal()
  {
    return (cast(GTokenValue*)cPtr).vOctal;
  }

  /**
      Set `vOctal` field.
      Params:
        propval = octal integer value
  */
  @property void vOctal(gulong propval)
  {
    (cast(GTokenValue*)cPtr).vOctal = propval;
  }

  /**
      Get `vInt` field.
      Returns: integer value
  */
  @property gulong vInt()
  {
    return (cast(GTokenValue*)cPtr).vInt;
  }

  /**
      Set `vInt` field.
      Params:
        propval = integer value
  */
  @property void vInt(gulong propval)
  {
    (cast(GTokenValue*)cPtr).vInt = propval;
  }

  /**
      Get `vInt64` field.
      Returns: 64-bit integer value
  */
  @property ulong vInt64()
  {
    return (cast(GTokenValue*)cPtr).vInt64;
  }

  /**
      Set `vInt64` field.
      Params:
        propval = 64-bit integer value
  */
  @property void vInt64(ulong propval)
  {
    (cast(GTokenValue*)cPtr).vInt64 = propval;
  }

  /**
      Get `vFloat` field.
      Returns: floating point value
  */
  @property double vFloat()
  {
    return (cast(GTokenValue*)cPtr).vFloat;
  }

  /**
      Set `vFloat` field.
      Params:
        propval = floating point value
  */
  @property void vFloat(double propval)
  {
    (cast(GTokenValue*)cPtr).vFloat = propval;
  }

  /**
      Get `vHex` field.
      Returns: hex integer value
  */
  @property gulong vHex()
  {
    return (cast(GTokenValue*)cPtr).vHex;
  }

  /**
      Set `vHex` field.
      Params:
        propval = hex integer value
  */
  @property void vHex(gulong propval)
  {
    (cast(GTokenValue*)cPtr).vHex = propval;
  }

  /**
      Get `vString` field.
      Returns: string value
  */
  @property string vString()
  {
    return cToD!(string)(cast(void*)(cast(GTokenValue*)cPtr).vString);
  }

  /**
      Set `vString` field.
      Params:
        propval = string value
  */
  @property void vString(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GTokenValue*)cPtr).vString);
    dToC(propval, cast(void*)&(cast(GTokenValue*)cPtr).vString);
  }

  /**
      Get `vComment` field.
      Returns: comment value
  */
  @property string vComment()
  {
    return cToD!(string)(cast(void*)(cast(GTokenValue*)cPtr).vComment);
  }

  /**
      Set `vComment` field.
      Params:
        propval = comment value
  */
  @property void vComment(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GTokenValue*)cPtr).vComment);
    dToC(propval, cast(void*)&(cast(GTokenValue*)cPtr).vComment);
  }

  /**
      Get `vChar` field.
      Returns: character value
  */
  @property ubyte vChar()
  {
    return (cast(GTokenValue*)cPtr).vChar;
  }

  /**
      Set `vChar` field.
      Params:
        propval = character value
  */
  @property void vChar(ubyte propval)
  {
    (cast(GTokenValue*)cPtr).vChar = propval;
  }

  /**
      Get `vError` field.
      Returns: error value
  */
  @property uint vError()
  {
    return (cast(GTokenValue*)cPtr).vError;
  }

  /**
      Set `vError` field.
      Params:
        propval = error value
  */
  @property void vError(uint propval)
  {
    (cast(GTokenValue*)cPtr).vError = propval;
  }
}
