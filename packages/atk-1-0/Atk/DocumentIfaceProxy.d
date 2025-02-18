module Atk.DocumentIfaceProxy;

import GObject.ObjectG;
import Atk.Document;
import Atk.DocumentT;

/// Proxy object for Atk.Document interface when a GObject has no applicable D binding
class DocumentIfaceProxy : IfaceProxy, Document
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Document);
  }

  mixin DocumentT!();
}
