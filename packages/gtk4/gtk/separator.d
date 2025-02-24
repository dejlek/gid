module gtk.separator;

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
import gtk.types;
import gtk.widget;

/**
 * `GtkSeparator` is a horizontal or vertical separator widget.
 * ![An example GtkSeparator](separator.png)
 * A `GtkSeparator` can be used to group the widgets within a window.
 * It displays a line with a shadow to make it appear sunken into the
 * interface.
 * # CSS nodes
 * `GtkSeparator` has a single CSS node with name separator. The node
 * gets one of the .horizontal or .vertical style classes.
 * # Accessibility
 * `GtkSeparator` uses the %GTK_ACCESSIBLE_ROLE_SEPARATOR role.
 */
class Separator : Widget, Orientable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_separator_get_type != &gidSymbolNotFound ? gtk_separator_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin OrientableT!();

  /**
   * Creates a new `GtkSeparator` with the given orientation.
   * Params:
   *   orientation = the separator’s orientation.
   * Returns: a new `GtkSeparator`.
   */
  this(Orientation orientation)
  {
    GtkWidget* _cretval;
    _cretval = gtk_separator_new(orientation);
    this(_cretval, No.Take);
  }
}
