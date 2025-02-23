module GtkSource.IndenterIfaceProxy;

import GObject.ObjectG;
import GtkSource.Indenter;
import GtkSource.IndenterT;

/// Proxy object for GtkSource.Indenter interface when a GObject has no applicable D binding
class IndenterIfaceProxy : IfaceProxy, Indenter
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Indenter);
  }

  mixin IndenterT!();
}
