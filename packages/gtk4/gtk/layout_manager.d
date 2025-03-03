module gtk.layout_manager;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_child;
import gtk.types;
import gtk.widget;

/**
 * Layout managers are delegate classes that handle the preferred size
 * and the allocation of a widget.
 * You typically subclass `GtkLayoutManager` if you want to implement a
 * layout policy for the children of a widget, or if you want to determine
 * the size of a widget depending on its contents.
 * Each `GtkWidget` can only have a `GtkLayoutManager` instance associated
 * to it at any given time; it is possible, though, to replace the layout
 * manager instance using [gtk.widget.Widget.setLayoutManager].
 * ## Layout properties
 * A layout manager can expose properties for controlling the layout of
 * each child, by creating an object type derived from [gtk.layout_child.LayoutChild]
 * and installing the properties on it as normal `GObject` properties.
 * Each `GtkLayoutChild` instance storing the layout properties for a
 * specific child is created through the [gtk.layout_manager.LayoutManager.getLayoutChild]
 * method; a `GtkLayoutManager` controls the creation of its `GtkLayoutChild`
 * instances by overriding the GtkLayoutManagerClass.create_layout_child$(LPAREN)$(RPAREN)
 * virtual function. The typical implementation should look like:
 * ```c
 * static GtkLayoutChild *
 * create_layout_child $(LPAREN)GtkLayoutManager *manager,
 * GtkWidget        *container,
 * GtkWidget        *child$(RPAREN)
 * {
 * return g_object_new $(LPAREN)your_layout_child_get_type $(LPAREN)$(RPAREN),
 * "layout-manager", manager,
 * "child-widget", child,
 * NULL$(RPAREN);
 * }
 * ```
 * The property@Gtk.LayoutChild:layout-manager and
 * property@Gtk.LayoutChild:child-widget properties
 * on the newly created `GtkLayoutChild` instance are mandatory. The
 * `GtkLayoutManager` will cache the newly created `GtkLayoutChild` instance
 * until the widget is removed from its parent, or the parent removes the
 * layout manager.
 * Each `GtkLayoutManager` instance creating a `GtkLayoutChild` should use
 * [gtk.layout_manager.LayoutManager.getLayoutChild] every time it needs to query
 * the layout properties; each `GtkLayoutChild` instance should call
 * [gtk.layout_manager.LayoutManager.layoutChanged] every time a property is
 * updated, in order to queue a new size measuring and allocation.
 */
class LayoutManager : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_layout_manager_get_type != &gidSymbolNotFound ? gtk_layout_manager_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Assigns the given width, height, and baseline to
   * a widget, and computes the position and sizes of the children of
   * the widget using the layout management policy of manager.
   * Params:
   *   widget = the `GtkWidget` using manager
   *   width = the new width of the widget
   *   height = the new height of the widget
   *   baseline = the baseline position of the widget, or -1
   */
  void allocate(gtk.widget.Widget widget, int width, int height, int baseline)
  {
    gtk_layout_manager_allocate(cast(GtkLayoutManager*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, width, height, baseline);
  }

  /**
   * Retrieves a `GtkLayoutChild` instance for the `GtkLayoutManager`,
   * creating one if necessary.
   * The child widget must be a child of the widget using manager.
   * The `GtkLayoutChild` instance is owned by the `GtkLayoutManager`,
   * and is guaranteed to exist as long as child is a child of the
   * `GtkWidget` using the given `GtkLayoutManager`.
   * Params:
   *   child = a `GtkWidget`
   * Returns: a `GtkLayoutChild`
   */
  gtk.layout_child.LayoutChild getLayoutChild(gtk.widget.Widget child)
  {
    GtkLayoutChild* _cretval;
    _cretval = gtk_layout_manager_get_layout_child(cast(GtkLayoutManager*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.layout_child.LayoutChild)(cast(GtkLayoutChild*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Retrieves the request mode of manager.
   * Returns: a `GtkSizeRequestMode`
   */
  gtk.types.SizeRequestMode getRequestMode()
  {
    GtkSizeRequestMode _cretval;
    _cretval = gtk_layout_manager_get_request_mode(cast(GtkLayoutManager*)cPtr);
    gtk.types.SizeRequestMode _retval = cast(gtk.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
   * Retrieves the `GtkWidget` using the given `GtkLayoutManager`.
   * Returns: a `GtkWidget`
   */
  gtk.widget.Widget getWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_layout_manager_get_widget(cast(GtkLayoutManager*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Queues a resize on the `GtkWidget` using manager, if any.
   * This function should be called by subclasses of `GtkLayoutManager`
   * in response to changes to their layout management policies.
   */
  void layoutChanged()
  {
    gtk_layout_manager_layout_changed(cast(GtkLayoutManager*)cPtr);
  }

  /**
   * Measures the size of the widget using manager, for the
   * given orientation and size.
   * See the [gtk.widget.Widget] documentation on layout management for
   * more details.
   * Params:
   *   widget = the `GtkWidget` using manager
   *   orientation = the orientation to measure
   *   forSize = Size for the opposite of orientation; for instance, if
   *     the orientation is %GTK_ORIENTATION_HORIZONTAL, this is the height
   *     of the widget; if the orientation is %GTK_ORIENTATION_VERTICAL, this
   *     is the width of the widget. This allows to measure the height for the
   *     given width, and the width for the given height. Use -1 if the size
   *     is not known
   *   minimum = the minimum size for the given size and
   *     orientation
   *   natural = the natural, or preferred size for the
   *     given size and orientation
   *   minimumBaseline = the baseline position for the
   *     minimum size
   *   naturalBaseline = the baseline position for the
   *     natural size
   */
  void measure(gtk.widget.Widget widget, gtk.types.Orientation orientation, int forSize, out int minimum, out int natural, out int minimumBaseline, out int naturalBaseline)
  {
    gtk_layout_manager_measure(cast(GtkLayoutManager*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, orientation, forSize, cast(int*)&minimum, cast(int*)&natural, cast(int*)&minimumBaseline, cast(int*)&naturalBaseline);
  }
}
