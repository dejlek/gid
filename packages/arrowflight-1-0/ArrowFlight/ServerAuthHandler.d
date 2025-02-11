module ArrowFlight.ServerAuthHandler;

import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GObject.ObjectG;
import Gid.gid;

class ServerAuthHandler : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_server_auth_handler_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }
}
