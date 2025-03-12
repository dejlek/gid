module gtk.menu_button_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.image;
import atk.image_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.toggle_button_accessible;
import gtk.types;

/** */
class MenuButtonAccessible : gtk.toggle_button_accessible.ToggleButtonAccessible
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_menu_button_accessible_get_type != &gidSymbolNotFound ? gtk_menu_button_accessible_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override MenuButtonAccessible self()
  {
    return this;
  }
}
