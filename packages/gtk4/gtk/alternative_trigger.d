module gtk.alternative_trigger;

import gid.global;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_trigger;
import gtk.types;

/**
 * A `GtkShortcutTrigger` that combines two triggers.
 * The `GtkAlternativeTrigger` triggers when either of two trigger.
 * This can be cascaded to combine more than two triggers.
 */
class AlternativeTrigger : ShortcutTrigger
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_alternative_trigger_get_type != &gidSymbolNotFound ? gtk_alternative_trigger_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a `GtkShortcutTrigger` that will trigger whenever
   * either of the two given triggers gets triggered.
   * Note that nesting is allowed, so if you want more than two
   * alternative, create a new alternative trigger for each option.
   * Params:
   *   first = The first trigger that may trigger
   *   second = The second trigger that may trigger
   * Returns: a new `GtkShortcutTrigger`
   */
  this(ShortcutTrigger first, ShortcutTrigger second)
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_alternative_trigger_new(first ? cast(GtkShortcutTrigger*)first.cPtr(Yes.Dup) : null, second ? cast(GtkShortcutTrigger*)second.cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the first of the two alternative triggers that may
   * trigger self.
   * [gtk.alternative_trigger.AlternativeTrigger.getSecond] will return
   * the other one.
   * Returns: the first alternative trigger
   */
  ShortcutTrigger getFirst()
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_alternative_trigger_get_first(cast(GtkAlternativeTrigger*)cPtr);
    auto _retval = ObjectG.getDObject!ShortcutTrigger(cast(GtkShortcutTrigger*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the second of the two alternative triggers that may
   * trigger self.
   * [gtk.alternative_trigger.AlternativeTrigger.getFirst] will return
   * the other one.
   * Returns: the second alternative trigger
   */
  ShortcutTrigger getSecond()
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_alternative_trigger_get_second(cast(GtkAlternativeTrigger*)cPtr);
    auto _retval = ObjectG.getDObject!ShortcutTrigger(cast(GtkShortcutTrigger*)_cretval, No.Take);
    return _retval;
  }
}
