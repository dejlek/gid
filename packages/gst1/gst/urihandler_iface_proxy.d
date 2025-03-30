/// Module for [URIHandlerIfaceProxy] interface proxy object
module gst.urihandler_iface_proxy;

import gobject.object;
import gst.urihandler;
import gst.urihandler_mixin;

/// Proxy object for [Gst.URIHandler] interface when a GObject has no applicable D binding
class URIHandlerIfaceProxy : IfaceProxy, gst.urihandler.URIHandler
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gst.urihandler.URIHandler);
  }

  mixin URIHandlerT!();
}
