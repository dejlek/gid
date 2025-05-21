/// Module for [RTSPExtensionIfaceProxy] interface proxy object
module gstrtsp.rtspextension_iface_proxy;

import gobject.object;
import gstrtsp.rtspextension;
import gstrtsp.rtspextension_mixin;

/// Proxy object for [gstrtsp.rtspextension.RTSPExtension] interface when a GObject has no applicable D binding
class RTSPExtensionIfaceProxy : IfaceProxy, gstrtsp.rtspextension.RTSPExtension
{
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gstrtsp.rtspextension.RTSPExtension);
  }

  mixin RTSPExtensionT!();
}
