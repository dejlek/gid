module arrowflight.endpoint;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.location;
import arrowflight.ticket;
import arrowflight.types;
import gid.global;
import gobject.object;

class Endpoint : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_endpoint_get_type != &gidSymbolNotFound ? gaflight_endpoint_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Ticket ticket, Location[] locations)
  {
    GAFlightEndpoint* _cretval;
    auto _locations = gListFromD!(Location)(locations);
    scope(exit) containerFree!(GList*, Location, GidOwnership.None)(_locations);
    _cretval = gaflight_endpoint_new(ticket ? cast(GAFlightTicket*)ticket.cPtr(No.Dup) : null, _locations);
    this(_cretval, Yes.Take);
  }

  bool equal(Endpoint otherEndpoint)
  {
    bool _retval;
    _retval = gaflight_endpoint_equal(cast(GAFlightEndpoint*)cPtr, otherEndpoint ? cast(GAFlightEndpoint*)otherEndpoint.cPtr(No.Dup) : null);
    return _retval;
  }

  Location[] getLocations()
  {
    GList* _cretval;
    _cretval = gaflight_endpoint_get_locations(cast(GAFlightEndpoint*)cPtr);
    auto _retval = gListToD!(Location, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }
}
