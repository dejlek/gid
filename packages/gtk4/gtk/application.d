module gtk.application;

import gid.gid;
import gio.action_group;
import gio.action_group_mixin;
import gio.action_map;
import gio.action_map_mixin;
import gio.application;
import gio.menu;
import gio.menu_model;
import gio.types;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/**
 * `GtkApplication` is a high-level API for writing applications.
 * It supports many aspects of writing a GTK application in a convenient
 * fashion, without enforcing a one-size-fits-all model.
 * Currently, `GtkApplication` handles GTK initialization, application
 * uniqueness, session management, provides some basic scriptability and
 * desktop shell integration by exporting actions and menus and manages a
 * list of toplevel windows whose life-cycle is automatically tied to the
 * life-cycle of your application.
 * While `GtkApplication` works fine with plain [gtk.window.Window]s, it is
 * recommended to use it together with [gtk.application_window.ApplicationWindow].
 * ## Automatic resources
 * `GtkApplication` will automatically load menus from the `GtkBuilder`
 * resource located at "gtk/menus.ui", relative to the application's
 * resource base path $(LPAREN)see [gio.application.Application.setResourceBasePath]$(RPAREN).
 * The menu with the ID "menubar" is taken as the application's
 * menubar. Additional menus $(LPAREN)most interesting submenus$(RPAREN) can be named
 * and accessed via [gtk.application.Application.getMenuById] which allows for
 * dynamic population of a part of the menu structure.
 * Note that automatic resource loading uses the resource base path
 * that is set at construction time and will not work if the resource
 * base path is changed at a later time.
 * It is also possible to provide the menubar manually using
 * [gtk.application.Application.setMenubar].
 * `GtkApplication` will also automatically setup an icon search path for
 * the default icon theme by appending "icons" to the resource base
 * path. This allows your application to easily store its icons as
 * resources. See [gtk.icon_theme.IconTheme.addResourcePath] for more
 * information.
 * If there is a resource located at `gtk/help-overlay.ui` which
 * defines a [gtk.shortcuts_window.ShortcutsWindow] with ID `help_overlay` then
 * `GtkApplication` associates an instance of this shortcuts window with
 * each [gtk.application_window.ApplicationWindow] and sets up the keyboard accelerator
 * <kbd>Control</kbd>+<kbd>?</kbd> to open it. To create a menu item that
 * displays the shortcuts window, associate the item with the action
 * `win.show-help-overlay`.
 * ## A simple application
 * [A simple example](https://gitlab.gnome.org/GNOME/gtk/tree/main/examples/bp/bloatpad.c)
 * is available in the GTK source code repository
 * `GtkApplication` optionally registers with a session manager of the
 * users session $(LPAREN)if you set the property@Gtk.Application:register-session
 * property$(RPAREN) and offers various functionality related to the session
 * life-cycle.
 * An application can block various ways to end the session with
 * the [gtk.application.Application.inhibit] function. Typical use cases for
 * this kind of inhibiting are long-running, uninterruptible operations,
 * such as burning a CD or performing a disk backup. The session
 * manager may not honor the inhibitor, but it can be expected to
 * inform the user about the negative consequences of ending the
 * session while inhibitors are present.
 * ## See Also
 * [HowDoI: Using GtkApplication](https://wiki.gnome.org/HowDoI/GtkApplication),
 * [Getting Started with GTK: Basics](getting_started.html#basics)
 */
