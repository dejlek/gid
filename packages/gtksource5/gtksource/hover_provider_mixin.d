module gtksource.hover_provider_mixin;

public import gtksource.hover_provider_iface_proxy;
public import gid.gid;
public import gio.async_result;
public import gio.async_result_mixin;
public import gio.cancellable;
public import gio.types;
public import glib.error;
public import gobject.object;
public import gtksource.c.functions;
public import gtksource.c.types;
public import gtksource.hover_context;
public import gtksource.hover_display;
public import gtksource.types;

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
template HoverProviderT()
{

  override void populateAsync(HoverContext context, HoverDisplay display, Cancellable cancellable, AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_source_hover_provider_populate_async(cast(GtkSourceHoverProvider*)cPtr, context ? cast(GtkSourceHoverContext*)context.cPtr(No.Dup) : null, display ? cast(GtkSourceHoverDisplay*)display.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  override bool populateFinish(AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = gtk_source_hover_provider_populate_finish(cast(GtkSourceHoverProvider*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
