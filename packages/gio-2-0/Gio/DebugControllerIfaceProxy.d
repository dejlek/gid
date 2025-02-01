module Gio.DebugControllerIfaceProxy;

import GObject.ObjectG;
import Gio.DebugController;
import Gio.DebugControllerT;

/// Proxy object for Gio.DebugController interface when a GObject has no applicable D binding
class DebugControllerIfaceProxy : IfaceProxy, DebugController
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(DebugController);
  }

  mixin DebugControllerT!();
}
