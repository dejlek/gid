module gstcheck.check_abistruct;

import gid.gid;
import gstcheck.c.functions;
import gstcheck.c.types;
import gstcheck.types;

/** */
class CheckABIStruct
{
  GstCheckABIStruct cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstCheck.CheckABIStruct");

    cInstance = *cast(GstCheckABIStruct*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GstCheckABIStruct*)cPtr).name);
  }

  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstCheckABIStruct*)cPtr).name);
    dToC(propval, cast(void*)&(cast(GstCheckABIStruct*)cPtr).name);
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
