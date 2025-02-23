module gobject.type_plugin_iface_proxy;

import gobject.object;
import gobject.type_plugin;
import gobject.type_plugin_mixin;

/// Proxy object for GObject.TypePlugin interface when a GObject has no applicable D binding
class TypePluginIfaceProxy : IfaceProxy, TypePlugin
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(TypePlugin);
  }

  mixin TypePluginT!();
}
