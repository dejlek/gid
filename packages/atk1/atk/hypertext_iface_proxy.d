/// Module for [HypertextIfaceProxy] interface proxy object
module atk.hypertext_iface_proxy;

import gobject.object;
import atk.hypertext;
import atk.hypertext_mixin;

/// Proxy object for [Atk.Hypertext] interface when a GObject has no applicable D binding
class HypertextIfaceProxy : IfaceProxy, atk.hypertext.Hypertext
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(atk.hypertext.Hypertext);
  }

  mixin HypertextT!();
}
