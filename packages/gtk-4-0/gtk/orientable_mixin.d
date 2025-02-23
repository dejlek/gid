module gtk.orientable_mixin;

public import gtk.orientable_iface_proxy;
public import gid.gid;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
 * The `GtkOrientable` interface is implemented by all widgets that can be
 * oriented horizontally or vertically.
 * `GtkOrientable` is more flexible in that it allows the orientation to be
 * changed at runtime, allowing the widgets to “flip”.
 * ## CSS nodes
 * `GtkWidget` types implementing the `GtkOrientable` interface will
 * automatically acquire the `horizontal` or `vertical` CSS class depending on
 * the value of the [Gtk.Orientable.orientation] property.
 */
template OrientableT()
{

  /**
   * Retrieves the orientation of the orientable.
   * Returns: the orientation of the orientable
   */
  override Orientation getOrientation()
  {
    GtkOrientation _cretval;
    _cretval = gtk_orientable_get_orientation(cast(GtkOrientable*)cPtr);
    Orientation _retval = cast(Orientation)_cretval;
    return _retval;
  }

  /**
   * Sets the orientation of the orientable.
   * Params:
   *   orientation = the orientable’s new orientation
   */
  override void setOrientation(Orientation orientation)
  {
    gtk_orientable_set_orientation(cast(GtkOrientable*)cPtr, orientation);
  }
}
