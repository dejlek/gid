module gio.unix_mount_entry;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.boxed;

/**
 * Defines a Unix mount entry $(LPAREN)e.g. <filename>/media/cdrom</filename>$(RPAREN).
 * This corresponds roughly to a mtab entry.
 */
class UnixMountEntry : gobject.boxed.Boxed
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
    return cast(void function())g_unix_mount_entry_get_type != &gidSymbolNotFound ? g_unix_mount_entry_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
