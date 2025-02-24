module gio.loadable_icon;

public import gio.loadable_icon_iface_proxy;
import gid.gid;
import gio.async_result;
import gio.async_result_mixin;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.input_stream;
import gio.types;
import glib.error;
import gobject.object;

/**
 * `GLoadableIcon` extends the [Gio.Icon] interface and adds the ability
 * to load icons from streams.
 */
interface LoadableIcon
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_loadable_icon_get_type != &gidSymbolNotFound ? g_loadable_icon_get_type() : cast(GType)0;
  }

  /**
   * Loads a loadable icon. For the asynchronous version of this function,
   * see [Gio.LoadableIcon.loadAsync].
   * Params:
   *   size = an integer.
   *   type = a location to store the type of the loaded
   *     icon, %NULL to ignore.
   *   cancellable = optional #GCancellable object, %NULL to
   *     ignore.
   * Returns: a #GInputStream to read the icon from.
   */
  InputStream load(int size, out string type, Cancellable cancellable);

  /**
   * Loads an icon asynchronously. To finish this function, see
   * [Gio.LoadableIcon.loadFinish]. For the synchronous, blocking
   * version of this function, see [Gio.LoadableIcon.load].
   * Params:
   *   size = an integer.
   *   cancellable = optional #GCancellable object, %NULL to ignore.
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void loadAsync(int size, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous icon load started in [Gio.LoadableIcon.loadAsync].
   * Params:
   *   res = a #GAsyncResult.
   *   type = a location to store the type of the loaded
   *     icon, %NULL to ignore.
   * Returns: a #GInputStream to read the icon from.
   */
  InputStream loadFinish(AsyncResult res, out string type);
}
