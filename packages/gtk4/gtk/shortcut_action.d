module gtk.shortcut_action;

import gid.gid;
import glib.string_;
import glib.variant;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
 * `GtkShortcutAction` encodes an action that can be triggered by a
 * keyboard shortcut.
 * `GtkShortcutActions` contain functions that allow easy presentation
 * to end users as well as being printed for debugging.
 * All `GtkShortcutActions` are immutable, you can only specify their
 * properties during construction. If you want to change a action, you
 * have to replace it with a new one. If you need to pass arguments to
 * an action, these are specified by the higher-level `GtkShortcut` object.
 * To activate a `GtkShortcutAction` manually, [gtk.shortcut_action.ShortcutAction.activate]
 * can be called.
 * GTK provides various actions:
 * - [gtk.mnemonic_action.MnemonicAction]: a shortcut action that calls
 * [gtk.widget.Widget.mnemonicActivate]
 * - [gtk.callback_action.CallbackAction]: a shortcut action that invokes
 * a given callback
 * - [gtk.signal_action.SignalAction]: a shortcut action that emits a
 * given signal
 * - [gtk.activate_action.ActivateAction]: a shortcut action that calls
 * [gtk.widget.Widget.activate]
 * - [gtk.named_action.NamedAction]: a shortcut action that calls
 * [gtk.widget.Widget.activateAction]
 * - [gtk.nothing_action.NothingAction]: a shortcut action that does nothing
 */
class ShortcutAction : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_shortcut_action_get_type != &gidSymbolNotFound ? gtk_shortcut_action_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Tries to parse the given string into an action.
   * On success, the parsed action is returned. When parsing
   * failed, %NULL is returned.
   * The accepted strings are:
   * - `nothing`, for `GtkNothingAction`
   * - `activate`, for `GtkActivateAction`
   * - `mnemonic-activate`, for `GtkMnemonicAction`
   * - `action$(LPAREN)NAME$(RPAREN)`, for a `GtkNamedAction` for the action named `NAME`
   * - `signal$(LPAREN)NAME$(RPAREN)`, for a `GtkSignalAction` for the signal `NAME`
   * Params:
   *   string_ = the string to parse
   * Returns: a new `GtkShortcutAction`
   */
  static gtk.shortcut_action.ShortcutAction parseString(string string_)
  {
    GtkShortcutAction* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = gtk_shortcut_action_parse_string(_string_);
    auto _retval = ObjectG.getDObject!(gtk.shortcut_action.ShortcutAction)(cast(GtkShortcutAction*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Activates the action on the widget with the given args.
   * Note that some actions ignore the passed in flags, widget or args.
   * Activation of an action can fail for various reasons. If the action
   * is not supported by the widget, if the args don't match the action
   * or if the activation otherwise had no effect, %FALSE will be returned.
   * Params:
   *   flags = flags to activate with
   *   widget = Target of the activation
   *   args = arguments to pass
   * Returns: %TRUE if this action was activated successfully
   */
  bool activate(gtk.types.ShortcutActionFlags flags, gtk.widget.Widget widget, glib.variant.VariantG args = null)
  {
    bool _retval;
    _retval = gtk_shortcut_action_activate(cast(GtkShortcutAction*)cPtr, flags, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, args ? cast(VariantC*)args.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Prints the given action into a string for the developer.
   * This is meant for debugging and logging.
   * The form of the representation may change at any time and is
   * not guaranteed to stay identical.
   * Params:
   *   string_ = a `GString` to print into
   */
  void print(glib.string_.String string_)
  {
    gtk_shortcut_action_print(cast(GtkShortcutAction*)cPtr, string_ ? cast(GString*)string_.cPtr(No.Dup) : null);
  }

  /**
   * Prints the given action into a human-readable string.
   * This is a small wrapper around [gtk.shortcut_action.ShortcutAction.print]
   * to help when debugging.
   * Returns: a new string
   */
  string toString_()
  {
    char* _cretval;
    _cretval = gtk_shortcut_action_to_string(cast(GtkShortcutAction*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
