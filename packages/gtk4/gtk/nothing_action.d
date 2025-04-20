/// Module for [NothingAction] class
module gtk.nothing_action;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_action;
import gtk.types;

/**
    A [gtk.shortcut_action.ShortcutAction] that does nothing.
*/
class NothingAction : gtk.shortcut_action.ShortcutAction
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
    return cast(void function())gtk_nothing_action_get_type != &gidSymbolNotFound ? gtk_nothing_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NothingAction self()
  {
    return this;
  }

  /**
      Gets the nothing action.
      
      This is an action that does nothing and where
      activating it always fails.
      Returns: The nothing action
  */
  static gtk.nothing_action.NothingAction get()
  {
    GtkShortcutAction* _cretval;
    _cretval = gtk_nothing_action_get();
    auto _retval = gobject.object.ObjectWrap.getDObject!(gtk.nothing_action.NothingAction)(cast(GtkShortcutAction*)_cretval, No.Take);
    return _retval;
  }
}
