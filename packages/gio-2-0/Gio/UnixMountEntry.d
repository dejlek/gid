module Gio.UnixMountEntry;

import GObject.Boxed;
import Gid.gid;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * Defines a Unix mount entry $(LPAREN)e.g. <filename>/media/cdrom</filename>$(RPAREN).
 * This corresponds roughly to a mtab entry.
 */
class UnixMountEntry : Boxed
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
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())g_unix_mount_entry_get_type != &gidSymbolNotFound ? g_unix_mount_entry_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
