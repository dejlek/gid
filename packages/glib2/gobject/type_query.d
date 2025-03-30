/// Module for [TypeQuery] class
module gobject.type_query;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;

/**
    A structure holding information for a specific type.
    
    See also: [gobject.global.typeQuery]
*/
class TypeQuery
{
  GTypeQuery cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.TypeQuery");

    cInstance = *cast(GTypeQuery*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gobject.types.GType type()
  {
    return (cast(GTypeQuery*)cPtr).type;
  }

  @property void type(gobject.types.GType propval)
  {
    (cast(GTypeQuery*)cPtr).type = propval;
  }

  @property string typeName()
  {
    return cToD!(string)(cast(void*)(cast(GTypeQuery*)cPtr).typeName);
  }

  @property void typeName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GTypeQuery*)cPtr).typeName);
    dToC(propval, cast(void*)&(cast(GTypeQuery*)cPtr).typeName);
  }

  @property uint classSize()
  {
    return (cast(GTypeQuery*)cPtr).classSize;
  }

  @property void classSize(uint propval)
  {
    (cast(GTypeQuery*)cPtr).classSize = propval;
  }

  @property uint instanceSize()
  {
    return (cast(GTypeQuery*)cPtr).instanceSize;
  }

  @property void instanceSize(uint propval)
  {
    (cast(GTypeQuery*)cPtr).instanceSize = propval;
  }
}
