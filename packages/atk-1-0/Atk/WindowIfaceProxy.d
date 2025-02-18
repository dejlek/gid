module Atk.WindowIfaceProxy;

import GObject.ObjectG;
import Atk.Window;
import Atk.WindowT;

/// Proxy object for Atk.Window interface when a GObject has no applicable D binding
class WindowIfaceProxy : IfaceProxy, Window
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Window);
  }

  mixin WindowT!();
}
