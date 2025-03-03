module gtk.menu_shell;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gio.menu_model;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.menu_item;
import gtk.types;
import gtk.widget;

/**
 * A #GtkMenuShell is the abstract base class used to derive the
 * #GtkMenu and #GtkMenuBar subclasses.
 * A #GtkMenuShell is a container of #GtkMenuItem objects arranged
 * in a list which can be navigated, selected, and activated by the
 * user to perform application functions. A #GtkMenuItem can have a
 * submenu associated with it, allowing for nested hierarchical menus.
 * # Terminology
 * A menu item can be “selected”, this means that it is displayed
 * in the prelight state, and if it has a submenu, that submenu
 * will be popped up.
 * A menu is “active” when it is visible onscreen and the user
 * is selecting from it. A menubar is not active until the user
 * clicks on one of its menuitems. When a menu is active,
 * passing the mouse over a submenu will pop it up.
 * There is also is a concept of the current menu and a current
 * menu item. The current menu item is the selected menu item
 * that is furthest down in the hierarchy. $(LPAREN)Every active menu shell
 * does not necessarily contain a selected menu item, but if
 * it does, then the parent menu shell must also contain
 * a selected menu item.$(RPAREN) The current menu is the menu that
 * contains the current menu item. It will always have a GTK
 * grab and receive all key presses.
 */
