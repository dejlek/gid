module Gio.DtlsConnectionIfaceProxy;

import GObject.ObjectG;
import Gio.DtlsConnection;
import Gio.DtlsConnectionT;

/// Proxy object for Gio.DtlsConnection interface when a GObject has no applicable D binding
class DtlsConnectionIfaceProxy : IfaceProxy, DtlsConnection
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
    return typeid(DtlsConnection);
  }

  mixin DtlsConnectionT!();
}
