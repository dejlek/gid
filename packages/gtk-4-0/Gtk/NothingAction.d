module Gtk.NothingAction;

import GObject.ObjectG;
import Gid.gid;
import Gtk.ShortcutAction;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * A `GtkShortcutAction` that does nothing.
 */
class NothingAction : ShortcutAction
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_nothing_action_get_type != &gidSymbolNotFound ? gtk_nothing_action_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Gets the nothing action.
   * This is an action that does nothing and where
   * activating it always fails.
   * Returns: The nothing action
   */
  static NothingAction get()
  {
    GtkShortcutAction* _cretval;
    _cretval = gtk_nothing_action_get();
    auto _retval = ObjectG.getDObject!NothingAction(cast(GtkShortcutAction*)_cretval, No.Take);
    return _retval;
  }
}
