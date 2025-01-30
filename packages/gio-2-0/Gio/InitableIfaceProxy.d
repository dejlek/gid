module Gio.InitableIfaceProxy;

import GObject.ObjectG;
import Gio.Initable;
import Gio.InitableT;

/// Proxy object for Gio.Initable interface when a GObject has no applicable D binding
class InitableIfaceProxy : IfaceProxy, Initable
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
    return typeid(Initable);
  }

  mixin InitableT!();
}
