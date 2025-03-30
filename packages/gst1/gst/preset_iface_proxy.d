/// Module for [PresetIfaceProxy] interface proxy object
module gst.preset_iface_proxy;

import gobject.object;
import gst.preset;
import gst.preset_mixin;

/// Proxy object for [Gst.Preset] interface when a GObject has no applicable D binding
class PresetIfaceProxy : IfaceProxy, gst.preset.Preset
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gst.preset.Preset);
  }

  mixin PresetT!();
}
