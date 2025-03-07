module soup.websocket_extension_deflate;

import gid.gid;
import soup.c.functions;
import soup.c.types;
import soup.types;
import soup.websocket_extension;

/**
    A SoupWebsocketExtensionDeflate is a `class@WebsocketExtension`
  implementing permessage-deflate (RFC 7692).
  
  This extension is used by default in a `class@Session` when `class@WebsocketExtensionManager`
  feature is present, and always used by `class@Server`.
*/
class WebsocketExtensionDeflate : soup.websocket_extension.WebsocketExtension
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_websocket_extension_deflate_get_type != &gidSymbolNotFound ? soup_websocket_extension_deflate_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }
}
