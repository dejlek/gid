module Gio.VolumeIfaceProxy;

import GObject.ObjectG;
import Gio.Volume;
import Gio.VolumeT;

/// Proxy object for Gio.Volume interface when a GObject has no applicable D binding
class VolumeIfaceProxy : IfaceProxy, Volume
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
    return typeid(Volume);
  }

  mixin VolumeT!();
}
