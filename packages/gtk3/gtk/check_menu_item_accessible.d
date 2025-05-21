/// Module for [CheckMenuItemAccessible] class
module gtk.check_menu_item_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.selection;
import atk.selection_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu_item_accessible;
import gtk.types;

/** */
class CheckMenuItemAccessible : gtk.menu_item_accessible.MenuItemAccessible
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
    return cast(void function())gtk_check_menu_item_accessible_get_type != &gidSymbolNotFound ? gtk_check_menu_item_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CheckMenuItemAccessible self()
  {
    return this;
  }
}
