module Gtk.ActivateAction;

import GObject.ObjectG;
import Gid.gid;
import Gtk.ShortcutAction;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * A `GtkShortcutAction` that calls [Gtk.Widget.activate].
 */
class ActivateAction : ShortcutAction
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_activate_action_get_type != &gidSymbolNotFound ? gtk_activate_action_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Gets the activate action.
   * This is an action that calls [Gtk.Widget.activate]
   * on the given widget upon activation.
   * Returns: The activate action
   */
  static ActivateAction get()
  {
    GtkShortcutAction* _cretval;
    _cretval = gtk_activate_action_get();
    auto _retval = ObjectG.getDObject!ActivateAction(cast(GtkShortcutAction*)_cretval, No.Take);
    return _retval;
  }
}
