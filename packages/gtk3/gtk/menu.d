module gtk.menu;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.device;
import gdk.event;
import gdk.monitor;
import gdk.rectangle;
import gdk.screen;
import gdk.types;
import gdk.window;
import gid.gid;
import gio.menu_model;
import gobject.dclosure;
import gobject.object;
import gtk.accel_group;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu_shell;
import gtk.types;
import gtk.widget;

/**
    A #GtkMenu is a #GtkMenuShell that implements a drop down menu
  consisting of a list of #GtkMenuItem objects which can be navigated
  and activated by the user to perform application functions.
  
  A #GtkMenu is most commonly dropped down by activating a
  #GtkMenuItem in a #GtkMenuBar or popped up by activating a
  #GtkMenuItem in another #GtkMenu.
  
  A #GtkMenu can also be popped up by activating a #GtkComboBox.
  Other composite widgets such as the #GtkNotebook can pop up a
  #GtkMenu as well.
  
  Applications can display a #GtkMenu as a popup menu by calling the
  [gtk.menu.Menu.popup] function.  The example below shows how an application
  can pop up a menu when the 3rd mouse button is pressed.
  
  ## Connecting the popup signal handler.
  
  ```c
    // connect our handler which will popup the menu
    g_signal_connect_swapped (window, "button_press_event",
  G_CALLBACK (my_popup_handler), menu);
  ```
  
  ## Signal handler which displays a popup menu.
  
  ```c
  static gint
  my_popup_handler (GtkWidget *widget, GdkEvent *event)
  {
    GtkMenu *menu;
    GdkEventButton *event_button;
  
    g_return_val_if_fail (widget != NULL, FALSE);
    g_return_val_if_fail (GTK_IS_MENU (widget), FALSE);
    g_return_val_if_fail (event != NULL, FALSE);
  
    // The "widget" is the menu that was supplied when
    // g_signal_connect_swapped() was called.
    menu = GTK_MENU (widget);
  
    if (event->type == GDK_BUTTON_PRESS)
      {
        event_button = (GdkEventButton *) event;
        if (event_button->button == GDK_BUTTON_SECONDARY)
          {
            gtk_menu_popup (menu, NULL, NULL, NULL, NULL,
                            event_button->button, event_button->time);
            return TRUE;
          }
      }
  
    return FALSE;
  }
  ```
  
  # CSS nodes
  
  ```plain
  menu
  ├── arrow.top
  ├── <child>
  ┊
  ├── <child>
  ╰── arrow.bottom
  ```
  
  The main CSS node of GtkMenu has name menu, and there are two subnodes
  with name arrow, for scrolling menu arrows. These subnodes get the
  .top and .bottom style classes.
*/
class Menu : gtk.menu_shell.MenuShell
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_menu_get_type != &gidSymbolNotFound ? gtk_menu_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new #GtkMenu
    Returns:     a new #GtkMenu
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a #GtkMenu and populates it with menu items and
    submenus according to model.
    
    The created menu items are connected to actions found in the
    #GtkApplicationWindow to which the menu belongs - typically
    by means of being attached to a widget (see [gtk.menu.Menu.attachToWidget])
    that is contained within the #GtkApplicationWindows widget hierarchy.
    
    Actions can also be added using [gtk.widget.Widget.insertActionGroup] on the menu's
    attach widget or on any of its parent widgets.
    Params:
      model =       a #GMenuModel
    Returns:     a new #GtkMenu
  */
  static gtk.menu.Menu newFromModel(gio.menu_model.MenuModel model)
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_new_from_model(model ? cast(GMenuModel*)model.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.menu.Menu)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a list of the menus which are attached to this widget.
    This list is owned by GTK+ and must not be modified.
    Params:
      widget =       a #GtkWidget
    Returns:     the list
          of menus attached to his widget.
  */
  static gtk.widget.Widget[] getForAttachWidget(gtk.widget.Widget widget)
  {
    GList* _cretval;
    _cretval = gtk_menu_get_for_attach_widget(widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
    auto _retval = gListToD!(gtk.widget.Widget, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Adds a new #GtkMenuItem to a (table) menu. The number of “cells” that
    an item will occupy is specified by left_attach, right_attach,
    top_attach and bottom_attach. These each represent the leftmost,
    rightmost, uppermost and lower column and row numbers of the table.
    (Columns and rows are indexed from zero).
    
    Note that this function is not related to [gtk.menu.Menu.detach].
    Params:
      child =       a #GtkMenuItem
      leftAttach =       The column number to attach the left side of the item to
      rightAttach =       The column number to attach the right side of the item to
      topAttach =       The row number to attach the top of the item to
      bottomAttach =       The row number to attach the bottom of the item to
  */
  void attach(gtk.widget.Widget child, uint leftAttach, uint rightAttach, uint topAttach, uint bottomAttach)
  {
    gtk_menu_attach(cast(GtkMenu*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, leftAttach, rightAttach, topAttach, bottomAttach);
  }

  /**
      Detaches the menu from the widget to which it had been attached.
    This function will call the callback function, detacher, provided
    when the [gtk.menu.Menu.attachToWidget] function was called.
  */
  void detach()
  {
    gtk_menu_detach(cast(GtkMenu*)cPtr);
  }

  /**
      Gets the #GtkAccelGroup which holds global accelerators for the
    menu. See [gtk.menu.Menu.setAccelGroup].
    Returns:     the #GtkAccelGroup associated with the menu
  */
  gtk.accel_group.AccelGroup getAccelGroup()
  {
    GtkAccelGroup* _cretval;
    _cretval = gtk_menu_get_accel_group(cast(GtkMenu*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.accel_group.AccelGroup)(cast(GtkAccelGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the accelerator path set on the menu.
    Returns:     the accelerator path set on the menu.
  */
  string getAccelPath()
  {
    const(char)* _cretval;
    _cretval = gtk_menu_get_accel_path(cast(GtkMenu*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the selected menu item from the menu.  This is used by the
    #GtkComboBox.
    Returns:     the #GtkMenuItem that was last selected
               in the menu.  If a selection has not yet been made, the
               first menu item is selected.
  */
  gtk.widget.Widget getActive()
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_get_active(cast(GtkMenu*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GtkWidget that the menu is attached to.
    Returns:     the #GtkWidget that the menu is attached to
  */
  gtk.widget.Widget getAttachWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_get_attach_widget(cast(GtkMenu*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the number of the monitor on which to show the menu.
    Returns:     the number of the monitor on which the menu should
         be popped up or -1, if no monitor has been set
  */
  int getMonitor()
  {
    int _retval;
    _retval = gtk_menu_get_monitor(cast(GtkMenu*)cPtr);
    return _retval;
  }

  /**
      Returns whether the menu reserves space for toggles and
    icons, regardless of their actual presence.
    Returns:     Whether the menu reserves toggle space
  */
  bool getReserveToggleSize()
  {
    bool _retval;
    _retval = gtk_menu_get_reserve_toggle_size(cast(GtkMenu*)cPtr);
    return _retval;
  }

  /**
      Returns whether the menu is torn off.
    See [gtk.menu.Menu.setTearoffState].
    Returns:     true if the menu is currently torn off.
  */
  bool getTearoffState()
  {
    bool _retval;
    _retval = gtk_menu_get_tearoff_state(cast(GtkMenu*)cPtr);
    return _retval;
  }

  /**
      Returns the title of the menu. See [gtk.menu.Menu.setTitle].
    Returns:     the title of the menu, or null if the menu
          has no title set on it. This string is owned by GTK+
          and should not be modified or freed.
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_menu_get_title(cast(GtkMenu*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Places menu on the given monitor.
    Params:
      monitor =       the monitor to place the menu on
  */
  void placeOnMonitor(gdk.monitor.Monitor monitor)
  {
    gtk_menu_place_on_monitor(cast(GtkMenu*)cPtr, monitor ? cast(GdkMonitor*)monitor.cPtr(No.Dup) : null);
  }

  /**
      Removes the menu from the screen.
  */
  void popdown()
  {
    gtk_menu_popdown(cast(GtkMenu*)cPtr);
  }

  /**
      Displays a menu and makes it available for selection.
    
    Applications can use this function to display context-sensitive
    menus, and will typically supply null for the parent_menu_shell,
    parent_menu_item, func and data parameters. The default menu
    positioning function will position the menu at the current mouse
    cursor position.
    
    The button parameter should be the mouse button pressed to initiate
    the menu popup. If the menu popup was initiated by something other
    than a mouse button press, such as a mouse button release or a keypress,
    button should be 0.
    
    The activate_time parameter is used to conflict-resolve initiation
    of concurrent requests for mouse/keyboard grab requests. To function
    properly, this needs to be the timestamp of the user event (such as
    a mouse click or key press) that caused the initiation of the popup.
    Only if no such event is available, [gtk.global.getCurrentEventTime] can
    be used instead.
    
    Note that this function does not work very well on GDK backends that
    do not have global coordinates, such as Wayland or Mir. You should
    probably use one of the gtk_menu_popup_at_ variants, which do not
    have this problem.
    Params:
      parentMenuShell =       the menu shell containing the
            triggering menu item, or null
      parentMenuItem =       the menu item whose activation
            triggered the popup, or null
      func =       a user supplied function used to position
            the menu, or null
      button =       the mouse button which was pressed to initiate the event.
      activateTime =       the time at which the activation event occurred.
  
    Deprecated:     Please use [gtk.menu.Menu.popupAtWidget],
          [gtk.menu.Menu.popupAtPointer]. or [gtk.menu.Menu.popupAtRect] instead
  */
  void popup(gtk.widget.Widget parentMenuShell, gtk.widget.Widget parentMenuItem, gtk.types.MenuPositionFunc func, uint button, uint activateTime)
  {
    extern(C) void _funcCallback(GtkMenu* menu, int* x, int* y, bool* pushIn, void* userData)
    {
      ptrThawGC(userData);
      auto _dlg = cast(gtk.types.MenuPositionFunc*)userData;

      (*_dlg)(ObjectG.getDObject!(gtk.menu.Menu)(cast(void*)menu, No.Take), *x, *y, *pushIn);
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    gtk_menu_popup(cast(GtkMenu*)cPtr, parentMenuShell ? cast(GtkWidget*)parentMenuShell.cPtr(No.Dup) : null, parentMenuItem ? cast(GtkWidget*)parentMenuItem.cPtr(No.Dup) : null, _funcCB, _func, button, activateTime);
  }

  /**
      Displays menu and makes it available for selection.
    
    See gtk_menu_popup_at_widget () to pop up a menu at a widget.
    gtk_menu_popup_at_rect () also allows you to position a menu at an arbitrary
    rectangle.
    
    menu will be positioned at the pointer associated with trigger_event.
    
    Properties that influence the behaviour of this function are
    #GtkMenu:anchor-hints, #GtkMenu:rect-anchor-dx, #GtkMenu:rect-anchor-dy, and
    #GtkMenu:menu-type-hint. Connect to the #GtkMenu::popped-up signal to find
    out how it was actually positioned.
    Params:
      triggerEvent =       the #GdkEvent that initiated this request or
                        null if it's the current event
  */
  void popupAtPointer(gdk.event.Event triggerEvent = null)
  {
    gtk_menu_popup_at_pointer(cast(GtkMenu*)cPtr, triggerEvent ? cast(const(GdkEvent)*)triggerEvent.cPtr : null);
  }

  /**
      Displays menu and makes it available for selection.
    
    See gtk_menu_popup_at_widget () and gtk_menu_popup_at_pointer (), which
    handle more common cases for popping up menus.
    
    menu will be positioned at rect, aligning their anchor points. rect is
    relative to the top-left corner of rect_window. rect_anchor and
    menu_anchor determine anchor points on rect and menu to pin together.
    menu can optionally be offset by #GtkMenu:rect-anchor-dx and
    #GtkMenu:rect-anchor-dy.
    
    Anchors should be specified under the assumption that the text direction is
    left-to-right; they will be flipped horizontally automatically if the text
    direction is right-to-left.
    
    Other properties that influence the behaviour of this function are
    #GtkMenu:anchor-hints and #GtkMenu:menu-type-hint. Connect to the
    #GtkMenu::popped-up signal to find out how it was actually positioned.
    Params:
      rectWindow =       the #GdkWindow rect is relative to
      rect =       the #GdkRectangle to align menu with
      rectAnchor =       the point on rect to align with menu's anchor point
      menuAnchor =       the point on menu to align with rect's anchor point
      triggerEvent =       the #GdkEvent that initiated this request or
                        null if it's the current event
  */
  void popupAtRect(gdk.window.Window rectWindow, gdk.rectangle.Rectangle rect, gdk.types.Gravity rectAnchor, gdk.types.Gravity menuAnchor, gdk.event.Event triggerEvent = null)
  {
    gtk_menu_popup_at_rect(cast(GtkMenu*)cPtr, rectWindow ? cast(GdkWindow*)rectWindow.cPtr(No.Dup) : null, rect ? cast(const(GdkRectangle)*)rect.cPtr(No.Dup) : null, rectAnchor, menuAnchor, triggerEvent ? cast(const(GdkEvent)*)triggerEvent.cPtr : null);
  }

  /**
      Displays menu and makes it available for selection.
    
    See gtk_menu_popup_at_pointer () to pop up a menu at the master pointer.
    gtk_menu_popup_at_rect () also allows you to position a menu at an arbitrary
    rectangle.
    
    ![](popup-anchors.png)
    
    menu will be positioned at widget, aligning their anchor points.
    widget_anchor and menu_anchor determine anchor points on widget and menu
    to pin together. menu can optionally be offset by #GtkMenu:rect-anchor-dx
    and #GtkMenu:rect-anchor-dy.
    
    Anchors should be specified under the assumption that the text direction is
    left-to-right; they will be flipped horizontally automatically if the text
    direction is right-to-left.
    
    Other properties that influence the behaviour of this function are
    #GtkMenu:anchor-hints and #GtkMenu:menu-type-hint. Connect to the
    #GtkMenu::popped-up signal to find out how it was actually positioned.
    Params:
      widget =       the #GtkWidget to align menu with
      widgetAnchor =       the point on widget to align with menu's anchor point
      menuAnchor =       the point on menu to align with widget's anchor point
      triggerEvent =       the #GdkEvent that initiated this request or
                        null if it's the current event
  */
  void popupAtWidget(gtk.widget.Widget widget, gdk.types.Gravity widgetAnchor, gdk.types.Gravity menuAnchor, gdk.event.Event triggerEvent = null)
  {
    gtk_menu_popup_at_widget(cast(GtkMenu*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, widgetAnchor, menuAnchor, triggerEvent ? cast(const(GdkEvent)*)triggerEvent.cPtr : null);
  }

  /**
      Displays a menu and makes it available for selection.
    
    Applications can use this function to display context-sensitive menus,
    and will typically supply null for the parent_menu_shell,
    parent_menu_item, func, data and destroy parameters. The default
    menu positioning function will position the menu at the current position
    of device (or its corresponding pointer).
    
    The button parameter should be the mouse button pressed to initiate
    the menu popup. If the menu popup was initiated by something other than
    a mouse button press, such as a mouse button release or a keypress,
    button should be 0.
    
    The activate_time parameter is used to conflict-resolve initiation of
    concurrent requests for mouse/keyboard grab requests. To function
    properly, this needs to be the time stamp of the user event (such as
    a mouse click or key press) that caused the initiation of the popup.
    Only if no such event is available, [gtk.global.getCurrentEventTime] can
    be used instead.
    
    Note that this function does not work very well on GDK backends that
    do not have global coordinates, such as Wayland or Mir. You should
    probably use one of the gtk_menu_popup_at_ variants, which do not
    have this problem.
    Params:
      device =       a #GdkDevice
      parentMenuShell =       the menu shell containing the triggering
            menu item, or null
      parentMenuItem =       the menu item whose activation triggered
            the popup, or null
      func =       a user supplied function used to position the menu,
            or null
      button =       the mouse button which was pressed to initiate the event
      activateTime =       the time at which the activation event occurred
  
    Deprecated:     Please use [gtk.menu.Menu.popupAtWidget],
          [gtk.menu.Menu.popupAtPointer]. or [gtk.menu.Menu.popupAtRect] instead
  */
  void popupForDevice(gdk.device.Device device, gtk.widget.Widget parentMenuShell, gtk.widget.Widget parentMenuItem, gtk.types.MenuPositionFunc func, uint button, uint activateTime)
  {
    extern(C) void _funcCallback(GtkMenu* menu, int* x, int* y, bool* pushIn, void* userData)
    {
      auto _dlg = cast(gtk.types.MenuPositionFunc*)userData;

      (*_dlg)(ObjectG.getDObject!(gtk.menu.Menu)(cast(void*)menu, No.Take), *x, *y, *pushIn);
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_menu_popup_for_device(cast(GtkMenu*)cPtr, device ? cast(GdkDevice*)device.cPtr(No.Dup) : null, parentMenuShell ? cast(GtkWidget*)parentMenuShell.cPtr(No.Dup) : null, parentMenuItem ? cast(GtkWidget*)parentMenuItem.cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB, button, activateTime);
  }

  /**
      Moves child to a new position in the list of menu
    children.
    Params:
      child =       the #GtkMenuItem to move
      position =       the new position to place child.
            Positions are numbered from 0 to n - 1
  */
  void reorderChild(gtk.widget.Widget child, int position)
  {
    gtk_menu_reorder_child(cast(GtkMenu*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, position);
  }

  /**
      Repositions the menu according to its position function.
  */
  void reposition()
  {
    gtk_menu_reposition(cast(GtkMenu*)cPtr);
  }

  /**
      Set the #GtkAccelGroup which holds global accelerators for the
    menu.  This accelerator group needs to also be added to all windows
    that this menu is being used in with [gtk.window.Window.addAccelGroup],
    in order for those windows to support all the accelerators
    contained in this group.
    Params:
      accelGroup =       the #GtkAccelGroup to be associated
                      with the menu.
  */
  void setAccelGroup(gtk.accel_group.AccelGroup accelGroup = null)
  {
    gtk_menu_set_accel_group(cast(GtkMenu*)cPtr, accelGroup ? cast(GtkAccelGroup*)accelGroup.cPtr(No.Dup) : null);
  }

  alias setAccelPath = gtk.widget.Widget.setAccelPath;

  /**
      Sets an accelerator path for this menu from which accelerator paths
    for its immediate children, its menu items, can be constructed.
    The main purpose of this function is to spare the programmer the
    inconvenience of having to call [gtk.menu_item.MenuItem.setAccelPath] on
    each menu item that should support runtime user changable accelerators.
    Instead, by just calling [gtk.menu.Menu.setAccelPath] on their parent,
    each menu item of this menu, that contains a label describing its
    purpose, automatically gets an accel path assigned.
    
    For example, a menu containing menu items “New” and “Exit”, will, after
    `gtk_menu_set_accel_path (menu, "<Gnumeric-Sheet>/File");` has been
    called, assign its items the accel paths: `"<Gnumeric-Sheet>/File/New"`
    and `"<Gnumeric-Sheet>/File/Exit"`.
    
    Assigning accel paths to menu items then enables the user to change
    their accelerators at runtime. More details about accelerator paths
    and their default setups can be found at [gtk.accel_map.AccelMap.addEntry].
    
    Note that accel_path string will be stored in a #GQuark. Therefore,
    if you pass a static string, you can save some memory by interning
    it first with [glib.global.internStaticString].
    Params:
      accelPath =       a valid accelerator path, or null to unset the path
  */
  void setAccelPath(string accelPath = null)
  {
    const(char)* _accelPath = accelPath.toCString(No.Alloc);
    gtk_menu_set_accel_path(cast(GtkMenu*)cPtr, _accelPath);
  }

  /**
      Selects the specified menu item within the menu.  This is used by
    the #GtkComboBox and should not be used by anyone else.
    Params:
      index =       the index of the menu item to select.  Index values are
                from 0 to n-1
  */
  void setActive(uint index)
  {
    gtk_menu_set_active(cast(GtkMenu*)cPtr, index);
  }

  /**
      Informs GTK+ on which monitor a menu should be popped up.
    See [gdk.monitor.MonitorG.getGeometry].
    
    This function should be called from a #GtkMenuPositionFunc
    if the menu should not appear on the same monitor as the pointer.
    This information can’t be reliably inferred from the coordinates
    returned by a #GtkMenuPositionFunc, since, for very long menus,
    these coordinates may extend beyond the monitor boundaries or even
    the screen boundaries.
    Params:
      monitorNum =       the number of the monitor on which the menu should
           be popped up
  */
  void setMonitor(int monitorNum)
  {
    gtk_menu_set_monitor(cast(GtkMenu*)cPtr, monitorNum);
  }

  /**
      Sets whether the menu should reserve space for drawing toggles
    or icons, regardless of their actual presence.
    Params:
      reserveToggleSize =       whether to reserve size for toggles
  */
  void setReserveToggleSize(bool reserveToggleSize)
  {
    gtk_menu_set_reserve_toggle_size(cast(GtkMenu*)cPtr, reserveToggleSize);
  }

  /**
      Sets the #GdkScreen on which the menu will be displayed.
    Params:
      screen =       a #GdkScreen, or null if the screen should be
                 determined by the widget the menu is attached to
  */
  void setScreen(gdk.screen.Screen screen = null)
  {
    gtk_menu_set_screen(cast(GtkMenu*)cPtr, screen ? cast(GdkScreen*)screen.cPtr(No.Dup) : null);
  }

  /**
      Changes the tearoff state of the menu.  A menu is normally
    displayed as drop down menu which persists as long as the menu is
    active.  It can also be displayed as a tearoff menu which persists
    until it is closed or reattached.
    Params:
      tornOff =       If true, menu is displayed as a tearoff menu.
  */
  void setTearoffState(bool tornOff)
  {
    gtk_menu_set_tearoff_state(cast(GtkMenu*)cPtr, tornOff);
  }

  /**
      Sets the title string for the menu.
    
    The title is displayed when the menu is shown as a tearoff
    menu. If title is null, the menu will see if it is attached
    to a parent menu item, and if so it will try to use the same
    text as that menu item’s label.
    Params:
      title =       a string containing the title for the menu, or null to
          inherit the title of the parent menu item, if any
  */
  void setTitle(string title = null)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_menu_set_title(cast(GtkMenu*)cPtr, _title);
  }

  /** */
  alias MoveScrollCallbackDlg = void delegate(gtk.types.ScrollType scrollType, gtk.menu.Menu menu);

  /** ditto */
  alias MoveScrollCallbackFunc = void function(gtk.types.ScrollType scrollType, gtk.menu.Menu menu);

  /**
    Connect to MoveScroll signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMoveScroll(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveScrollCallbackDlg) || is(T : MoveScrollCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto menu = getVal!(gtk.menu.Menu)(_paramVals);
      auto scrollType = getVal!(gtk.types.ScrollType)(&_paramVals[1]);
      _dClosure.dlg(scrollType, menu);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-scroll", closure, after);
  }

  /**
      Emitted when the position of menu is finalized after being popped up
    using gtk_menu_popup_at_rect (), gtk_menu_popup_at_widget (), or
    gtk_menu_popup_at_pointer ().
    
    menu might be flipped over the anchor rectangle in order to keep it
    on-screen, in which case flipped_x and flipped_y will be set to true
    accordingly.
    
    flipped_rect is the ideal position of menu after any possible flipping,
    but before any possible sliding. final_rect is flipped_rect, but possibly
    translated in the case that flipping is still ineffective in keeping menu
    on-screen.
    
    ![](popup-slide.png)
    
    The blue menu is menu's ideal position, the green menu is flipped_rect,
    and the red menu is final_rect.
    
    See gtk_menu_popup_at_rect (), gtk_menu_popup_at_widget (),
    gtk_menu_popup_at_pointer (), #GtkMenu:anchor-hints,
    #GtkMenu:rect-anchor-dx, #GtkMenu:rect-anchor-dy, and
    #GtkMenu:menu-type-hint.
  
    ## Parameters
    $(LIST
      * $(B flippedRect)       the position of menu after any possible
                       flipping or null if the backend can't obtain it
      * $(B finalRect)       the final position of menu or null if the
                     backend can't obtain it
      * $(B flippedX)       true if the anchors were flipped horizontally
      * $(B flippedY)       true if the anchors were flipped vertically
      * $(B menu) the instance the signal is connected to
    )
  */
  alias PoppedUpCallbackDlg = void delegate(void* flippedRect, void* finalRect, bool flippedX, bool flippedY, gtk.menu.Menu menu);

  /** ditto */
  alias PoppedUpCallbackFunc = void function(void* flippedRect, void* finalRect, bool flippedX, bool flippedY, gtk.menu.Menu menu);

  /**
    Connect to PoppedUp signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPoppedUp(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PoppedUpCallbackDlg) || is(T : PoppedUpCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto menu = getVal!(gtk.menu.Menu)(_paramVals);
      auto flippedRect = getVal!(void*)(&_paramVals[1]);
      auto finalRect = getVal!(void*)(&_paramVals[2]);
      auto flippedX = getVal!(bool)(&_paramVals[3]);
      auto flippedY = getVal!(bool)(&_paramVals[4]);
      _dClosure.dlg(flippedRect, finalRect, flippedX, flippedY, menu);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("popped-up", closure, after);
  }
}
