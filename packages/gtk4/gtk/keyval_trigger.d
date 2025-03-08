module gtk.keyval_trigger;

import gdk.types;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_trigger;
import gtk.types;

/**
    A [gtk.shortcut_trigger.ShortcutTrigger] that triggers when a specific keyval and modifiers are pressed.
*/
class KeyvalTrigger : gtk.shortcut_trigger.ShortcutTrigger
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_keyval_trigger_get_type != &gidSymbolNotFound ? gtk_keyval_trigger_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a [gtk.shortcut_trigger.ShortcutTrigger] that will trigger whenever
    the key with the given keyval and modifiers is pressed.
    Params:
      keyval =       The keyval to trigger for
      modifiers =       the modifiers that need to be present
    Returns:     A new [gtk.shortcut_trigger.ShortcutTrigger]
  */
  this(uint keyval, gdk.types.ModifierType modifiers)
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_keyval_trigger_new(keyval, modifiers);
    this(_cretval, Yes.take);
  }

  /**
      Gets the keyval that must be pressed to succeed
    triggering self.
    Returns:     the keyval
  */
  uint getKeyval()
  {
    uint _retval;
    _retval = gtk_keyval_trigger_get_keyval(cast(GtkKeyvalTrigger*)cPtr);
    return _retval;
  }

  /**
      Gets the modifiers that must be present to succeed
    triggering self.
    Returns:     the modifiers
  */
  gdk.types.ModifierType getModifiers()
  {
    GdkModifierType _cretval;
    _cretval = gtk_keyval_trigger_get_modifiers(cast(GtkKeyvalTrigger*)cPtr);
    gdk.types.ModifierType _retval = cast(gdk.types.ModifierType)_cretval;
    return _retval;
  }
}
