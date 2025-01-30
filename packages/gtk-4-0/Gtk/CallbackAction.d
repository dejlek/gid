module Gtk.CallbackAction;

import GLib.VariantG;
import GObject.ObjectG;
import Gid.gid;
import Gtk.ShortcutAction;
import Gtk.Types;
import Gtk.Widget;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * A `GtkShortcutAction` that invokes a callback.
 */
class CallbackAction : ShortcutAction
{

  this()
  {
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gtk_callback_action_get_type();
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

    GtkShortcutAction* _cretval;
    auto _callback = freezeDelegate(cast(void*)&callback);
    _cretval = gtk_callback_action_new(&_callbackCallback, _callback, &thawDelegate);
    this(_cretval, Yes.Take);
  }
}
