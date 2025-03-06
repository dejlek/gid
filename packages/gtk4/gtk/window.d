module gtk.window;

import gdk.display;
import gdk.monitor;
import gid.gid;
import gio.list_model;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.application;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;
import gtk.widget;
import gtk.window_group;

/**
    A [gtk.window.Window] is a toplevel window which can contain other widgets.
  
  ![An example GtkWindow](window.png)
  
  Windows normally have decorations that are under the control
  of the windowing system and allow the user to manipulate the window
  (resize it, move it, close it,...).
  
  # GtkWindow as GtkBuildable
  
  The [gtk.window.Window] implementation of the [gtk.buildable.Buildable] interface supports
  setting a child as the titlebar by specifying “titlebar” as the “type”
  attribute of a `<child>` element.
  
  # CSS nodes
  
  ```
  window.background [.csd / .solid-csd / .ssd] [.maximized / .fullscreen / .tiled]
  ├── <child>
  ╰── <titlebar child>.titlebar [.default-decoration]
  ```
  
  [gtk.window.Window] has a main CSS node with name window and style class .background.
  
  Style classes that are typically used with the main CSS node are .csd (when
  client-side decorations are in use), .solid-csd (for client-side decorations
  without invisible borders), .ssd (used by mutter when rendering server-side
  decorations). GtkWindow also represents window states with the following
  style classes on the main node: .maximized, .fullscreen, .tiled (when supported,
  also .tiled-top, .tiled-left, .tiled-right, .tiled-bottom).
  
  [gtk.window.Window] subclasses often add their own discriminating style classes,
  such as .dialog, .popup or .tooltip.
  
  Generally, some CSS properties don't make sense on the toplevel window node,
  such as margins or padding. When client-side decorations without invisible
  borders are in use (i.e. the .solid-csd style class is added to the
  main window node), the CSS border of the toplevel window is used for
  resize drags. In the .csd case, the shadow area outside of the window
  can be used to resize it.
  
  [gtk.window.Window] adds the .titlebar and .default-decoration style classes to the
  widget that is added as a titlebar child.
  
  # Accessibility
  
  Until GTK 4.10, [gtk.window.Window] used the [gtk.types.AccessibleRole.Window] role.
  
  Since GTK 4.12, [gtk.window.Window] uses the [gtk.types.AccessibleRole.Application] role.
  
  # Actions
  
  [gtk.window.Window] defines a set of built-in actions:
  $(LIST
    * `default.activate`: Activate the default widget.
    * `window.minimize`: Minimize the window.
    * `window.toggle-maximized`: Maximize or restore the window.
    * `window.close`: Close the window.
  )
*/
class Window : gtk.widget.Widget, gtk.native.Native, gtk.root.Root, gtk.shortcut_manager.ShortcutManager
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_window_get_type != &gidSymbolNotFound ? gtk_window_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin NativeT!();
  mixin RootT!();
  mixin ShortcutManagerT!();

  /**
      Creates a new [gtk.window.Window].
    
    To get an undecorated window (no window borders), use
    [gtk.window.Window.setDecorated].
    
    All top-level windows created by [gtk.window.Window.new_] are stored
    in an internal top-level window list. This list can be obtained
    from [gtk.window.Window.listToplevels]. Due to GTK keeping a
    reference to the window internally, [gtk.window.Window.new_] does not
    return a reference to the caller.
    
    To delete a [gtk.window.Window], call [gtk.window.Window.destroy].
    Returns:     a new [gtk.window.Window].
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_new();
    this(_cretval, No.Take);
  }

  /**
      Returns the fallback icon name for windows.
    
    The returned string is owned by GTK and should not
    be modified. It is only valid until the next call to
    [gtk.window.Window.setDefaultIconName].
    Returns:     the fallback icon name for windows
  */
  static string getDefaultIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_window_get_default_icon_name();
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns a list of all existing toplevel windows.
    
    If you want to iterate through the list and perform actions involving
    callbacks that might destroy the widgets or add new ones, be aware that
    the list of toplevels will change and emit the "items-changed" signal.
    Returns:     the list
        of toplevel widgets
  */
  static gio.list_model.ListModel getToplevels()
  {
    GListModel* _cretval;
    _cretval = gtk_window_get_toplevels();
    auto _retval = ObjectG.getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a list of all existing toplevel windows.
    
    The widgets in the list are not individually referenced.
    If you want to iterate through the list and perform actions
    involving callbacks that might destroy the widgets, you must
    call `g_list_foreach (result, (GFunc)g_object_ref, NULL)` first,
    and then unref all the widgets afterwards.
    Returns:     list of
        toplevel widgets
  */
  static gtk.widget.Widget[] listToplevels()
  {
    GList* _cretval;
    _cretval = gtk_window_list_toplevels();
    auto _retval = gListToD!(gtk.widget.Widget, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Sets whether the window should request startup notification.
    
    By default, after showing the first [gtk.window.Window], GTK calls
    [gdk.toplevel.Toplevel.setStartupId]. Call this function
    to disable the automatic startup notification. You might do this
    if your first window is a splash screen, and you want to delay
    notification until after your real main window has been shown,
    for example.
    
    In that example, you would disable startup notification
    temporarily, show your splash screen, then re-enable it so that
    showing the main window would automatically result in notification.
    Params:
      setting =       true to automatically do startup notification
  */
  static void setAutoStartupNotification(bool setting)
  {
    gtk_window_set_auto_startup_notification(setting);
  }

  /**
      Sets an icon to be used as fallback.
    
    The fallback icon is used for windows that
    haven't had [gtk.window.Window.setIconName]
    called on them.
    Params:
      name =       the name of the themed icon
  */
  static void setDefaultIconName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_window_set_default_icon_name(_name);
  }

  /**
      Opens or closes the [interactive debugger](running.html#interactive-debugging).
    
    The debugger offers access to the widget hierarchy of the application
    and to useful debugging tools.
    Params:
      enable =       true to enable interactive debugging
  */
  static void setInteractiveDebugging(bool enable)
  {
    gtk_window_set_interactive_debugging(enable);
  }

  /**
      Requests that the window is closed.
    
    This is similar to what happens when a window manager
    close button is clicked.
    
    This function can be used with close buttons in custom
    titlebars.
  */
  void close()
  {
    gtk_window_close(cast(GtkWindow*)cPtr);
  }

  /**
      Drop the internal reference GTK holds on toplevel windows.
  */
  void destroy()
  {
    gtk_window_destroy(cast(GtkWindow*)cPtr);
  }

  /**
      Asks to place window in the fullscreen state.
    
    Note that you shouldn’t assume the window is definitely fullscreen
    afterward, because other entities (e.g. the user or window manager)
    unfullscreen it again, and not all window managers honor requests
    to fullscreen windows.
    
    You can track the result of this operation via the
    [gdk.toplevel.Toplevel.ToplevelState] property, or by listening to
    notifications of the [gtk.window.Window.gboolean] property.
  */
  void fullscreen()
  {
    gtk_window_fullscreen(cast(GtkWindow*)cPtr);
  }

  /**
      Asks to place window in the fullscreen state on the given monitor.
    
    Note that you shouldn't assume the window is definitely fullscreen
    afterward, or that the windowing system allows fullscreen windows on
    any given monitor.
    
    You can track the result of this operation via the
    [gdk.toplevel.Toplevel.ToplevelState] property, or by listening to
    notifications of the [gtk.window.Window.gboolean] property.
    Params:
      monitor =       which monitor to go fullscreen on
  */
  void fullscreenOnMonitor(gdk.monitor.MonitorG monitor)
  {
    gtk_window_fullscreen_on_monitor(cast(GtkWindow*)cPtr, monitor ? cast(GdkMonitor*)monitor.cPtr(No.Dup) : null);
  }

  /**
      Gets the [gtk.application.Application] associated with the window.
    Returns:     a [gtk.application.Application]
  */
  gtk.application.Application getApplication()
  {
    GtkApplication* _cretval;
    _cretval = gtk_window_get_application(cast(GtkWindow*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.application.Application)(cast(GtkApplication*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the child widget of window.
    Returns:     the child widget of window
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_get_child(cast(GtkWindow*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the window has been set to have decorations.
    Returns:     true if the window has been set to have decorations
  */
  bool getDecorated()
  {
    bool _retval;
    _retval = gtk_window_get_decorated(cast(GtkWindow*)cPtr);
    return _retval;
  }

  /**
      Gets the default size of the window.
    
    A value of 0 for the width or height indicates that a default
    size has not been explicitly set for that dimension, so the
    “natural” size of the window will be used.
    
    This function is the recommended way for [saving window state
    across restarts of applications](https://developer.gnome.org/documentation/tutorials/save-state.html).
    Params:
      width =       location to store the default width
      height =       location to store the default height
  */
  void getDefaultSize(out int width, out int height)
  {
    gtk_window_get_default_size(cast(GtkWindow*)cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Returns the default widget for window.
    Returns:     the default widget
  */
  gtk.widget.Widget getDefaultWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_get_default_widget(cast(GtkWindow*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the window has been set to have a close button.
    Returns:     true if the window has been set to have a close button
  */
  bool getDeletable()
  {
    bool _retval;
    _retval = gtk_window_get_deletable(cast(GtkWindow*)cPtr);
    return _retval;
  }

  /**
      Returns whether the window will be destroyed with its transient parent.
    Returns:     true if the window will be destroyed with its transient parent.
  */
  bool getDestroyWithParent()
  {
    bool _retval;
    _retval = gtk_window_get_destroy_with_parent(cast(GtkWindow*)cPtr);
    return _retval;
  }

  /**
      Retrieves the current focused widget within the window.
    
    Note that this is the widget that would have the focus
    if the toplevel window focused; if the toplevel window
    is not focused then `gtk_widget_has_focus (widget)` will
    not be true for the widget.
    Returns:     the currently focused widget
  */
  gtk.widget.Widget getFocus()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_get_focus(cast(GtkWindow*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether “focus rectangles” are supposed to be visible.
    Returns:     true if “focus rectangles” are supposed to be visible
        in this window.
  */
  bool getFocusVisible()
  {
    bool _retval;
    _retval = gtk_window_get_focus_visible(cast(GtkWindow*)cPtr);
    return _retval;
  }

  /**
      Returns the group for window.
    
    If the window has no group, then the default group is returned.
    Returns:     the [gtk.window_group.WindowGroup] for a window
        or the default group
  */
  gtk.window_group.WindowGroup getGroup()
  {
    GtkWindowGroup* _cretval;
    _cretval = gtk_window_get_group(cast(GtkWindow*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.window_group.WindowGroup)(cast(GtkWindowGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether this window reacts to F10 key presses by
    activating a menubar it contains.
    Returns:     true if the window handles F10
  */
  bool getHandleMenubarAccel()
  {
    bool _retval;
    _retval = gtk_window_get_handle_menubar_accel(cast(GtkWindow*)cPtr);
    return _retval;
  }

  /**
      Returns whether the window will be hidden when the close button is clicked.
    Returns:     true if the window will be hidden
  */
  bool getHideOnClose()
  {
    bool _retval;
    _retval = gtk_window_get_hide_on_close(cast(GtkWindow*)cPtr);
    return _retval;
  }

  /**
      Returns the name of the themed icon for the window.
    Returns:     the icon name
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_window_get_icon_name(cast(GtkWindow*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether mnemonics are supposed to be visible.
    Returns:     true if mnemonics are supposed to be visible
        in this window.
  */
  bool getMnemonicsVisible()
  {
    bool _retval;
    _retval = gtk_window_get_mnemonics_visible(cast(GtkWindow*)cPtr);
    return _retval;
  }

  /**
      Returns whether the window is modal.
    Returns:     true if the window is set to be modal and
        establishes a grab when shown
  */
  bool getModal()
  {
    bool _retval;
    _retval = gtk_window_get_modal(cast(GtkWindow*)cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.window.Window.setResizable].
    Returns:     true if the user can resize the window
  */
  bool getResizable()
  {
    bool _retval;
    _retval = gtk_window_get_resizable(cast(GtkWindow*)cPtr);
    return _retval;
  }

  /**
      Retrieves the title of the window.
    Returns:     the title of the window
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_window_get_title(cast(GtkWindow*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the custom titlebar that has been set with
    [gtk.window.Window.setTitlebar].
    Returns:     the custom titlebar
  */
  gtk.widget.Widget getTitlebar()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_get_titlebar(cast(GtkWindow*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Fetches the transient parent for this window.
    Returns:     the transient parent for this window
  */
  gtk.window.Window getTransientFor()
  {
    GtkWindow* _cretval;
    _cretval = gtk_window_get_transient_for(cast(GtkWindow*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether window has an explicit window group.
    Returns:     true if window has an explicit window group.
  */
  bool hasGroup()
  {
    bool _retval;
    _retval = gtk_window_has_group(cast(GtkWindow*)cPtr);
    return _retval;
  }

  /**
      Returns whether the window is part of the current active toplevel.
    
    The active toplevel is the window receiving keystrokes.
    
    The return value is true if the window is active toplevel itself.
    You might use this function if you wanted to draw a widget
    differently in an active window from a widget in an inactive window.
    Returns:     true if the window part of the current active window.
  */
  bool isActive()
  {
    bool _retval;
    _retval = gtk_window_is_active(cast(GtkWindow*)cPtr);
    return _retval;
  }

  /**
      Retrieves the current fullscreen state of window.
    
    Note that since fullscreening is ultimately handled by the window
    manager and happens asynchronously to an application request, you
    shouldn’t assume the return value of this function changing
    immediately (or at all), as an effect of calling
    [gtk.window.Window.fullscreen] or [gtk.window.Window.unfullscreen].
    
    If the window isn't yet mapped, the value returned will whether the
    initial requested state is fullscreen.
    Returns:     whether the window has a fullscreen state.
  */
  bool isFullscreen()
  {
    bool _retval;
    _retval = gtk_window_is_fullscreen(cast(GtkWindow*)cPtr);
    return _retval;
  }

  /**
      Retrieves the current maximized state of window.
    
    Note that since maximization is ultimately handled by the window
    manager and happens asynchronously to an application request, you
    shouldn’t assume the return value of this function changing
    immediately (or at all), as an effect of calling
    [gtk.window.Window.maximize] or [gtk.window.Window.unmaximize].
    
    If the window isn't yet mapped, the value returned will whether the
    initial requested state is maximized.
    Returns:     whether the window has a maximized state.
  */
  bool isMaximized()
  {
    bool _retval;
    _retval = gtk_window_is_maximized(cast(GtkWindow*)cPtr);
    return _retval;
  }

  /**
      Retrieves the current suspended state of window.
    
    A window being suspended means it's currently not visible to the user, for
    example by being on a inactive workspace, minimized, obstructed.
    Returns:     whether the window is suspended.
  */
  bool isSuspended()
  {
    bool _retval;
    _retval = gtk_window_is_suspended(cast(GtkWindow*)cPtr);
    return _retval;
  }

  /**
      Asks to maximize window, so that it fills the screen.
    
    Note that you shouldn’t assume the window is definitely maximized
    afterward, because other entities (e.g. the user or window manager)
    could unmaximize it again, and not all window managers support
    maximization.
    
    It’s permitted to call this function before showing a window,
    in which case the window will be maximized when it appears onscreen
    initially.
    
    You can track the result of this operation via the
    [gdk.toplevel.Toplevel.ToplevelState] property, or by listening to
    notifications on the [gtk.window.Window.gboolean]
    property.
  */
  void maximize()
  {
    gtk_window_maximize(cast(GtkWindow*)cPtr);
  }

  /**
      Asks to minimize the specified window.
    
    Note that you shouldn’t assume the window is definitely minimized
    afterward, because the windowing system might not support this
    functionality; other entities (e.g. the user or the window manager)
    could unminimize it again, or there may not be a window manager in
    which case minimization isn’t possible, etc.
    
    It’s permitted to call this function before showing a window,
    in which case the window will be minimized before it ever appears
    onscreen.
    
    You can track result of this operation via the
    [gdk.toplevel.Toplevel.ToplevelState] property.
  */
  void minimize()
  {
    gtk_window_minimize(cast(GtkWindow*)cPtr);
  }

  /**
      Presents a window to the user.
    
    This may mean raising the window in the stacking order,
    unminimizing it, moving it to the current desktop and/or
    giving it the keyboard focus (possibly dependent on the user’s
    platform, window manager and preferences).
    
    If window is hidden, this function also makes it visible.
  */
  void present()
  {
    gtk_window_present(cast(GtkWindow*)cPtr);
  }

  /**
      Presents a window to the user in response to an user interaction.
    
    See [gtk.window.Window.present] for more details.
    
    The timestamp should be gathered when the window was requested
    to be shown (when clicking a link for example), rather than once
    the window is ready to be shown.
    Params:
      timestamp =       the timestamp of the user interaction (typically a
          button or key press event) which triggered this call
  
    Deprecated:     Use [gtk.window.Window.present]
  */
  void presentWithTime(uint timestamp)
  {
    gtk_window_present_with_time(cast(GtkWindow*)cPtr, timestamp);
  }

  /**
      Sets or unsets the [gtk.application.Application] associated with the window.
    
    The application will be kept alive for at least as long as it has
    any windows associated with it (see [gio.application.Application.hold] for a way
    to keep it alive without windows).
    
    Normally, the connection between the application and the window will
    remain until the window is destroyed, but you can explicitly remove
    it by setting the application to null.
    
    This is equivalent to calling [gtk.application.Application.removeWindow]
    and/or [gtk.application.Application.addWindow] on the old/new applications
    as relevant.
    Params:
      application =       a [gtk.application.Application], or null to unset
  */
  void setApplication(gtk.application.Application application = null)
  {
    gtk_window_set_application(cast(GtkWindow*)cPtr, application ? cast(GtkApplication*)application.cPtr(No.Dup) : null);
  }

  /**
      Sets the child widget of window.
    Params:
      child =       the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_window_set_child(cast(GtkWindow*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Sets whether the window should be decorated.
    
    By default, windows are decorated with a title bar, resize
    controls, etc. Some window managers allow GTK to disable these
    decorations, creating a borderless window. If you set the decorated
    property to false using this function, GTK will do its best to
    convince the window manager not to decorate the window. Depending on
    the system, this function may not have any effect when called on a
    window that is already visible, so you should call it before calling
    [gtk.widget.Widget.show].
    
    On Windows, this function always works, since there’s no window manager
    policy involved.
    Params:
      setting =       true to decorate the window
  */
  void setDecorated(bool setting)
  {
    gtk_window_set_decorated(cast(GtkWindow*)cPtr, setting);
  }

  /**
      Sets the default size of a window.
    
    The default size of a window is the size that will be used if no other constraints apply.
    
    The default size will be updated whenever the window is resized
    to reflect the new size, unless the window is forced to a size,
    like when it is maximized or fullscreened.
    
    If the window’s minimum size request is larger than
    the default, the default will be ignored.
    
    Setting the default size to a value <= 0 will cause it to be
    ignored and the natural size request will be used instead. It
    is possible to do this while the window is showing to "reset"
    it to its initial size.
    
    Unlike [gtk.widget.Widget.setSizeRequest], which sets a size
    request for a widget and thus would keep users from shrinking
    the window, this function only sets the initial size, just as
    if the user had resized the window themselves. Users can still
    shrink the window again as they normally would. Setting a default
    size of -1 means to use the “natural” default size (the size request
    of the window).
    
    If you use this function to reestablish a previously saved window size,
    note that the appropriate size to save is the one returned by
    [gtk.window.Window.getDefaultSize]. Using the window allocation
    directly will not work in all circumstances and can lead to growing
    or shrinking windows.
    Params:
      width =       width in pixels, or -1 to unset the default width
      height =       height in pixels, or -1 to unset the default height
  */
  void setDefaultSize(int width, int height)
  {
    gtk_window_set_default_size(cast(GtkWindow*)cPtr, width, height);
  }

  /**
      Sets the default widget.
    
    The default widget is the widget that is activated when the user
    presses Enter in a dialog (for example).
    Params:
      defaultWidget =       widget to be the default
          to unset the default widget for the toplevel
  */
  void setDefaultWidget(gtk.widget.Widget defaultWidget = null)
  {
    gtk_window_set_default_widget(cast(GtkWindow*)cPtr, defaultWidget ? cast(GtkWidget*)defaultWidget.cPtr(No.Dup) : null);
  }

  /**
      Sets whether the window should be deletable.
    
    By default, windows have a close button in the window frame.
    Some  window managers allow GTK to disable this button. If you
    set the deletable property to false using this function, GTK
    will do its best to convince the window manager not to show a
    close button. Depending on the system, this function may not
    have any effect when called on a window that is already visible,
    so you should call it before calling [gtk.widget.Widget.show].
    
    On Windows, this function always works, since there’s no window
    manager policy involved.
    Params:
      setting =       true to decorate the window as deletable
  */
  void setDeletable(bool setting)
  {
    gtk_window_set_deletable(cast(GtkWindow*)cPtr, setting);
  }

  /**
      If setting is true, then destroying the transient parent of window
    will also destroy window itself.
    
    This is useful for dialogs that shouldn’t persist beyond the lifetime
    of the main window they are associated with, for example.
    Params:
      setting =       whether to destroy window with its transient parent
  */
  void setDestroyWithParent(bool setting)
  {
    gtk_window_set_destroy_with_parent(cast(GtkWindow*)cPtr, setting);
  }

  /**
      Sets the [gdk.display.Display] where the window is displayed.
    
    If the window is already mapped, it will be unmapped,
    and then remapped on the new display.
    Params:
      display =       a [gdk.display.Display]
  */
  void setDisplay(gdk.display.Display display)
  {
    gtk_window_set_display(cast(GtkWindow*)cPtr, display ? cast(GdkDisplay*)display.cPtr(No.Dup) : null);
  }

  /**
      Sets the focus widget.
    
    If focus is not the current focus widget, and is focusable,
    sets it as the focus widget for the window. If focus is null,
    unsets the focus widget for this window. To set the focus to a
    particular widget in the toplevel, it is usually more convenient
    to use [gtk.widget.Widget.grabFocus] instead of this function.
    Params:
      focus =       widget to be the new focus widget, or null to unset
          any focus widget for the toplevel window.
  */
  void setFocus(gtk.widget.Widget focus = null)
  {
    gtk_window_set_focus(cast(GtkWindow*)cPtr, focus ? cast(GtkWidget*)focus.cPtr(No.Dup) : null);
  }

  /**
      Sets whether “focus rectangles” are supposed to be visible.
    
    This property is maintained by GTK based on user input,
    and should not be set by applications.
    Params:
      setting =       the new value
  */
  void setFocusVisible(bool setting)
  {
    gtk_window_set_focus_visible(cast(GtkWindow*)cPtr, setting);
  }

  /**
      Sets whether this window should react to F10 key presses
    by activating a menubar it contains.
    Params:
      handleMenubarAccel =       true to make window handle F10
  */
  void setHandleMenubarAccel(bool handleMenubarAccel)
  {
    gtk_window_set_handle_menubar_accel(cast(GtkWindow*)cPtr, handleMenubarAccel);
  }

  /**
      If setting is true, then clicking the close button on the window
    will not destroy it, but only hide it.
    Params:
      setting =       whether to hide the window when it is closed
  */
  void setHideOnClose(bool setting)
  {
    gtk_window_set_hide_on_close(cast(GtkWindow*)cPtr, setting);
  }

  /**
      Sets the icon for the window from a named themed icon.
    
    See the docs for [gtk.icon_theme.IconTheme] for more details.
    On some platforms, the window icon is not used at all.
    
    Note that this has nothing to do with the WM_ICON_NAME
    property which is mentioned in the ICCCM.
    Params:
      name =       the name of the themed icon
  */
  void setIconName(string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_window_set_icon_name(cast(GtkWindow*)cPtr, _name);
  }

  /**
      Sets whether mnemonics are supposed to be visible.
    
    This property is maintained by GTK based on user input,
    and should not be set by applications.
    Params:
      setting =       the new value
  */
  void setMnemonicsVisible(bool setting)
  {
    gtk_window_set_mnemonics_visible(cast(GtkWindow*)cPtr, setting);
  }

  /**
      Sets a window modal or non-modal.
    
    Modal windows prevent interaction with other windows in the same
    application. To keep modal dialogs on top of main application windows,
    use [gtk.window.Window.setTransientFor] to make the dialog transient
    for the parent; most window managers will then disallow lowering the
    dialog below the parent.
    Params:
      modal =       whether the window is modal
  */
  void setModal(bool modal)
  {
    gtk_window_set_modal(cast(GtkWindow*)cPtr, modal);
  }

  /**
      Sets whether the user can resize a window.
    
    Windows are user resizable by default.
    Params:
      resizable =       true if the user can resize this window
  */
  void setResizable(bool resizable)
  {
    gtk_window_set_resizable(cast(GtkWindow*)cPtr, resizable);
  }

  /**
      Sets the startup notification ID.
    
    Startup notification identifiers are used by desktop environment
    to track application startup, to provide user feedback and other
    features. This function changes the corresponding property on the
    underlying [gdk.surface.Surface].
    
    Normally, startup identifier is managed automatically and you should
    only use this function in special cases like transferring focus from
    other processes. You should use this function before calling
    [gtk.window.Window.present] or any equivalent function generating
    a window map event.
    
    This function is only useful on X11, not with other GTK targets.
    Params:
      startupId =       a string with startup-notification identifier
  */
  void setStartupId(string startupId)
  {
    const(char)* _startupId = startupId.toCString(No.Alloc);
    gtk_window_set_startup_id(cast(GtkWindow*)cPtr, _startupId);
  }

  /**
      Sets the title of the [gtk.window.Window].
    
    The title of a window will be displayed in its title bar; on the
    X Window System, the title bar is rendered by the window manager
    so exactly how the title appears to users may vary according to a
    user’s exact configuration. The title should help a user distinguish
    this window from other windows they may have open. A good title might
    include the application name and current document filename, for example.
    
    Passing null does the same as setting the title to an empty string.
    Params:
      title =       title of the window
  */
  void setTitle(string title = null)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_window_set_title(cast(GtkWindow*)cPtr, _title);
  }

  /**
      Sets a custom titlebar for window.
    
    A typical widget used here is [gtk.header_bar.HeaderBar], as it
    provides various features expected of a titlebar while allowing
    the addition of child widgets to it.
    
    If you set a custom titlebar, GTK will do its best to convince
    the window manager not to put its own titlebar on the window.
    Depending on the system, this function may not work for a window
    that is already visible, so you set the titlebar before calling
    [gtk.widget.Widget.show].
    Params:
      titlebar =       the widget to use as titlebar
  */
  void setTitlebar(gtk.widget.Widget titlebar = null)
  {
    gtk_window_set_titlebar(cast(GtkWindow*)cPtr, titlebar ? cast(GtkWidget*)titlebar.cPtr(No.Dup) : null);
  }

  /**
      Dialog windows should be set transient for the main application
    window they were spawned from. This allows window managers to e.g.
    keep the dialog on top of the main window, or center the dialog
    over the main window. [gtk.dialog.Dialog.newWithButtons] and other
    convenience functions in GTK will sometimes call
    [gtk.window.Window.setTransientFor] on your behalf.
    
    Passing null for parent unsets the current transient window.
    
    On Windows, this function puts the child window on top of the parent,
    much as the window manager would have done on X.
    Params:
      parent =       parent window
  */
  void setTransientFor(gtk.window.Window parent = null)
  {
    gtk_window_set_transient_for(cast(GtkWindow*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null);
  }

  /**
      Asks to remove the fullscreen state for window, and return to
    its previous state.
    
    Note that you shouldn’t assume the window is definitely not
    fullscreen afterward, because other entities (e.g. the user or
    window manager) could fullscreen it again, and not all window
    managers honor requests to unfullscreen windows; normally the
    window will end up restored to its normal state. Just don’t
    write code that crashes if not.
    
    You can track the result of this operation via the
    [gdk.toplevel.Toplevel.ToplevelState] property, or by listening to
    notifications of the [gtk.window.Window.gboolean] property.
  */
  void unfullscreen()
  {
    gtk_window_unfullscreen(cast(GtkWindow*)cPtr);
  }

  /**
      Asks to unmaximize window.
    
    Note that you shouldn’t assume the window is definitely unmaximized
    afterward, because other entities (e.g. the user or window manager)
    maximize it again, and not all window managers honor requests to
    unmaximize.
    
    You can track the result of this operation via the
    [gdk.toplevel.Toplevel.ToplevelState] property, or by listening to
    notifications on the [gtk.window.Window.gboolean] property.
  */
  void unmaximize()
  {
    gtk_window_unmaximize(cast(GtkWindow*)cPtr);
  }

  /**
      Asks to unminimize the specified window.
    
    Note that you shouldn’t assume the window is definitely unminimized
    afterward, because the windowing system might not support this
    functionality; other entities (e.g. the user or the window manager)
    could minimize it again, or there may not be a window manager in
    which case minimization isn’t possible, etc.
    
    You can track result of this operation via the
    [gdk.toplevel.Toplevel.ToplevelState] property.
  */
  void unminimize()
  {
    gtk_window_unminimize(cast(GtkWindow*)cPtr);
  }

  /**
      Emitted when the user activates the default widget
    of window.
    
    This is a [keybinding signal](class.SignalAction.html).
  
    ## Parameters
    $(LIST
      * $(B window) the instance the signal is connected to
    )
  */
  alias ActivateDefaultCallbackDlg = void delegate(gtk.window.Window window);

  /** ditto */
  alias ActivateDefaultCallbackFunc = void function(gtk.window.Window window);

  /**
    Connect to ActivateDefault signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivateDefault(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateDefaultCallbackDlg) || is(T : ActivateDefaultCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto window = getVal!(gtk.window.Window)(_paramVals);
      _dClosure.dlg(window);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-default", closure, after);
  }

  /**
      Emitted when the user activates the currently focused
    widget of window.
    
    This is a [keybinding signal](class.SignalAction.html).
  
    ## Parameters
    $(LIST
      * $(B window) the instance the signal is connected to
    )
  */
  alias ActivateFocusCallbackDlg = void delegate(gtk.window.Window window);

  /** ditto */
  alias ActivateFocusCallbackFunc = void function(gtk.window.Window window);

  /**
    Connect to ActivateFocus signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivateFocus(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateFocusCallbackDlg) || is(T : ActivateFocusCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto window = getVal!(gtk.window.Window)(_paramVals);
      _dClosure.dlg(window);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-focus", closure, after);
  }

  /**
      Emitted when the user clicks on the close button of the window.
  
    ## Parameters
    $(LIST
      * $(B window) the instance the signal is connected to
    )
    Returns:     true to stop other handlers from being invoked for the signal
  */
  alias CloseRequestCallbackDlg = bool delegate(gtk.window.Window window);

  /** ditto */
  alias CloseRequestCallbackFunc = bool function(gtk.window.Window window);

  /**
    Connect to CloseRequest signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectCloseRequest(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CloseRequestCallbackDlg) || is(T : CloseRequestCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto window = getVal!(gtk.window.Window)(_paramVals);
      _retval = _dClosure.dlg(window);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("close-request", closure, after);
  }

  /**
      Emitted when the user enables or disables interactive debugging.
    
    When toggle is true, interactive debugging is toggled on or off,
    when it is false, the debugger will be pointed at the widget
    under the pointer.
    
    This is a [keybinding signal](class.SignalAction.html).
    
    The default bindings for this signal are Ctrl-Shift-I
    and Ctrl-Shift-D.
  
    ## Parameters
    $(LIST
      * $(B toggle)       toggle the debugger
      * $(B window) the instance the signal is connected to
    )
    Returns:     true if the key binding was handled
  */
  alias EnableDebuggingCallbackDlg = bool delegate(bool toggle, gtk.window.Window window);

  /** ditto */
  alias EnableDebuggingCallbackFunc = bool function(bool toggle, gtk.window.Window window);

  /**
    Connect to EnableDebugging signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectEnableDebugging(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EnableDebuggingCallbackDlg) || is(T : EnableDebuggingCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto window = getVal!(gtk.window.Window)(_paramVals);
      auto toggle = getVal!(bool)(&_paramVals[1]);
      _retval = _dClosure.dlg(toggle, window);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("enable-debugging", closure, after);
  }

  /**
      emitted when the set of accelerators or mnemonics that
    are associated with window changes.
  
    ## Parameters
    $(LIST
      * $(B window) the instance the signal is connected to
    )
  
    Deprecated:     Use [gtk.shortcut.Shortcut] and [gtk.event_controller.EventController]
      to implement keyboard shortcuts
  */
  alias KeysChangedCallbackDlg = void delegate(gtk.window.Window window);

  /** ditto */
  alias KeysChangedCallbackFunc = void function(gtk.window.Window window);

  /**
    Connect to KeysChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectKeysChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : KeysChangedCallbackDlg) || is(T : KeysChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto window = getVal!(gtk.window.Window)(_paramVals);
      _dClosure.dlg(window);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("keys-changed", closure, after);
  }
}
