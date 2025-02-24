module gtk.style_provider;

public import gtk.style_provider_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * `GtkStyleProvider` is an interface for style information used by
 * `GtkStyleContext`.
 * See [Gtk.StyleContext.addProvider] and
 * [Gtk.StyleContext.addProviderForDisplay] for
 * adding `GtkStyleProviders`.
 * GTK uses the `GtkStyleProvider` implementation for CSS in
 * [Gtk.CssProvider].
 */
interface StyleProvider
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_style_provider_get_type != &gidSymbolNotFound ? gtk_style_provider_get_type() : cast(GType)0;
  }

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
  if (is(T : GtkPrivateChangedCallbackDlg) || is(T : GtkPrivateChangedCallbackFunc));
  }
