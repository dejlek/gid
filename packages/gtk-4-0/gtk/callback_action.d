module gtk.callback_action;

import gid.gid;
import glib.variant;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_action;
import gtk.types;
import gtk.widget;

/**
 * A `GtkShortcutAction` that invokes a callback.
 */
class CallbackAction : ShortcutAction
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_callback_action_get_type != &gidSymbolNotFound ? gtk_callback_action_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Create a custom action that calls the given callback when
   * activated.
   * Params:
   *   callback = the callback to call
   * Returns: A new shortcut action
   */
  this(ShortcutFunc callback)
  {
    extern(C) bool _callbackCallback(GtkWidget* widget, VariantC* args, void* userData)
    {
      auto _dlg = cast(ShortcutFunc*)userData;

      bool _retval = (*_dlg)(ObjectG.getDObject!Widget(cast(void*)widget, No.Take), args ? new VariantG(cast(void*)args, No.Take) : null);
      return _retval;
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    GtkShortcutAction* _cretval;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    _cretval = gtk_callback_action_new(_callbackCB, _callback, _callbackDestroyCB);
    this(_cretval, Yes.Take);
  }
}
