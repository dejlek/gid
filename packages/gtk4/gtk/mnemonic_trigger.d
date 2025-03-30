/// Module for [MnemonicTrigger] class
module gtk.mnemonic_trigger;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_trigger;
import gtk.types;

/**
    A [gtk.shortcut_trigger.ShortcutTrigger] that triggers when a specific mnemonic is pressed.
    
    Mnemonics require a *mnemonic modifier* (typically <kbd>Alt</kbd>) to be
    pressed together with the mnemonic key.
*/
class MnemonicTrigger : gtk.shortcut_trigger.ShortcutTrigger
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_mnemonic_trigger_get_type != &gidSymbolNotFound ? gtk_mnemonic_trigger_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override MnemonicTrigger self()
  {
    return this;
  }

  /**
      Creates a [gtk.shortcut_trigger.ShortcutTrigger] that will trigger whenever the key with
      the given keyval is pressed and mnemonics have been activated.
      
      Mnemonics are activated by calling code when a key event with the right
      modifiers is detected.
  
      Params:
        keyval = The keyval to trigger for
      Returns: A new [gtk.shortcut_trigger.ShortcutTrigger]
  */
  this(uint keyval)
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_mnemonic_trigger_new(keyval);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the keyval that must be pressed to succeed triggering self.
      Returns: the keyval
  */
  uint getKeyval()
  {
    uint _retval;
    _retval = gtk_mnemonic_trigger_get_keyval(cast(GtkMnemonicTrigger*)cPtr);
    return _retval;
  }
}
