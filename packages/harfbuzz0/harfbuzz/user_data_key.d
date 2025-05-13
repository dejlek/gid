/// Module for [UserDataKey] class
module harfbuzz.user_data_key;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Data structure for holding user-data keys.
*/
class UserDataKey : gobject.boxed.Boxed
{

  /**
      Create a `user_data_key.UserDataKey` boxed type.
  */
  this()
  {
    super(gMalloc(hb_user_data_key_t.sizeof), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_user_data_key_get_type != &gidSymbolNotFound ? hb_gobject_user_data_key_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UserDataKey self()
  {
    return this;
  }
}
