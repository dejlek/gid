module ArrowFlight.ServerAuthReaderClass;

import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GObject.ObjectClass;
import Gid.gid;

class ServerAuthReaderClass
{
  GAFlightServerAuthReaderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowFlight.ServerAuthReaderClass");

    cInstance = *cast(GAFlightServerAuthReaderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GAFlightServerAuthReaderClass*)cPtr).parentClass);
  }
}
