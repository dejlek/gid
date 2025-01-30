module Gio.TlsBackendIfaceProxy;

import GObject.ObjectG;
import Gio.TlsBackend;
import Gio.TlsBackendT;

/// Proxy object for Gio.TlsBackend interface when a GObject has no applicable D binding
class TlsBackendIfaceProxy : IfaceProxy, TlsBackend
{
  this()
  {
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(TlsBackend);
  }

  mixin TlsBackendT!();
}
