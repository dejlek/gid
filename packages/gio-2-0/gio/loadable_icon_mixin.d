module gio.loadable_icon_mixin;

public import gio.loadable_icon_iface_proxy;
public import gid.gid;
public import gio.async_result;
public import gio.async_result_mixin;
public import gio.c.functions;
public import gio.c.types;
public import gio.cancellable;
public import gio.input_stream;
public import gio.types;
public import glib.error;
public import gobject.object;

/**
 * `GLoadableIcon` extends the [Gio.Icon] interface and adds the ability
 * to load icons from streams.
 */
template LoadableIconT()
{

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
  override InputStream load(int size, out string type, Cancellable cancellable)
  {
    GInputStream* _cretval;
    char* _type;
    GError *_err;
    _cretval = g_loadable_icon_load(cast(GLoadableIcon*)cPtr, size, &_type, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!InputStream(cast(GInputStream*)_cretval, Yes.Take);
    type = _type.fromCString(Yes.Free);
    return _retval;
  }

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
  override void loadAsync(int size, Cancellable cancellable, AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_loadable_icon_load_async(cast(GLoadableIcon*)cPtr, size, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes an asynchronous icon load started in [Gio.LoadableIcon.loadAsync].
   * Params:
   *   res = a #GAsyncResult.
   *   type = a location to store the type of the loaded
   *     icon, %NULL to ignore.
   * Returns: a #GInputStream to read the icon from.
   */
  override InputStream loadFinish(AsyncResult res, out string type)
  {
    GInputStream* _cretval;
    char* _type;
    GError *_err;
    _cretval = g_loadable_icon_load_finish(cast(GLoadableIcon*)cPtr, res ? cast(GAsyncResult*)(cast(ObjectG)res).cPtr(No.Dup) : null, &_type, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!InputStream(cast(GInputStream*)_cretval, Yes.Take);
    type = _type.fromCString(Yes.Free);
    return _retval;
  }
}
