module Gio.DtlsServerConnectionIfaceProxy;

import GObject.ObjectG;
import Gio.DtlsServerConnection;
import Gio.DtlsServerConnectionT;

/// Proxy object for Gio.DtlsServerConnection interface when a GObject has no applicable D binding
class DtlsServerConnectionIfaceProxy : IfaceProxy, DtlsServerConnection
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(DtlsServerConnection);
  }

  mixin DtlsServerConnectionT!();
}
