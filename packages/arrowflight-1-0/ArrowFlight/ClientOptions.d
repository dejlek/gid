module ArrowFlight.ClientOptions;

import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GObject.ObjectG;
import Gid.gid;

class ClientOptions : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_client_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GAFlightClientOptions* _cretval;
    _cretval = gaflight_client_options_new();
    this(_cretval, Yes.Take);
  }
}