class Application : gio.application.Application
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_application_get_type != &gidSymbolNotFound ? gtk_application_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkApplication` instance.
   * When using `GtkApplication`, it is not necessary to call funcGtk.init
   * manually. It is called as soon as the application gets registered as
   * the primary instance.
   * Concretely, funcGtk.init is called in the default handler for the
   * `GApplication::startup` signal. Therefore, `GtkApplication` subclasses should
   * always chain up in their `GApplication::startup` handler before using any GTK
   * API.
   * Note that commandline arguments are not passed to funcGtk.init.
   * If `application_id` is not %NULL, then it must be valid. See
   * `[gio.application.Application.idIsValid]`.
   * If no application ID is given then some features $(LPAREN)most notably application
   * uniqueness$(RPAREN) will be disabled.
   * Params:
   *   applicationId = The application ID
   *   flags = the application flags
   * Returns: a new `GtkApplication` instance
   */
  this(string applicationId, gio.types.ApplicationFlags flags)
  {
    GtkApplication* _cretval;
    const(char)* _applicationId = applicationId.toCString(No.Alloc);
    _cretval = gtk_application_new(_applicationId, flags);
    this(_cretval, Yes.Take);
  }

  /**
   * Adds a window to `application`.
   * This call can only happen after the `application` has started;
   * typically, you should add new application windows in response
   * to the emission of the `GApplication::activate` signal.
   * This call is equivalent to setting the [gtk.window.Window.Application]
   * property of `window` to `application`.
   * Normally, the connection between the application and the window
   * will remain until the window is destroyed, but you can explicitly
   * remove it with [gtk.application.Application.removeWindow].
   * GTK will keep the `application` running as long as it has
   * any windows.
   * Params:
   *   window = a `GtkWindow`
   */
  void addWindow(gtk.window.Window window)
  {
    gtk_application_add_window(cast(GtkApplication*)cPtr, window ? cast(GtkWindow*)window.cPtr(No.Dup) : null);
  }

  /**
   * Gets the accelerators that are currently associated with
   * the given action.
   * Params:
   *   detailedActionName = a detailed action name, specifying an action
   *     and target to obtain accelerators for
   * Returns: accelerators for `detailed_action_name`
   */
  string[] getAccelsForAction(string detailedActionName)
  {
    char** _cretval;
    const(char)* _detailedActionName = detailedActionName.toCString(No.Alloc);
    _cretval = gtk_application_get_accels_for_action(cast(GtkApplication*)cPtr, _detailedActionName);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /**
   * Returns the list of actions $(LPAREN)possibly empty$(RPAREN) that `accel` maps to.
   * Each item in the list is a detailed action name in the usual form.
   * This might be useful to discover if an accel already exists in
   * order to prevent installation of a conflicting accelerator $(LPAREN)from
   * an accelerator editor or a plugin system, for example$(RPAREN). Note that
   * having more than one action per accelerator may not be a bad thing
   * and might make sense in cases where the actions never appear in the
   * same context.
   * In case there are no actions for a given accelerator, an empty array
   * is returned. `NULL` is never returned.
   * It is a programmer error to pass an invalid accelerator string.
   * If you are unsure, check it with funcGtk.accelerator_parse first.
   * Params:
   *   accel = an accelerator that can be parsed by funcGtk.accelerator_parse
   * Returns: a %NULL-terminated array of actions for `accel`
   */
  string[] getActionsForAccel(string accel)
  {
    char** _cretval;
    const(char)* _accel = accel.toCString(No.Alloc);
    _cretval = gtk_application_get_actions_for_accel(cast(GtkApplication*)cPtr, _accel);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /**
   * Gets the “active” window for the application.
   * The active window is the one that was most recently focused $(LPAREN)within
   * the application$(RPAREN).  This window may not have the focus at the moment
   * if another application has it — this is just the most
   * recently-focused window within this application.
   * Returns: the active window
   */
  gtk.window.Window getActiveWindow()
  {
    GtkWindow* _cretval;
    _cretval = gtk_application_get_active_window(cast(GtkApplication*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets a menu from automatically loaded resources.
   * See [the section on Automatic resources](class.Application.html#automatic-resources)
   * for more information.
   * Params:
   *   id = the id of the menu to look up
   * Returns: Gets the menu with the
   *   given id from the automatically loaded resources
   */
  gio.menu.Menu getMenuById(string id)
  {
    GMenu* _cretval;
    const(char)* _id = id.toCString(No.Alloc);
    _cretval = gtk_application_get_menu_by_id(cast(GtkApplication*)cPtr, _id);
    auto _retval = ObjectG.getDObject!(gio.menu.Menu)(cast(GMenu*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the menu model that has been set with
   * [gtk.application.Application.setMenubar].
   * Returns: the menubar for windows of `application`
   */
  gio.menu_model.MenuModel getMenubar()
  {
    GMenuModel* _cretval;
    _cretval = gtk_application_get_menubar(cast(GtkApplication*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the [gtk.application_window.ApplicationWindow] with the given ID.
   * The ID of a `GtkApplicationWindow` can be retrieved with
   * [gtk.application_window.ApplicationWindow.getId].
   * Params:
   *   id = an identifier number
   * Returns: the window for the given `id`
   */
  gtk.window.Window getWindowById(uint id)
  {
    GtkWindow* _cretval;
    _cretval = gtk_application_get_window_by_id(cast(GtkApplication*)cPtr, id);
    auto _retval = ObjectG.getDObject!(gtk.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets a list of the [gtk.window.Window] instances associated with `application`.
   * The list is sorted by most recently focused window, such that the first
   * element is the currently focused window. $(LPAREN)Useful for choosing a parent
   * for a transient window.$(RPAREN)
   * The list that is returned should not be modified in any way. It will
   * only remain valid until the next focus change or window creation or
   * deletion.
   * Returns: a `GList` of `GtkWindow`
   *   instances
   */
  gtk.window.Window[] getWindows()
  {
    GList* _cretval;
    _cretval = gtk_application_get_windows(cast(GtkApplication*)cPtr);
    auto _retval = gListToD!(gtk.window.Window, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
   * Inform the session manager that certain types of actions should be
   * inhibited.
   * This is not guaranteed to work on all platforms and for all types of
   * actions.
   * Applications should invoke this method when they begin an operation
   * that should not be interrupted, such as creating a CD or DVD. The
   * types of actions that may be blocked are specified by the `flags`
   * parameter. When the application completes the operation it should
   * call [gtk.application.Application.uninhibit] to remove the inhibitor. Note
   * that an application can have multiple inhibitors, and all of them must
   * be individually removed. Inhibitors are also cleared when the
   * application exits.
   * Applications should not expect that they will always be able to block
   * the action. In most cases, users will be given the option to force
   * the action to take place.
   * The `reason` message should be short and to the point.
   * If `window` is given, the session manager may point the user to
   * this window to find out more about why the action is inhibited.
   * Params:
   *   window = a `GtkWindow`
   *   flags = what types of actions should be inhibited
   *   reason = a short, human-readable string that explains
   *     why these operations are inhibited
   * Returns: A non-zero cookie that is used to uniquely identify this
   *   request. It should be used as an argument to [gtk.application.Application.uninhibit]
   *   in order to remove the request. If the platform does not support
   *   inhibiting or the request failed for some reason, 0 is returned.
   */
  uint inhibit(gtk.window.Window window, gtk.types.ApplicationInhibitFlags flags, string reason)
  {
    uint _retval;
    const(char)* _reason = reason.toCString(No.Alloc);
    _retval = gtk_application_inhibit(cast(GtkApplication*)cPtr, window ? cast(GtkWindow*)window.cPtr(No.Dup) : null, flags, _reason);
    return _retval;
  }

  /**
   * Lists the detailed action names which have associated accelerators.
   * See [gtk.application.Application.setAccelsForAction].
   * Returns: the detailed action names
   */
  string[] listActionDescriptions()
  {
    char** _cretval;
    _cretval = gtk_application_list_action_descriptions(cast(GtkApplication*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /**
   * Remove a window from `application`.
   * If `window` belongs to `application` then this call is equivalent to
   * setting the [gtk.window.Window.Application] property of `window` to
   * `NULL`.
   * The application may stop running as a result of a call to this
   * function, if `window` was the last window of the `application`.
   * Params:
   *   window = a `GtkWindow`
   */
  void removeWindow(gtk.window.Window window)
  {
    gtk_application_remove_window(cast(GtkApplication*)cPtr, window ? cast(GtkWindow*)window.cPtr(No.Dup) : null);
  }

  /**
   * Sets zero or more keyboard accelerators that will trigger the
   * given action.
   * The first item in `accels` will be the primary accelerator, which may be
   * displayed in the UI.
   * To remove all accelerators for an action, use an empty, zero-terminated
   * array for `accels`.
   * For the `detailed_action_name`, see `[gio.action.Action.parseDetailedName]` and
   * `[gio.action.Action.printDetailedName]`.
   * Params:
   *   detailedActionName = a detailed action name, specifying an action
   *     and target to associate accelerators with
   *   accels = a list of accelerators in the format
   *     understood by funcGtk.accelerator_parse
   */
  void setAccelsForAction(string detailedActionName, string[] accels)
  {
    const(char)* _detailedActionName = detailedActionName.toCString(No.Alloc);
    char*[] _tmpaccels;
    foreach (s; accels)
      _tmpaccels ~= s.toCString(No.Alloc);
    _tmpaccels ~= null;
    const(char*)* _accels = _tmpaccels.ptr;
    gtk_application_set_accels_for_action(cast(GtkApplication*)cPtr, _detailedActionName, _accels);
  }

  /**
   * Sets or unsets the menubar for windows of `application`.
   * This is a menubar in the traditional sense.
   * This can only be done in the primary instance of the application,
   * after it has been registered. `GApplication::startup` is a good place
   * to call this.
   * Depending on the desktop environment, this may appear at the top of
   * each window, or at the top of the screen.  In some environments, if
   * both the application menu and the menubar are set, the application
   * menu will be presented as if it were the first item of the menubar.
   * Other environments treat the two as completely separate — for example,
   * the application menu may be rendered by the desktop shell while the
   * menubar $(LPAREN)if set$(RPAREN) remains in each individual window.
   * Use the base `GActionMap` interface to add actions, to respond to the
   * user selecting these menu items.
   * Params:
   *   menubar = a `GMenuModel`
   */
  void setMenubar(gio.menu_model.MenuModel menubar)
  {
    gtk_application_set_menubar(cast(GtkApplication*)cPtr, menubar ? cast(GMenuModel*)menubar.cPtr(No.Dup) : null);
  }

  /**
   * Removes an inhibitor that has been previously established.
   * See [gtk.application.Application.inhibit].
   * Inhibitors are also cleared when the application exits.
   * Params:
   *   cookie = a cookie that was returned by [gtk.application.Application.inhibit]
   */
  void uninhibit(uint cookie)
  {
    gtk_application_uninhibit(cast(GtkApplication*)cPtr, cookie);
  }

  /**
   * Emitted when the session manager is about to end the session.
   * This signal is only emitted if propertyGtk.Application:register-session
   * is `TRUE`. Applications can connect to this signal and call
   * [gtk.application.Application.inhibit] with `GTK_APPLICATION_INHIBIT_LOGOUT`
   * to delay the end of the session until state has been saved.
   *   application = the instance the signal is connected to
   */
  alias QueryEndCallbackDlg = void delegate(gtk.application.Application application);
  alias QueryEndCallbackFunc = void function(gtk.application.Application application);

  /**
   * Connect to QueryEnd signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectQueryEnd(T)(T callback, Flag!"After" after = No.After)
  if (is(T : QueryEndCallbackDlg) || is(T : QueryEndCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto application = getVal!(gtk.application.Application)(_paramVals);
      _dClosure.dlg(application);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-end", closure, after);
  }

  /**
   * Emitted when a [gtk.window.Window] is added to `application` through
   * [gtk.application.Application.addWindow].
   * Params
   *   window = the newly-added [gtk.window.Window]
   *   application = the instance the signal is connected to
   */
  alias WindowAddedCallbackDlg = void delegate(gtk.window.Window window, gtk.application.Application application);
  alias WindowAddedCallbackFunc = void function(gtk.window.Window window, gtk.application.Application application);

  /**
   * Connect to WindowAdded signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectWindowAdded(T)(T callback, Flag!"After" after = No.After)
  if (is(T : WindowAddedCallbackDlg) || is(T : WindowAddedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto application = getVal!(gtk.application.Application)(_paramVals);
      auto window = getVal!(gtk.window.Window)(&_paramVals[1]);
      _dClosure.dlg(window, application);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("window-added", closure, after);
  }

  /**
   * Emitted when a [gtk.window.Window] is removed from `application`.
   * This can happen as a side-effect of the window being destroyed
   * or explicitly through [gtk.application.Application.removeWindow].
   * Params
   *   window = the [gtk.window.Window] that is being removed
   *   application = the instance the signal is connected to
   */
  alias WindowRemovedCallbackDlg = void delegate(gtk.window.Window window, gtk.application.Application application);
  alias WindowRemovedCallbackFunc = void function(gtk.window.Window window, gtk.application.Application application);

  /**
   * Connect to WindowRemoved signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectWindowRemoved(T)(T callback, Flag!"After" after = No.After)
  if (is(T : WindowRemovedCallbackDlg) || is(T : WindowRemovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto application = getVal!(gtk.application.Application)(_paramVals);
      auto window = getVal!(gtk.window.Window)(&_paramVals[1]);
      _dClosure.dlg(window, application);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("window-removed", closure, after);
  }
}
