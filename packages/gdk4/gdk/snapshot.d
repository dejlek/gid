/// Module for [Snapshot] class
module gdk.snapshot;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gobject.object;

/**
    Base type for snapshot operations.
    
    The subclass of [gdk.snapshot.Snapshot] used by GTK is [GtkSnapshot](../gtk4/class.Snapshot.html).
*/
class Snapshot : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_snapshot_get_type != &gidSymbolNotFound ? gdk_snapshot_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Snapshot self()
  {
    return this;
  }
}
