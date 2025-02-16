module HarfBuzz.UserDataKey;

import GObject.Boxed;
import Gid.gid;
import HarfBuzz.Types;
import HarfBuzz.c.functions;
import HarfBuzz.c.types;

/**
 * Data structure for holding user-data keys.
 */
class UserDataKey : Boxed
{

  this()
  {
    super(safeMalloc(hb_user_data_key_t.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_user_data_key_get_type != &gidSymbolNotFound ? hb_gobject_user_data_key_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
