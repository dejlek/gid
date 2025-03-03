module gobject.type_instance;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;

/**
 * An opaque structure used as the base of all type instances.
 */
class TypeInstance
{
  GTypeInstance cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.TypeInstance");

    cInstance = *cast(GTypeInstance*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  void* getPrivate(gobject.types.GType privateType)
  {
    auto _retval = g_type_instance_get_private(cast(GTypeInstance*)cPtr, privateType);
    return _retval;
  }
}
