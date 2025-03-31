/// Module for [ListModelIfaceProxy] interface proxy object
module gio.list_model_iface_proxy;

import gobject.object;
import gio.list_model;
import gio.list_model_mixin;

/// Proxy object for [Gio.ListModel] interface when a GObject has no applicable D binding
class ListModelIfaceProxy : IfaceProxy, gio.list_model.ListModel
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.list_model.ListModel);
  }

  mixin ListModelT!();
}
