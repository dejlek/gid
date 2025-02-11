module ArrowFlight.PathDescriptorClass;

import ArrowFlight.DescriptorClass;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import Gid.gid;

class PathDescriptorClass
{
  GAFlightPathDescriptorClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowFlight.PathDescriptorClass");

    cInstance = *cast(GAFlightPathDescriptorClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DescriptorClass parentClass()
  {
    return new DescriptorClass(cast(GAFlightDescriptorClass*)&(cast(GAFlightPathDescriptorClass*)cPtr).parentClass);
  }
}
