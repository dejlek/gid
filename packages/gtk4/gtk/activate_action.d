module gtk.activate_action;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_action;
import gtk.types;

/**
    A [gtk.shortcut_action.ShortcutAction] that calls [gtk.widget.Widget.activate].
*/
class ActivateAction : gtk.shortcut_action.ShortcutAction
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_activate_action_get_type != &gidSymbolNotFound ? gtk_activate_action_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override ActivateAction self()
  {
    return this;
  }

  /**
      Gets the activate action.
    
    This is an action that calls [gtk.widget.Widget.activate]
    on the given widget upon activation.
    Returns:     The activate action
  */
  static gtk.activate_action.ActivateAction get()
  {
    GtkShortcutAction* _cretval;
    _cretval = gtk_activate_action_get();
    auto _retval = ObjectG.getDObject!(gtk.activate_action.ActivateAction)(cast(GtkShortcutAction*)_cretval, No.Take);
    return _retval;
  }
}
