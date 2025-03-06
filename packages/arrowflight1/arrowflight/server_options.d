module arrowflight.server_options;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.location;
import arrowflight.types;
import gid.gid;
import gobject.object;

/** */
class ServerOptions : gobject.object.ObjectG
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

  /** */
  this(arrowflight.location.Location location)
  {
    GAFlightServerOptions* _cretval;
    _cretval = gaflight_server_options_new(location ? cast(GAFlightLocation*)location.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
