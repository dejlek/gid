module ArrowFlight.DescriptorClass;

import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GObject.ObjectClass;
import Gid.gid;

class DescriptorClass
{
  GAFlightDescriptorClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowFlight.DescriptorClass");

    cInstance = *cast(GAFlightDescriptorClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GAFlightDescriptorClass*)cPtr).parentClass);
  }
}
