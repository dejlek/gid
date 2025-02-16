module Gdk.Snapshot;

import GObject.ObjectG;
import Gdk.Types;
import Gdk.c.functions;
import Gdk.c.types;
import Gid.gid;

/**
 * Base type for snapshot operations.
 * The subclass of `GdkSnapshot` used by GTK is [GtkSnapshot](../gtk4/class.Snapshot.html).
 */
class Snapshot : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_snapshot_get_type != &gidSymbolNotFound ? gdk_snapshot_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
