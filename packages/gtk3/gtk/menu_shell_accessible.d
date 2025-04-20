/// Module for [MenuShellAccessible] class
module gtk.menu_shell_accessible;

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
class MenuShellAccessible : gtk.container_accessible.ContainerAccessible, atk.selection.Selection
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
    return cast(void function())gtk_menu_shell_accessible_get_type != &gidSymbolNotFound ? gtk_menu_shell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuShellAccessible self()
  {
    return this;
  }

  mixin SelectionT!();
}
