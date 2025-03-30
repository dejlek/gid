/// Module for [Parameter] class
module gobject.parameter;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;
import gobject.value;

/**
    The GParameter struct is an auxiliary structure used
    to hand parameter name/value pairs to [gobject.object.ObjectG.newv].

    Deprecated: This type is not introspectable.
*/
class Parameter
{
  GParameter cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.Parameter");

    cInstance = *cast(GParameter*)ptr;

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
    return cToD!(string)(cast(void*)(cast(GParameter*)cPtr).name);
  }

  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GParameter*)cPtr).name);
    dToC(propval, cast(void*)&(cast(GParameter*)cPtr).name);
  }

  @property gobject.value.Value value()
  {
    return cToD!(gobject.value.Value)(cast(void*)&(cast(GParameter*)cPtr).value);
  }
}
