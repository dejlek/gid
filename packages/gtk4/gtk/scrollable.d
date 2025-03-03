module gtk.scrollable;

public import gtk.scrollable_iface_proxy;
import gid.gid;
import gobject.object;
import gtk.adjustment;
import gtk.border;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * `GtkScrollable` is an interface for widgets with native scrolling ability.
 * To implement this interface you should override the
 * [gtk.scrollable.Scrollable.Adjustment] and
 * [gtk.scrollable.Scrollable.Adjustment] properties.
 * ## Creating a scrollable widget
 * All scrollable widgets should do the following.
 * - When a parent widget sets the scrollable child widget’s adjustments,
 * the widget should connect to the signal@Gtk.Adjustment::value-changed
 * signal. The child widget should then populate the adjustments’ properties
 * as soon as possible, which usually means queueing an allocation right away
 * and populating the properties in the vfunc@Gtk.Widget.size_allocate
 * implementation.
 * - Because its preferred size is the size for a fully expanded widget,
 * the scrollable widget must be able to cope with underallocations.
 * This means that it must accept any value passed to its
 * vfunc@Gtk.Widget.size_allocate implementation.
 * - When the parent allocates space to the scrollable child widget,
 * the widget must ensure the adjustments’ property values are correct and up
 * to date, for example using [gtk.adjustment.Adjustment.configure].
 * - When any of the adjustments emits the signal@Gtk.Adjustment::value-changed
 * signal, the scrollable widget should scroll its contents.
 */
interface Scrollable
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_scrollable_get_type != &gidSymbolNotFound ? gtk_scrollable_get_type() : cast(GType)0;
  }

  /**
   * Returns the size of a non-scrolling border around the
   * outside of the scrollable.
   * An example for this would be treeview headers. GTK can use
   * this information to display overlaid graphics, like the
   * overshoot indication, at the right position.
   * Params:
   *   border = return location for the results
   * Returns: %TRUE if border has been set
   */
  bool getBorder(out gtk.border.Border border);

  /**
   * Retrieves the `GtkAdjustment` used for horizontal scrolling.
   * Returns: horizontal `GtkAdjustment`.
   */
  gtk.adjustment.Adjustment getHadjustment();

  /**
   * Gets the horizontal `GtkScrollablePolicy`.
   * Returns: The horizontal `GtkScrollablePolicy`.
   */
  gtk.types.ScrollablePolicy getHscrollPolicy();

  /**
   * Retrieves the `GtkAdjustment` used for vertical scrolling.
   * Returns: vertical `GtkAdjustment`.
   */
  gtk.adjustment.Adjustment getVadjustment();

  /**
   * Gets the vertical `GtkScrollablePolicy`.
   * Returns: The vertical `GtkScrollablePolicy`.
   */
  gtk.types.ScrollablePolicy getVscrollPolicy();

  /**
   * Sets the horizontal adjustment of the `GtkScrollable`.
   * Params:
   *   hadjustment = a `GtkAdjustment`
   */
  void setHadjustment(gtk.adjustment.Adjustment hadjustment = null);

  /**
   * Sets the `GtkScrollablePolicy`.
   * The policy determines whether horizontal scrolling should start
   * below the minimum width or below the natural width.
   * Params:
   *   policy = the horizontal `GtkScrollablePolicy`
   */
  void setHscrollPolicy(gtk.types.ScrollablePolicy policy);

  /**
   * Sets the vertical adjustment of the `GtkScrollable`.
   * Params:
   *   vadjustment = a `GtkAdjustment`
   */
  void setVadjustment(gtk.adjustment.Adjustment vadjustment = null);

  /**
   * Sets the `GtkScrollablePolicy`.
   * The policy determines whether vertical scrolling should start
   * below the minimum height or below the natural height.
   * Params:
   *   policy = the vertical `GtkScrollablePolicy`
   */
  void setVscrollPolicy(gtk.types.ScrollablePolicy policy);
}
