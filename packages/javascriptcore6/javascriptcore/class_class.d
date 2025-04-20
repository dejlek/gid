/// Module for [ClassClass] class
module javascriptcore.class_class;

import gid.gid;
import javascriptcore.c.functions;
import javascriptcore.c.types;
import javascriptcore.types;

/** */
class ClassClass
{
  JSCClassClass cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for javascriptcore.class_class.ClassClass");

    cInstance = *cast(JSCClassClass*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }
}
