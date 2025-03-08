module gtk.popover_accessible;

import atk.component;
import atk.component_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class PopoverAccessible : gtk.container_accessible.ContainerAccessible
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_popover_accessible_get_type != &gidSymbolNotFound ? gtk_popover_accessible_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }
}
