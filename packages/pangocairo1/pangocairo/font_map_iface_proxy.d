/// Module for [FontMapIfaceProxy] interface proxy object
module pangocairo.font_map_iface_proxy;

import gobject.object;
import pangocairo.font_map;
import pangocairo.font_map_mixin;

/// Proxy object for [PangoCairo.FontMap] interface when a GObject has no applicable D binding
class FontMapIfaceProxy : IfaceProxy, pangocairo.font_map.FontMap
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(pangocairo.font_map.FontMap);
  }

  mixin FontMapT!();
}
