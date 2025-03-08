module gio.debug_controller_iface_proxy;

import gobject.object;
import gio.debug_controller;
import gio.debug_controller_mixin;

/// Proxy object for Gio.DebugController interface when a GObject has no applicable D binding
class DebugControllerIfaceProxy : IfaceProxy, gio.debug_controller.DebugController
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.debug_controller.DebugController);
  }

  mixin DebugControllerT!();
}
