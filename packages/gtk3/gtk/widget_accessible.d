module gtk.widget_accessible;

import atk.component;
import atk.component_mixin;
import gid.gid;
import gtk.accessible;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class WidgetAccessible : gtk.accessible.Accessible, atk.component.Component
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_widget_accessible_get_type != &gidSymbolNotFound ? gtk_widget_accessible_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin ComponentT!();
}