class MenuShell : gtk.container.Container
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_menu_shell_get_type != &gidSymbolNotFound ? gtk_menu_shell_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Activates the menu item within the menu shell.
   * Params:
   *   menuItem = the #GtkMenuItem to activate
   *   forceDeactivate = if %TRUE, force the deactivation of the
   *     menu shell after the menu item is activated
   */
  void activateItem(gtk.widget.Widget menuItem, bool forceDeactivate)
  {
    gtk_menu_shell_activate_item(cast(GtkMenuShell*)cPtr, menuItem ? cast(GtkWidget*)menuItem.cPtr(No.Dup) : null, forceDeactivate);
  }

  /**
   * Adds a new #GtkMenuItem to the end of the menu shell's
   * item list.
   * Params:
   *   child = The #GtkMenuItem to add
   */
  void append(gtk.menu_item.MenuItem child)
  {
    gtk_menu_shell_append(cast(GtkMenuShell*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
   * Establishes a binding between a #GtkMenuShell and a #GMenuModel.
   * The contents of shell are removed and then refilled with menu items
   * according to model.  When model changes, shell is updated.
   * Calling this function twice on shell with different model will
   * cause the first binding to be replaced with a binding to the new
   * model. If model is %NULL then any previous binding is undone and
   * all children are removed.
   * with_separators determines if toplevel items $(LPAREN)eg: sections$(RPAREN) have
   * separators inserted between them.  This is typically desired for
   * menus but doesn’t make sense for menubars.
   * If action_namespace is non-%NULL then the effect is as if all
   * actions mentioned in the model have their names prefixed with the
   * namespace, plus a dot.  For example, if the action “quit” is
   * mentioned and action_namespace is “app” then the effective action
   * name is “app.quit”.
   * This function uses #GtkActionable to define the action name and
   * target values on the created menu items.  If you want to use an
   * action group other than “app” and “win”, or if you want to use a
   * #GtkMenuShell outside of a #GtkApplicationWindow, then you will need
   * to attach your own action group to the widget hierarchy using
   * [gtk.widget.Widget.insertActionGroup].  As an example, if you created a
   * group with a “quit” action and inserted it with the name “mygroup”
   * then you would use the action name “mygroup.quit” in your
   * #GMenuModel.
   * For most cases you are probably better off using
   * [gtk.menu.Menu.newFromModel] or [gtk.menu_bar.MenuBar.newFromModel] or just
   * directly passing the #GMenuModel to [gtk.application.Application.setAppMenu] or
   * [gtk.application.Application.setMenubar].
   * Params:
   *   model = the #GMenuModel to bind to or %NULL to remove
   *     binding
   *   actionNamespace = the namespace for actions in model
   *   withSeparators = %TRUE if toplevel items in shell should have
   *     separators between them
   */
  void bindModel(gio.menu_model.MenuModel model, string actionNamespace, bool withSeparators)
  {
    const(char)* _actionNamespace = actionNamespace.toCString(No.Alloc);
    gtk_menu_shell_bind_model(cast(GtkMenuShell*)cPtr, model ? cast(GMenuModel*)model.cPtr(No.Dup) : null, _actionNamespace, withSeparators);
  }

  /**
   * Cancels the selection within the menu shell.
   */
  void cancel()
  {
    gtk_menu_shell_cancel(cast(GtkMenuShell*)cPtr);
  }

  /**
   * Deactivates the menu shell.
   * Typically this results in the menu shell being erased
   * from the screen.
   */
  void deactivate()
  {
    gtk_menu_shell_deactivate(cast(GtkMenuShell*)cPtr);
  }

  /**
   * Deselects the currently selected item from the menu shell,
   * if any.
   */
  void deselect()
  {
    gtk_menu_shell_deselect(cast(GtkMenuShell*)cPtr);
  }

  /**
   * Gets the parent menu shell.
   * The parent menu shell of a submenu is the #GtkMenu or #GtkMenuBar
   * from which it was opened up.
   * Returns: the parent #GtkMenuShell
   */
  gtk.widget.Widget getParentShell()
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_shell_get_parent_shell(cast(GtkMenuShell*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the currently selected item.
   * Returns: the currently selected item
   */
  gtk.widget.Widget getSelectedItem()
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_shell_get_selected_item(cast(GtkMenuShell*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns %TRUE if the menu shell will take the keyboard focus on popup.
   * Returns: %TRUE if the menu shell will take the keyboard focus on popup.
   */
  bool getTakeFocus()
  {
    bool _retval;
    _retval = gtk_menu_shell_get_take_focus(cast(GtkMenuShell*)cPtr);
    return _retval;
  }

  /**
   * Adds a new #GtkMenuItem to the menu shell’s item list
   * at the position indicated by position.
   * Params:
   *   child = The #GtkMenuItem to add
   *   position = The position in the item list where child
   *     is added. Positions are numbered from 0 to n-1
   */
  void insert(gtk.widget.Widget child, int position)
  {
    gtk_menu_shell_insert(cast(GtkMenuShell*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, position);
  }

  /**
   * Adds a new #GtkMenuItem to the beginning of the menu shell's
   * item list.
   * Params:
   *   child = The #GtkMenuItem to add
   */
  void prepend(gtk.widget.Widget child)
  {
    gtk_menu_shell_prepend(cast(GtkMenuShell*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
   * Select the first visible or selectable child of the menu shell;
   * don’t select tearoff items unless the only item is a tearoff
   * item.
   * Params:
   *   searchSensitive = if %TRUE, search for the first selectable
   *     menu item, otherwise select nothing if
   *     the first item isn’t sensitive. This
   *     should be %FALSE if the menu is being
   *     popped up initially.
   */
  void selectFirst(bool searchSensitive)
  {
    gtk_menu_shell_select_first(cast(GtkMenuShell*)cPtr, searchSensitive);
  }

  /**
   * Selects the menu item from the menu shell.
   * Params:
   *   menuItem = The #GtkMenuItem to select
   */
  void selectItem(gtk.widget.Widget menuItem)
  {
    gtk_menu_shell_select_item(cast(GtkMenuShell*)cPtr, menuItem ? cast(GtkWidget*)menuItem.cPtr(No.Dup) : null);
  }

  /**
   * If take_focus is %TRUE $(LPAREN)the default$(RPAREN) the menu shell will take
   * the keyboard focus so that it will receive all keyboard events
   * which is needed to enable keyboard navigation in menus.
   * Setting take_focus to %FALSE is useful only for special applications
   * like virtual keyboard implementations which should not take keyboard
   * focus.
   * The take_focus state of a menu or menu bar is automatically
   * propagated to submenus whenever a submenu is popped up, so you
   * don’t have to worry about recursively setting it for your entire
   * menu hierarchy. Only when programmatically picking a submenu and
   * popping it up manually, the take_focus property of the submenu
   * needs to be set explicitly.
   * Note that setting it to %FALSE has side-effects:
   * If the focus is in some other app, it keeps the focus and keynav in
   * the menu doesn’t work. Consequently, keynav on the menu will only
   * work if the focus is on some toplevel owned by the onscreen keyboard.
   * To avoid confusing the user, menus with take_focus set to %FALSE
   * should not display mnemonics or accelerators, since it cannot be
   * guaranteed that they will work.
   * See also [gdk.global.keyboardGrab]
   * Params:
   *   takeFocus = %TRUE if the menu shell should take the keyboard
   *     focus on popup
   */
  void setTakeFocus(bool takeFocus)
  {
    gtk_menu_shell_set_take_focus(cast(GtkMenuShell*)cPtr, takeFocus);
  }

  /**
   * An action signal that activates the current menu item within
   * the menu shell.
   * Params
   *   forceHide = if %TRUE, hide the menu after activating the menu item
   *   menuShell = the instance the signal is connected to
   */
  alias ActivateCurrentCallbackDlg = void delegate(bool forceHide, gtk.menu_shell.MenuShell menuShell);
  alias ActivateCurrentCallbackFunc = void function(bool forceHide, gtk.menu_shell.MenuShell menuShell);

  /**
   * Connect to ActivateCurrent signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectActivateCurrent(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCurrentCallbackDlg) || is(T : ActivateCurrentCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto menuShell = getVal!(gtk.menu_shell.MenuShell)(_paramVals);
      auto forceHide = getVal!(bool)(&_paramVals[1]);
      _dClosure.dlg(forceHide, menuShell);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-current", closure, after);
  }

  /**
   * An action signal which cancels the selection within the menu shell.
   * Causes the #GtkMenuShell::selection-done signal to be emitted.
   *   menuShell = the instance the signal is connected to
   */
  alias CancelCallbackDlg = void delegate(gtk.menu_shell.MenuShell menuShell);
  alias CancelCallbackFunc = void function(gtk.menu_shell.MenuShell menuShell);

  /**
   * Connect to Cancel signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectCancel(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CancelCallbackDlg) || is(T : CancelCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto menuShell = getVal!(gtk.menu_shell.MenuShell)(_paramVals);
      _dClosure.dlg(menuShell);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cancel", closure, after);
  }

  /**
   * A keybinding signal which moves the focus in the
   * given direction.
   * Params
   *   direction = the direction to cycle in
   *   menuShell = the instance the signal is connected to
   */
  alias CycleFocusCallbackDlg = void delegate(gtk.types.DirectionType direction, gtk.menu_shell.MenuShell menuShell);
  alias CycleFocusCallbackFunc = void function(gtk.types.DirectionType direction, gtk.menu_shell.MenuShell menuShell);

  /**
   * Connect to CycleFocus signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectCycleFocus(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CycleFocusCallbackDlg) || is(T : CycleFocusCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto menuShell = getVal!(gtk.menu_shell.MenuShell)(_paramVals);
      auto direction = getVal!(gtk.types.DirectionType)(&_paramVals[1]);
      _dClosure.dlg(direction, menuShell);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cycle-focus", closure, after);
  }

  /**
   * This signal is emitted when a menu shell is deactivated.
   *   menuShell = the instance the signal is connected to
   */
  alias DeactivateCallbackDlg = void delegate(gtk.menu_shell.MenuShell menuShell);
  alias DeactivateCallbackFunc = void function(gtk.menu_shell.MenuShell menuShell);

  /**
   * Connect to Deactivate signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDeactivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DeactivateCallbackDlg) || is(T : DeactivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto menuShell = getVal!(gtk.menu_shell.MenuShell)(_paramVals);
      _dClosure.dlg(menuShell);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("deactivate", closure, after);
  }

  /**
   * The ::insert signal is emitted when a new #GtkMenuItem is added to
   * a #GtkMenuShell.  A separate signal is used instead of
   * GtkContainer::add because of the need for an additional position
   * parameter.
   * The inverse of this signal is the GtkContainer::removed signal.
   * Params
   *   child = the #GtkMenuItem that is being inserted
   *   position = the position at which the insert occurs
   *   menuShell = the instance the signal is connected to
   */
  alias InsertCallbackDlg = void delegate(gtk.widget.Widget child, int position, gtk.menu_shell.MenuShell menuShell);
  alias InsertCallbackFunc = void function(gtk.widget.Widget child, int position, gtk.menu_shell.MenuShell menuShell);

  /**
   * Connect to Insert signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectInsert(T)(T callback, Flag!"After" after = No.After)
  if (is(T : InsertCallbackDlg) || is(T : InsertCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto menuShell = getVal!(gtk.menu_shell.MenuShell)(_paramVals);
      auto child = getVal!(gtk.widget.Widget)(&_paramVals[1]);
      auto position = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(child, position, menuShell);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("insert", closure, after);
  }

  /**
   * An keybinding signal which moves the current menu item
   * in the direction specified by direction.
   * Params
   *   direction = the direction to move
   *   menuShell = the instance the signal is connected to
   */
  alias MoveCurrentCallbackDlg = void delegate(gtk.types.MenuDirectionType direction, gtk.menu_shell.MenuShell menuShell);
  alias MoveCurrentCallbackFunc = void function(gtk.types.MenuDirectionType direction, gtk.menu_shell.MenuShell menuShell);

  /**
   * Connect to MoveCurrent signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMoveCurrent(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveCurrentCallbackDlg) || is(T : MoveCurrentCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto menuShell = getVal!(gtk.menu_shell.MenuShell)(_paramVals);
      auto direction = getVal!(gtk.types.MenuDirectionType)(&_paramVals[1]);
      _dClosure.dlg(direction, menuShell);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-current", closure, after);
  }

  /**
   * The ::move-selected signal is emitted to move the selection to
   * another item.
   * Params
   *   distance = +1 to move to the next item, -1 to move to the previous
   *   menuShell = the instance the signal is connected to
   * Returns: %TRUE to stop the signal emission, %FALSE to continue
   */
  alias MoveSelectedCallbackDlg = bool delegate(int distance, gtk.menu_shell.MenuShell menuShell);
  alias MoveSelectedCallbackFunc = bool function(int distance, gtk.menu_shell.MenuShell menuShell);

  /**
   * Connect to MoveSelected signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMoveSelected(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveSelectedCallbackDlg) || is(T : MoveSelectedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto menuShell = getVal!(gtk.menu_shell.MenuShell)(_paramVals);
      auto distance = getVal!(int)(&_paramVals[1]);
      _retval = _dClosure.dlg(distance, menuShell);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-selected", closure, after);
  }

  /**
   * This signal is emitted when a selection has been
   * completed within a menu shell.
   *   menuShell = the instance the signal is connected to
   */
  alias SelectionDoneCallbackDlg = void delegate(gtk.menu_shell.MenuShell menuShell);
  alias SelectionDoneCallbackFunc = void function(gtk.menu_shell.MenuShell menuShell);

  /**
   * Connect to SelectionDone signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectSelectionDone(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SelectionDoneCallbackDlg) || is(T : SelectionDoneCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto menuShell = getVal!(gtk.menu_shell.MenuShell)(_paramVals);
      _dClosure.dlg(menuShell);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-done", closure, after);
  }
}
