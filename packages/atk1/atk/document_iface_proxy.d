/// Module for [DocumentIfaceProxy] interface proxy object
module atk.document_iface_proxy;

import gobject.object;
import atk.document;
import atk.document_mixin;

/// Proxy object for [atk.document.Document] interface when a GObject has no applicable D binding
class DocumentIfaceProxy : IfaceProxy, atk.document.Document
{
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(atk.document.Document);
  }

  mixin DocumentT!();
}
