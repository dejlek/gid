module harfbuzz.map;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
 * Data type for holding integer-to-integer hash maps.
 */
class Map : gobject.boxed.Boxed
{

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
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_map_get_type != &gidSymbolNotFound ? hb_gobject_map_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
