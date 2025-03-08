module arrowflight.ticket;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import glib.bytes;
import gobject.object;

/** */
class Ticket : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_ticket_get_type != &gidSymbolNotFound ? gaflight_ticket_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(glib.bytes.Bytes data)
  {
    GAFlightTicket* _cretval;
    _cretval = gaflight_ticket_new(data ? cast(GBytes*)data.cPtr(No.dup) : null);
    this(_cretval, Yes.take);
  }

  /** */
  bool equal(arrowflight.ticket.Ticket otherTicket)
  {
    bool _retval;
    _retval = gaflight_ticket_equal(cast(GAFlightTicket*)cPtr, otherTicket ? cast(GAFlightTicket*)otherTicket.cPtr(No.dup) : null);
    return _retval;
  }
}
