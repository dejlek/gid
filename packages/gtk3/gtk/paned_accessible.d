/// Module for [PanedAccessible] class
module gtk.paned_accessible;

import atk.component;
import atk.component_mixin;
import atk.value;
import atk.value_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class PanedAccessible : gtk.container_accessible.ContainerAccessible, atk.value.Value
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_paned_accessible_get_type != &gidSymbolNotFound ? gtk_paned_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PanedAccessible self()
  {
    return this;
  }

  mixin ValueT!();
}
