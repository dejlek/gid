/// Module for [ScaleAccessible] class
module gtk.scale_accessible;

import atk.component;
import atk.component_mixin;
import atk.value;
import atk.value_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.range_accessible;
import gtk.types;

/** */
class ScaleAccessible : gtk.range_accessible.RangeAccessible
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
    return cast(void function())gtk_scale_accessible_get_type != &gidSymbolNotFound ? gtk_scale_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ScaleAccessible self()
  {
    return this;
  }
}
