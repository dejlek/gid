module gtk.progress_bar_accessible;

import atk.component;
import atk.component_mixin;
import atk.value;
import atk.value_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget_accessible;

/** */
class ProgressBarAccessible : gtk.widget_accessible.WidgetAccessible, atk.value.Value
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_progress_bar_accessible_get_type != &gidSymbolNotFound ? gtk_progress_bar_accessible_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override ProgressBarAccessible self()
  {
    return this;
  }

  mixin ValueT!();
}
