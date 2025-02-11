module Arrow.StrptimeTimestampParserClass;

import Arrow.TimestampParserClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class StrptimeTimestampParserClass
{
  GArrowStrptimeTimestampParserClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.StrptimeTimestampParserClass");

    cInstance = *cast(GArrowStrptimeTimestampParserClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TimestampParserClass parentClass()
  {
    return new TimestampParserClass(cast(GArrowTimestampParserClass*)&(cast(GArrowStrptimeTimestampParserClass*)cPtr).parentClass);
  }
}
