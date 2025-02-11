module ArrowFlight.CallOptionsClass;

import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GObject.ObjectClass;
import Gid.gid;

class CallOptionsClass
{
  GAFlightCallOptionsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowFlight.CallOptionsClass");

    cInstance = *cast(GAFlightCallOptionsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GAFlightCallOptionsClass*)cPtr).parentClass);
  }
}
