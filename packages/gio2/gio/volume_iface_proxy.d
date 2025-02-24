module gio.volume_iface_proxy;

import gobject.object;
import gio.volume;
import gio.volume_mixin;

/// Proxy object for Gio.Volume interface when a GObject has no applicable D binding
class VolumeIfaceProxy : IfaceProxy, Volume
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Volume);
  }

  mixin VolumeT!();
}
