module gio.async_result_iface_proxy;

import gobject.object;
import gio.async_result;
import gio.async_result_mixin;

/// Proxy object for Gio.AsyncResult interface when a GObject has no applicable D binding
class AsyncResultIfaceProxy : IfaceProxy, AsyncResult
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(AsyncResult);
  }

  mixin AsyncResultT!();
}
