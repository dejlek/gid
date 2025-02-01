module Gio.LoadableIconIfaceProxy;

import GObject.ObjectG;
import Gio.LoadableIcon;
import Gio.LoadableIconT;

/// Proxy object for Gio.LoadableIcon interface when a GObject has no applicable D binding
class LoadableIconIfaceProxy : IfaceProxy, LoadableIcon
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(LoadableIcon);
  }

  mixin LoadableIconT!();
}
