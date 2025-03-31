/// Module for [FileAttributeInfo] class
module gio.file_attribute_info;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;

/**
    Information about a specific attribute.
*/
class FileAttributeInfo
{
  GFileAttributeInfo cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.FileAttributeInfo");

    cInstance = *cast(GFileAttributeInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GFileAttributeInfo*)cPtr).name);
  }

  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GFileAttributeInfo*)cPtr).name);
    dToC(propval, cast(void*)&(cast(GFileAttributeInfo*)cPtr).name);
  }

  @property gio.types.FileAttributeType type()
  {
    return cast(gio.types.FileAttributeType)(cast(GFileAttributeInfo*)cPtr).type;
  }

  @property void type(gio.types.FileAttributeType propval)
  {
    (cast(GFileAttributeInfo*)cPtr).type = cast(GFileAttributeType)propval;
  }

  @property gio.types.FileAttributeInfoFlags flags()
  {
    return cast(gio.types.FileAttributeInfoFlags)(cast(GFileAttributeInfo*)cPtr).flags;
  }

  @property void flags(gio.types.FileAttributeInfoFlags propval)
  {
    (cast(GFileAttributeInfo*)cPtr).flags = cast(GFileAttributeInfoFlags)propval;
  }
}
