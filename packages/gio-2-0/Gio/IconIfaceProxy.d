module Gio.IconIfaceProxy;

import GObject.ObjectG;
import Gio.Icon;
import Gio.IconT;

/// Proxy object for Gio.Icon interface when a GObject has no applicable D binding
class IconIfaceProxy : IfaceProxy, Icon
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Icon);
  }

  mixin IconT!();
}
