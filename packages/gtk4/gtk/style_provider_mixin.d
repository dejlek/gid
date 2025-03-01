module gtk.style_provider_mixin;

public import gtk.style_provider_iface_proxy;
public import gid.global;
public import gobject.dclosure;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
 * `GtkStyleProvider` is an interface for style information used by
 * `GtkStyleContext`.
 * See [gtk.style_context.StyleContext.addProvider] and
 * [gtk.style_context.StyleContext.addProviderForDisplay] for
 * adding `GtkStyleProviders`.
 * GTK uses the `GtkStyleProvider` implementation for CSS in
 * [gtk.css_provider.CssProvider].
 */
template StyleProviderT()
{

  alias GtkPrivateChangedCallbackDlg = void delegate(StyleProvider styleProvider);
  alias GtkPrivateChangedCallbackFunc = void function(StyleProvider styleProvider);

  /**
   * Connect to GtkPrivateChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectGtkPrivateChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : GtkPrivateChangedCallbackDlg) || is(T : GtkPrivateChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto styleProvider = getVal!StyleProvider(_paramVals);
      _dClosure.dlg(styleProvider);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("gtk-private-changed", closure, after);
  }
}
