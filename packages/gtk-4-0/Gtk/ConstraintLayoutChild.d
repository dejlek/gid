module Gtk.ConstraintLayoutChild;

import Gid.gid;
import Gtk.LayoutChild;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkLayoutChild` subclass for children in a `GtkConstraintLayout`.
 */
class ConstraintLayoutChild : LayoutChild
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_constraint_layout_child_get_type != &gidSymbolNotFound ? gtk_constraint_layout_child_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
