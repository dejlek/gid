/// Module for [FlowBoxAccessible] class
module gtk.flow_box_accessible;

import atk.component;
import atk.component_mixin;
import atk.selection;
import atk.selection_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class FlowBoxAccessible : gtk.container_accessible.ContainerAccessible, atk.selection.Selection
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
    return cast(void function())gtk_flow_box_accessible_get_type != &gidSymbolNotFound ? gtk_flow_box_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override FlowBoxAccessible self()
  {
    return this;
  }

  mixin SelectionT!();
}
