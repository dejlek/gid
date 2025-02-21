module Gtk.CustomFilter;

import GObject.ObjectG;
import Gid.gid;
import Gtk.Filter;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkCustomFilter` determines whether to include items with a callback.
 */
class CustomFilter : Filter
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_custom_filter_get_type != &gidSymbolNotFound ? gtk_custom_filter_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new filter using the given match_func to filter
   * items.
   * If match_func is %NULL, the filter matches all items.
   * If the filter func changes its filtering behavior,
   * [Gtk.Filter.changed] needs to be called.
   * Params:
   *   matchFunc = function to filter items
   * Returns: a new `GtkCustomFilter`
   */
  this(CustomFilterFunc matchFunc)
  {
    extern(C) bool _matchFuncCallback(ObjectC* item, void* userData)
    {
      auto _dlg = cast(CustomFilterFunc*)userData;

      bool _retval = (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)item, No.Take));
      return _retval;
    }
    auto _matchFuncCB = matchFunc ? &_matchFuncCallback : null;

    GtkCustomFilter* _cretval;
    auto _matchFunc = matchFunc ? freezeDelegate(cast(void*)&matchFunc) : null;
    GDestroyNotify _matchFuncDestroyCB = matchFunc ? &thawDelegate : null;
    _cretval = gtk_custom_filter_new(_matchFuncCB, _matchFunc, _matchFuncDestroyCB);
    this(_cretval, Yes.Take);
  }

  /**
   * Sets the function used for filtering items.
   * If match_func is %NULL, the filter matches all items.
   * If the filter func changes its filtering behavior,
   * [Gtk.Filter.changed] needs to be called.
   * If a previous function was set, its user_destroy will be
   * called now.
   * Params:
   *   matchFunc = function to filter items
   */
  void setFilterFunc(CustomFilterFunc matchFunc)
  {
    extern(C) bool _matchFuncCallback(ObjectC* item, void* userData)
    {
      auto _dlg = cast(CustomFilterFunc*)userData;

      bool _retval = (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)item, No.Take));
      return _retval;
    }
    auto _matchFuncCB = matchFunc ? &_matchFuncCallback : null;

    auto _matchFunc = matchFunc ? freezeDelegate(cast(void*)&matchFunc) : null;
    GDestroyNotify _matchFuncDestroyCB = matchFunc ? &thawDelegate : null;
    gtk_custom_filter_set_filter_func(cast(GtkCustomFilter*)cPtr, _matchFuncCB, _matchFunc, _matchFuncDestroyCB);
  }
}
