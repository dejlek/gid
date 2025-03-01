module gtk.never_trigger;

import gid.global;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_trigger;
import gtk.types;

/**
 * A `GtkShortcutTrigger` that never triggers.
 */
class NeverTrigger : ShortcutTrigger
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_never_trigger_get_type != &gidSymbolNotFound ? gtk_never_trigger_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Gets the never trigger.
   * This is a singleton for a trigger that never triggers.
   * Use this trigger instead of %NULL because it implements
   * all virtual functions.
   * Returns: The never trigger
   */
  static NeverTrigger get()
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_never_trigger_get();
    auto _retval = ObjectG.getDObject!NeverTrigger(cast(GtkShortcutTrigger*)_cretval, No.Take);
    return _retval;
  }
}
