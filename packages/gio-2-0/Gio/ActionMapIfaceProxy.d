module Gio.ActionMapIfaceProxy;

import GObject.ObjectG;
import Gio.ActionMap;
import Gio.ActionMapT;

/// Proxy object for Gio.ActionMap interface when a GObject has no applicable D binding
class ActionMapIfaceProxy : IfaceProxy, ActionMap
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
    return typeid(ActionMap);
  }

  mixin ActionMapT!();
}
