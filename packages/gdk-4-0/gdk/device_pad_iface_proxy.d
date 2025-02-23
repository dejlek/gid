module gdk.device_pad_iface_proxy;

import gobject.object;
import gdk.device_pad;
import gdk.device_pad_mixin;

/// Proxy object for Gdk.DevicePad interface when a GObject has no applicable D binding
class DevicePadIfaceProxy : IfaceProxy, DevicePad
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(DevicePad);
  }

  mixin DevicePadT!();
}
