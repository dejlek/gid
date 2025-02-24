module gio.loadable_icon_iface_proxy;

import gobject.object;
import gio.loadable_icon;
import gio.loadable_icon_mixin;

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
