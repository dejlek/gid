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
    A [gtk.shortcut.Shortcut] describes a keyboard shortcut.
  
  It contains a description of how to trigger the shortcut via a
  [gtk.shortcut_trigger.ShortcutTrigger] and a way to activate the shortcut
  on a widget via a [gtk.shortcut_action.ShortcutAction].
  
  The actual work is usually done via [gtk.shortcut_controller.ShortcutController],
  which decides if and when to activate a shortcut. Using that controller
  directly however is rarely necessary as various higher level
  convenience APIs exist on [gtk.widget.Widget]s that make it easier to use
  shortcuts in GTK.
  
  [gtk.shortcut.Shortcut] does provide functionality to make it easy for users
  to work with shortcuts, either by providing informational strings
  for display purposes or by allowing shortcuts to be configured.
*/
class Shortcut : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_shortcut_get_type != &gidSymbolNotFound ? gtk_shortcut_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Shortcut self()
  {
    return this;
  }

  /**
      Creates a new [gtk.shortcut.Shortcut] that is triggered by
    trigger and then activates action.
    Params:
      trigger =       The trigger that will trigger the shortcut
      action =       The action that will be activated upon
           triggering
    Returns:     a new [gtk.shortcut.Shortcut]
  */
  this(gtk.shortcut_trigger.ShortcutTrigger trigger = null, gtk.shortcut_action.ShortcutAction action = null)
  {
    GtkShortcut* _cretval;
    _cretval = gtk_shortcut_new(trigger ? cast(GtkShortcutTrigger*)trigger.cPtr(Yes.Dup) : null, action ? cast(GtkShortcutAction*)action.cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the action that is activated by this shortcut.
    Returns:     the action
  */
  gtk.shortcut_action.ShortcutAction getAction()
  {
    GtkShortcutAction* _cretval;
    _cretval = gtk_shortcut_get_action(cast(GtkShortcut*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.shortcut_action.ShortcutAction)(cast(GtkShortcutAction*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the arguments that are passed when activating the shortcut.
    Returns:     the arguments
  */
  glib.variant.VariantG getArguments()
  {
    VariantC* _cretval;
    _cretval = gtk_shortcut_get_arguments(cast(GtkShortcut*)cPtr);
    auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the trigger used to trigger self.
    Returns:     the trigger used
  */
  gtk.shortcut_trigger.ShortcutTrigger getTrigger()
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_shortcut_get_trigger(cast(GtkShortcut*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.shortcut_trigger.ShortcutTrigger)(cast(GtkShortcutTrigger*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the new action for self to be action.
    Params:
      action =       The new action.
          If the action is null, the nothing action will be used.
  */
  void setAction(gtk.shortcut_action.ShortcutAction action = null)
  {
    gtk_shortcut_set_action(cast(GtkShortcut*)cPtr, action ? cast(GtkShortcutAction*)action.cPtr(Yes.Dup) : null);
  }

  /**
      Sets the arguments to pass when activating the shortcut.
    Params:
      args =       arguments to pass when activating self
  */
  void setArguments(glib.variant.VariantG args = null)
  {
    gtk_shortcut_set_arguments(cast(GtkShortcut*)cPtr, args ? cast(VariantC*)args.cPtr(No.Dup) : null);
  }

  /**
      Sets the new trigger for self to be trigger.
    Params:
      trigger =       The new trigger.
          If the trigger is null, the never trigger will be used.
  */
  void setTrigger(gtk.shortcut_trigger.ShortcutTrigger trigger = null)
  {
    gtk_shortcut_set_trigger(cast(GtkShortcut*)cPtr, trigger ? cast(GtkShortcutTrigger*)trigger.cPtr(Yes.Dup) : null);
  }
}
