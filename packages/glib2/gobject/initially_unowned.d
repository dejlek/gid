module gobject.initially_unowned;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.object;
import gobject.types;

/**
 * A type for objects that have an initially floating reference.
 * All the fields in the `GInitiallyUnowned` structure are private to the
 * implementation and should never be accessed directly.
 */
class InitiallyUnowned : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_initially_unowned_get_type != &gidSymbolNotFound ? g_initially_unowned_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
