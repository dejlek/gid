/// Module for [CharAttributes] class
module vte.char_attributes;

import gid.gid;
import vte.c.functions;
import vte.c.types;
import vte.types;

/** */
class CharAttributes
{
  VteCharAttributes cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for vte.char_attributes.CharAttributes");

    cInstance = *cast(VteCharAttributes*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }
}
