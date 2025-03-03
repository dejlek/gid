module gtk.list_base;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.types;
import gtk.widget;

/**
 * `GtkListBase` is the abstract base class for GTK's list widgets.
 */
class ListBase : gtk.widget.Widget, gtk.orientable.Orientable, gtk.scrollable.Scrollable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_list_base_get_type != &gidSymbolNotFound ? gtk_list_base_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin OrientableT!();
  mixin ScrollableT!();
}
