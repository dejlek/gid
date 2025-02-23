module GtkSource.HoverProvider;

public import GtkSource.HoverProviderIfaceProxy;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;
import Gio.AsyncResult;
import Gio.AsyncResultT;
import Gio.Cancellable;
import Gio.Types;
import GtkSource.HoverContext;
import GtkSource.HoverDisplay;
import GtkSource.Types;
import GtkSource.c.functions;
import GtkSource.c.types;

/**
 * Interface to populate interactive tooltips.
 * `GtkSourceHoverProvider` is an interface that should be implemented to extend
 * the contents of a class@HoverDisplay. This is typical in editors that
 * interact external tooling such as those utilizing Language Server Protocol.
 * If you can populate the class@HoverDisplay synchronously, use
 * vfunc@HoverProvider.populate. Otherwise, interface implementations that
 * may take additional time should use vfunc@HoverProvider.populate_async
 * to avoid blocking the main loop.
 */
interface HoverProvider
{

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_hover_provider_get_type != &gidSymbolNotFound ? gtk_source_hover_provider_get_type() : cast(GType)0;
  }

  void populateAsync(HoverContext context, HoverDisplay display, Cancellable cancellable, AsyncReadyCallback callback);

  bool populateFinish(AsyncResult result);
}
