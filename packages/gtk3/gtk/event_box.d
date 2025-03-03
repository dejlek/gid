module gtk.event_box;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * The #GtkEventBox widget is a subclass of #GtkBin which also has its
 * own window. It is useful since it allows you to catch events for widgets
 * which do not have their own window.
 */
class EventBox : gtk.bin.Bin
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_event_box_get_type != &gidSymbolNotFound ? gtk_event_box_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new #GtkEventBox.
   * Returns: a new #GtkEventBox
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_event_box_new();
    this(_cretval, No.Take);
  }

  /**
   * Returns whether the event box window is above or below the
   * windows of its child. See [gtk.event_box.EventBox.setAboveChild]
   * for details.
   * Returns: %TRUE if the event box window is above the
   *   window of its child
   */
  bool getAboveChild()
  {
    bool _retval;
    _retval = gtk_event_box_get_above_child(cast(GtkEventBox*)cPtr);
    return _retval;
  }

  /**
   * Returns whether the event box has a visible window.
   * See [gtk.event_box.EventBox.setVisibleWindow] for details.
   * Returns: %TRUE if the event box window is visible
   */
  bool getVisibleWindow()
  {
    bool _retval;
    _retval = gtk_event_box_get_visible_window(cast(GtkEventBox*)cPtr);
    return _retval;
  }

  /**
   * Set whether the event box window is positioned above the windows
   * of its child, as opposed to below it. If the window is above, all
   * events inside the event box will go to the event box. If the window
   * is below, events in windows of child widgets will first got to that
   * widget, and then to its parents.
   * The default is to keep the window below the child.
   * Params:
   *   aboveChild = %TRUE if the event box window is above its child
   */
  void setAboveChild(bool aboveChild)
  {
    gtk_event_box_set_above_child(cast(GtkEventBox*)cPtr, aboveChild);
  }

  /**
   * Set whether the event box uses a visible or invisible child
   * window. The default is to use visible windows.
   * In an invisible window event box, the window that the
   * event box creates is a %GDK_INPUT_ONLY window, which
   * means that it is invisible and only serves to receive
   * events.
   * A visible window event box creates a visible $(LPAREN)%GDK_INPUT_OUTPUT$(RPAREN)
   * window that acts as the parent window for all the widgets
   * contained in the event box.
   * You should generally make your event box invisible if
   * you just want to trap events. Creating a visible window
   * may cause artifacts that are visible to the user, especially
   * if the user is using a theme with gradients or pixmaps.
   * The main reason to create a non input-only event box is if
   * you want to set the background to a different color or
   * draw on it.
   * There is one unexpected issue for an invisible event box that has its
   * window below the child. $(LPAREN)See [gtk.event_box.EventBox.setAboveChild].$(RPAREN)
   * Since the input-only window is not an ancestor window of any windows
   * that descendent widgets of the event box create, events on these
   * windows aren’t propagated up by the windowing system, but only by GTK+.
   * The practical effect of this is if an event isn’t in the event
   * mask for the descendant window $(LPAREN)see [gtk.widget.Widget.addEvents]$(RPAREN),
   * it won’t be received by the event box.
   * This problem doesn’t occur for visible event boxes, because in
   * that case, the event box window is actually the ancestor of the
   * descendant windows, not just at the same place on the screen.
   * Params:
   *   visibleWindow = %TRUE to make the event box have a visible window
   */
  void setVisibleWindow(bool visibleWindow)
  {
    gtk_event_box_set_visible_window(cast(GtkEventBox*)cPtr, visibleWindow);
  }
}
