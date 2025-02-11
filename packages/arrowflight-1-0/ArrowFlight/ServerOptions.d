module ArrowFlight.ServerOptions;

import ArrowFlight.Location;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GObject.ObjectG;
import Gid.gid;

class ServerOptions : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_server_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Location location)
  {
    GAFlightServerOptions* _cretval;
    _cretval = gaflight_server_options_new(location ? cast(GAFlightLocation*)location.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
