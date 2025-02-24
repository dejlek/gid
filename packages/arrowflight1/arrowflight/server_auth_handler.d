module arrowflight.server_auth_handler;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import gobject.object;

class ServerAuthHandler : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_server_auth_handler_get_type != &gidSymbolNotFound ? gaflight_server_auth_handler_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
