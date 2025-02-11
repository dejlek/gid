module ArrowFlight.ServableIfaceProxy;

import GObject.ObjectG;
import ArrowFlight.Servable;
import ArrowFlight.ServableT;

/// Proxy object for ArrowFlight.Servable interface when a GObject has no applicable D binding
class ServableIfaceProxy : IfaceProxy, Servable
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Servable);
  }

  mixin ServableT!();
}
