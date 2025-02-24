module gtk.shortcut;

import gid.gid;
import glib.variant;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_action;
import gtk.shortcut_trigger;
import gtk.types;

/**
 * A `GtkShortcut` describes a keyboard shortcut.
 * It contains a description of how to trigger the shortcut via a
 * [Gtk.ShortcutTrigger] and a way to activate the shortcut
 * on a widget via a [Gtk.ShortcutAction].
 * The actual work is usually done via [Gtk.ShortcutController],
 * which decides if and when to activate a shortcut. Using that controller
 * directly however is rarely necessary as various higher level
 * convenience APIs exist on `GtkWidget`s that make it easier to use
 * shortcuts in GTK.
 * `GtkShortcut` does provide functionality to make it easy for users
 * to work with shortcuts, either by providing informational strings
 * for display purposes or by allowing shortcuts to be configured.
 */
class Shortcut : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_shortcut_get_type != &gidSymbolNotFound ? gtk_shortcut_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkShortcut` that is triggered by
   * trigger and then activates action.
   * Params:
   *   trigger = The trigger that will trigger the shortcut
   *   action = The action that will be activated upon
   *     triggering
   * Returns: a new `GtkShortcut`
   */
  this(ShortcutTrigger trigger, ShortcutAction action)
  {
    GtkShortcut* _cretval;
    _cretval = gtk_shortcut_new(trigger ? cast(GtkShortcutTrigger*)trigger.cPtr(Yes.Dup) : null, action ? cast(GtkShortcutAction*)action.cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the action that is activated by this shortcut.
   * Returns: the action
   */
  ShortcutAction getAction()
  {
    GtkShortcutAction* _cretval;
    _cretval = gtk_shortcut_get_action(cast(GtkShortcut*)cPtr);
    auto _retval = ObjectG.getDObject!ShortcutAction(cast(GtkShortcutAction*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the arguments that are passed when activating the shortcut.
   * Returns: the arguments
   */
  VariantG getArguments()
  {
    VariantC* _cretval;
    _cretval = gtk_shortcut_get_arguments(cast(GtkShortcut*)cPtr);
    auto _retval = _cretval ? new VariantG(cast(VariantC*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Gets the trigger used to trigger self.
   * Returns: the trigger used
   */
  ShortcutTrigger getTrigger()
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_shortcut_get_trigger(cast(GtkShortcut*)cPtr);
    auto _retval = ObjectG.getDObject!ShortcutTrigger(cast(GtkShortcutTrigger*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets the new action for self to be action.
   * Params:
   *   action = The new action.
   *     If the action is %NULL, the nothing action will be used.
   */
  void setAction(ShortcutAction action)
  {
    gtk_shortcut_set_action(cast(GtkShortcut*)cPtr, action ? cast(GtkShortcutAction*)action.cPtr(Yes.Dup) : null);
  }

  /**
   * Sets the arguments to pass when activating the shortcut.
   * Params:
   *   args = arguments to pass when activating self
   */
  void setArguments(VariantG args)
  {
    gtk_shortcut_set_arguments(cast(GtkShortcut*)cPtr, args ? cast(VariantC*)args.cPtr(No.Dup) : null);
  }

  /**
   * Sets the new trigger for self to be trigger.
   * Params:
   *   trigger = The new trigger.
   *     If the trigger is %NULL, the never trigger will be used.
   */
  void setTrigger(ShortcutTrigger trigger)
  {
    gtk_shortcut_set_trigger(cast(GtkShortcut*)cPtr, trigger ? cast(GtkShortcutTrigger*)trigger.cPtr(Yes.Dup) : null);
  }
}
