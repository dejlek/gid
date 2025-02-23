module atk.text_iface_proxy;

import gobject.object;
import atk.text;
import atk.text_mixin;

/// Proxy object for Atk.Text interface when a GObject has no applicable D binding
class TextIfaceProxy : IfaceProxy, Text
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Text);
  }

  mixin TextT!();
}
