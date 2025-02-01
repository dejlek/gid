module Gio.AsyncResultIfaceProxy;

import GObject.ObjectG;
import Gio.AsyncResult;
import Gio.AsyncResultT;

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
