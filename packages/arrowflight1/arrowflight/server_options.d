/// Module for [ServerOptions] class
module arrowflight.server_options;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.location;
import arrowflight.server_auth_handler;
import arrowflight.types;
import gid.gid;
import gobject.object;

/** */
class ServerOptions : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_server_options_get_type != &gidSymbolNotFound ? gaflight_server_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ServerOptions self()
  {
    return this;
  }

  /**
      Get `authHandler` property.
      Returns: The authentication handler.
  */
  @property arrowflight.server_auth_handler.ServerAuthHandler authHandler()
  {
    return gobject.object.ObjectWrap.getProperty!(arrowflight.server_auth_handler.ServerAuthHandler)("auth-handler");
  }

  /**
      Set `authHandler` property.
      Params:
        propval = The authentication handler.
  */
  @property void authHandler(arrowflight.server_auth_handler.ServerAuthHandler propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrowflight.server_auth_handler.ServerAuthHandler)("auth-handler", propval);
  }

  /** */
  this(arrowflight.location.Location location)
  {
    GAFlightServerOptions* _cretval;
    _cretval = gaflight_server_options_new(location ? cast(GAFlightLocation*)location._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
