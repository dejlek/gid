module gstcheck.check_abistruct;

import gid.gid;
import gstcheck.c.functions;
import gstcheck.c.types;
import gstcheck.types;

/** */
class CheckABIStruct
{
  GstCheckABIStruct cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstCheck.CheckABIStruct");

    cInstance = *cast(GstCheckABIStruct*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string name()
  {
    return (cast(GstCheckABIStruct*)cPtr).name.fromCString(No.free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GstCheckABIStruct*)cPtr).name);
    (cast(GstCheckABIStruct*)cPtr).name = propval.toCString(Yes.alloc);
  }

  @property int size()
  {
    return (cast(GstCheckABIStruct*)cPtr).size;
  }

  @property void size(int propval)
  {
    (cast(GstCheckABIStruct*)cPtr).size = propval;
  }

  @property int abiSize()
  {
    return (cast(GstCheckABIStruct*)cPtr).abiSize;
  }

  @property void abiSize(int propval)
  {
    (cast(GstCheckABIStruct*)cPtr).abiSize = propval;
  }
}
