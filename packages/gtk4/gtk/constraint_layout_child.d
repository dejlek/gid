module gtk.constraint_layout_child;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_child;
import gtk.types;

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
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_constraint_layout_child_get_type != &gidSymbolNotFound ? gtk_constraint_layout_child_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
