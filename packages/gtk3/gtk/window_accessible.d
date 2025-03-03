module gtk.window_accessible;

import atk.component;
import atk.component_mixin;
import atk.window;
import atk.window_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

class WindowAccessible : gtk.container_accessible.ContainerAccessible, atk.window.Window
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_window_accessible_get_type != &gidSymbolNotFound ? gtk_window_accessible_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin WindowT!();
}
