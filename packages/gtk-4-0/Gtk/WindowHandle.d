module Gtk.WindowHandle;

import GObject.ObjectG;
import Gid.gid;
import Gtk.Accessible;
import Gtk.AccessibleT;
import Gtk.Buildable;
import Gtk.BuildableT;
import Gtk.ConstraintTarget;
import Gtk.ConstraintTargetT;
import Gtk.Types;
import Gtk.Widget;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkWindowHandle` is a titlebar area widget.
 * When added into a window, it can be dragged to move the window, and handles
 * right click, double click and middle click as expected of a titlebar.
 * # CSS nodes
 * `GtkWindowHandle` has a single CSS node with the name `windowhandle`.
 * # Accessibility
 * Until GTK 4.10, `GtkWindowHandle` used the `GTK_ACCESSIBLE_ROLE_GROUP` role.
 * Starting from GTK 4.12, `GtkWindowHandle` uses the `GTK_ACCESSIBLE_ROLE_GENERIC` role.
 */
class WindowHandle : Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gtk_window_handle_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkWindowHandle`.
   * Returns: a new `GtkWindowHandle`.
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_handle_new();
    this(_cretval, No.Take);
  }

  /**
   * Gets the child widget of self.
   * Returns: the child widget of self
   */
  Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_handle_get_child(cast(GtkWindowHandle*)cPtr);
    auto _retval = ObjectG.getDObject!Widget(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets the child widget of self.
   * Params:
   *   child = the child widget
   */
  void setChild(Widget child)
  {
    gtk_window_handle_set_child(cast(GtkWindowHandle*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }
}
