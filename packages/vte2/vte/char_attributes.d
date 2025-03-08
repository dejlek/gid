module vte.char_attributes;

import gid.gid;
import vte.c.functions;
import vte.c.types;
import vte.types;

/** */
class CharAttributes
{
  VteCharAttributes cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Vte.CharAttributes");

    cInstance = *cast(VteCharAttributes*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }
}
