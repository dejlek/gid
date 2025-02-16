module ArrowFlight.Ticket;

import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GLib.Bytes;
import GObject.ObjectG;
import Gid.gid;

class Ticket : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_ticket_get_type != &gidSymbolNotFound ? gaflight_ticket_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Bytes data)
  {
    GAFlightTicket* _cretval;
    _cretval = gaflight_ticket_new(data ? cast(GBytes*)data.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  bool equal(Ticket otherTicket)
  {
    bool _retval;
    _retval = gaflight_ticket_equal(cast(GAFlightTicket*)cPtr, otherTicket ? cast(GAFlightTicket*)otherTicket.cPtr(No.Dup) : null);
    return _retval;
  }
}
