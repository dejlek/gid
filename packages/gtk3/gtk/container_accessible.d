module gtk.container_accessible;

import atk.component;
import atk.component_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget_accessible;

/** */
class ContainerAccessible : gtk.widget_accessible.WidgetAccessible
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_container_accessible_get_type != &gidSymbolNotFound ? gtk_container_accessible_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
