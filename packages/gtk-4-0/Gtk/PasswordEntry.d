module Gtk.PasswordEntry;

import GObject.DClosure;
import GObject.ObjectG;
import Gid.gid;
import Gio.MenuModel;
import Gtk.Accessible;
import Gtk.AccessibleT;
import Gtk.Buildable;
import Gtk.BuildableT;
import Gtk.ConstraintTarget;
import Gtk.ConstraintTargetT;
import Gtk.Editable;
import Gtk.EditableT;
import Gtk.Types;
import Gtk.Widget;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkPasswordEntry` is an entry that has been tailored for entering secrets.
 * ![An example GtkPasswordEntry](password-entry.png)
 * It does not show its contents in clear text, does not allow to copy it
 * to the clipboard, and it shows a warning when Caps Lock is engaged. If
 * the underlying platform allows it, `GtkPasswordEntry` will also place
 * the text in a non-pageable memory area, to avoid it being written out
 * to disk by the operating system.
 * Optionally, it can offer a way to reveal the contents in clear text.
 * `GtkPasswordEntry` provides only minimal API and should be used with
 * the [Gtk.Editable] API.
 * # CSS Nodes
 * ```
 * entry.password
 * ╰── text
 * ├── image.caps-lock-indicator
 * ┊
 * ```
 * `GtkPasswordEntry` has a single CSS node with name entry that carries
 * a .passwordstyle class. The text Css node below it has a child with
 * name image and style class .caps-lock-indicator for the Caps Lock
 * icon, and possibly other children.
 * # Accessibility
 * `GtkPasswordEntry` uses the %GTK_ACCESSIBLE_ROLE_TEXT_BOX role.
 */
class PasswordEntry : Widget, Editable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gtk_password_entry_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin EditableT!();

  /**
   * Creates a `GtkPasswordEntry`.
   * Returns: a new `GtkPasswordEntry`
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_password_entry_new();
    this(_cretval, No.Take);
  }

  /**
   * Gets the menu model set with [Gtk.PasswordEntry.setExtraMenu].
   * Returns: the menu model
   */
  MenuModel getExtraMenu()
  {
    GMenuModel* _cretval;
    _cretval = gtk_password_entry_get_extra_menu(cast(GtkPasswordEntry*)cPtr);
    auto _retval = ObjectG.getDObject!MenuModel(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns whether the entry is showing an icon to
   * reveal the contents.
   * Returns: %TRUE if an icon is shown
   */
  bool getShowPeekIcon()
  {
    bool _retval;
    _retval = gtk_password_entry_get_show_peek_icon(cast(GtkPasswordEntry*)cPtr);
    return _retval;
  }

  /**
   * Sets a menu model to add when constructing
   * the context menu for entry.
   * Params:
   *   model = a `GMenuModel`
   */
  void setExtraMenu(MenuModel model)
  {
    gtk_password_entry_set_extra_menu(cast(GtkPasswordEntry*)cPtr, model ? cast(GMenuModel*)model.cPtr(No.Dup) : null);
  }

  /**
   * Sets whether the entry should have a clickable icon
   * to reveal the contents.
   * Setting this to %FALSE also hides the text again.
   * Params:
   *   showPeekIcon = whether to show the peek icon
   */
  void setShowPeekIcon(bool showPeekIcon)
  {
    gtk_password_entry_set_show_peek_icon(cast(GtkPasswordEntry*)cPtr, showPeekIcon);
  }

  /**
   * Emitted when the entry is activated.
   * The keybindings for this signal are all forms of the Enter key.
   *   passwordEntry = the instance the signal is connected to
   */
  alias ActivateCallbackDlg = void delegate(PasswordEntry passwordEntry);
  alias ActivateCallbackFunc = void function(PasswordEntry passwordEntry);

  /**
   * Connect to Activate signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto passwordEntry = getVal!PasswordEntry(_paramVals);
      _dClosure.dlg(passwordEntry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}
