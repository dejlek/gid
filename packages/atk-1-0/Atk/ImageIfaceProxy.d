module Atk.ImageIfaceProxy;

import GObject.ObjectG;
import Atk.Image;
import Atk.ImageT;

/// Proxy object for Atk.Image interface when a GObject has no applicable D binding
class ImageIfaceProxy : IfaceProxy, Image
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Image);
  }

  mixin ImageT!();
}
