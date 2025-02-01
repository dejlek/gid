module Gio.ListModelIfaceProxy;

import GObject.ObjectG;
import Gio.ListModel;
import Gio.ListModelT;

/// Proxy object for Gio.ListModel interface when a GObject has no applicable D binding
class ListModelIfaceProxy : IfaceProxy, ListModel
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(ListModel);
  }

  mixin ListModelT!();
}
