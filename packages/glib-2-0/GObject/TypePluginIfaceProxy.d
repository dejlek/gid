module GObject.TypePluginIfaceProxy;

import GObject.ObjectG;
import GObject.TypePlugin;
import GObject.TypePluginT;

/// Proxy object for GObject.TypePlugin interface when a GObject has no applicable D binding
class TypePluginIfaceProxy : IfaceProxy, TypePlugin
{
  this()
  {
  }

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
