module gtk.menu_accessible;

import atk.component;
import atk.component_mixin;
import atk.selection;
import atk.selection_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu_shell_accessible;
import gtk.types;

class MenuAccessible : gtk.menu_shell_accessible.MenuShellAccessible
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_menu_accessible_get_type != &gidSymbolNotFound ? gtk_menu_accessible_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
