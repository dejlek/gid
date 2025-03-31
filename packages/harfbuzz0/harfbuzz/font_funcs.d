/// Module for [FontFuncs] class
module harfbuzz.font_funcs;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Data type containing a set of virtual methods used for
    working on #hb_font_t font objects.
    
    HarfBuzz provides a lightweight default function for each of
    the methods in #hb_font_funcs_t. Client programs can implement
    their own replacements for the individual font functions, as
    needed, and replace the default by calling the setter for a
    method.
*/
class FontFuncs : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_font_funcs_get_type != &gidSymbolNotFound ? hb_gobject_font_funcs_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override FontFuncs self()
  {
    return this;
  }
}
