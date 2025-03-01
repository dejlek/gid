module arrowflight.server_options;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.location;
import arrowflight.types;
import gid.global;
import gobject.object;

class ServerOptions : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_server_options_get_type != &gidSymbolNotFound ? gaflight_server_options_get_type() : cast(GType)0;
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
