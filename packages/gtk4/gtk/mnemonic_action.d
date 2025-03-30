/// Module for [MnemonicAction] class
module gtk.mnemonic_action;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_action;
import gtk.types;

/**
    A [gtk.shortcut_action.ShortcutAction] that calls [gtk.widget.Widget.mnemonicActivate].
*/
class MnemonicAction : gtk.shortcut_action.ShortcutAction
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
    return cast(void function())gtk_mnemonic_action_get_type != &gidSymbolNotFound ? gtk_mnemonic_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override MnemonicAction self()
  {
    return this;
  }

  /**
      Gets the mnemonic action.
      
      This is an action that calls [gtk.widget.Widget.mnemonicActivate]
      on the given widget upon activation.
      Returns: The mnemonic action
  */
  static gtk.mnemonic_action.MnemonicAction get()
  {
    GtkShortcutAction* _cretval;
    _cretval = gtk_mnemonic_action_get();
    auto _retval = ObjectG.getDObject!(gtk.mnemonic_action.MnemonicAction)(cast(GtkShortcutAction*)_cretval, No.Take);
    return _retval;
  }
}
