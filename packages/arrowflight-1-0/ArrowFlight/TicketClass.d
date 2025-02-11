module ArrowFlight.TicketClass;

import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GObject.ObjectClass;
import Gid.gid;

class TicketClass
{
  GAFlightTicketClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowFlight.TicketClass");

    cInstance = *cast(GAFlightTicketClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GAFlightTicketClass*)cPtr).parentClass);
  }
}
