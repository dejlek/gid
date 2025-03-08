module gio.initable_iface_proxy;

import gobject.object;
import gio.initable;
import gio.initable_mixin;

/// Proxy object for Gio.Initable interface when a GObject has no applicable D binding
class InitableIfaceProxy : IfaceProxy, gio.initable.Initable
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.initable.Initable);
  }

  mixin InitableT!();
}
