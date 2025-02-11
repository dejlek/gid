module Arrow.ISO8601TimestampParserClass;

import Arrow.TimestampParserClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class ISO8601TimestampParserClass
{
  GArrowISO8601TimestampParserClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.ISO8601TimestampParserClass");

    cInstance = *cast(GArrowISO8601TimestampParserClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TimestampParserClass parentClass()
  {
    return new TimestampParserClass(cast(GArrowTimestampParserClass*)&(cast(GArrowISO8601TimestampParserClass*)cPtr).parentClass);
  }
}
