module gio.async_result_iface_proxy;

import gobject.object;
import gio.async_result;
import gio.async_result_mixin;

/// Proxy object for Gio.AsyncResult interface when a GObject has no applicable D binding
class AsyncResultIfaceProxy : IfaceProxy, gio.async_result.AsyncResult
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.async_result.AsyncResult);
  }

  mixin AsyncResultT!();
}
