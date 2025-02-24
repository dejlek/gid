module atk.hypertext_iface_proxy;

import gobject.object;
import atk.hypertext;
import atk.hypertext_mixin;

/// Proxy object for Atk.Hypertext interface when a GObject has no applicable D binding
class HypertextIfaceProxy : IfaceProxy, Hypertext
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Hypertext);
  }

  mixin HypertextT!();
}
