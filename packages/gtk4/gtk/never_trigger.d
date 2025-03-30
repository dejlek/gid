/// Module for [NeverTrigger] class
module gtk.never_trigger;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_trigger;
import gtk.types;

/**
    A [gtk.shortcut_trigger.ShortcutTrigger] that never triggers.
*/
class NeverTrigger : gtk.shortcut_trigger.ShortcutTrigger
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
    return cast(void function())gtk_never_trigger_get_type != &gidSymbolNotFound ? gtk_never_trigger_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override NeverTrigger self()
  {
    return this;
  }

  /**
      Gets the never trigger.
      
      This is a singleton for a trigger that never triggers.
      Use this trigger instead of null because it implements
      all virtual functions.
      Returns: The never trigger
  */
  static gtk.never_trigger.NeverTrigger get()
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_never_trigger_get();
    auto _retval = ObjectG.getDObject!(gtk.never_trigger.NeverTrigger)(cast(GtkShortcutTrigger*)_cretval, No.Take);
    return _retval;
  }
}
