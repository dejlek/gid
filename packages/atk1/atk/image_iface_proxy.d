/// Module for [ImageIfaceProxy] interface proxy object
module atk.image_iface_proxy;

import gobject.object;
import atk.image;
import atk.image_mixin;

/// Proxy object for [Atk.Image] interface when a GObject has no applicable D binding
class ImageIfaceProxy : IfaceProxy, atk.image.Image
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(atk.image.Image);
  }

  mixin ImageT!();
}
