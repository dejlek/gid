/// Module for [FontIfaceProxy] interface proxy object
module pangocairo.font_iface_proxy;

import gobject.object;
import pangocairo.font;
import pangocairo.font_mixin;

/// Proxy object for [PangoCairo.Font] interface when a GObject has no applicable D binding
class FontIfaceProxy : IfaceProxy, pangocairo.font.Font
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(pangocairo.font.Font);
  }

  mixin FontT!();
}
