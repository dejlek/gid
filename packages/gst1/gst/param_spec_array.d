module gst.param_spec_array;

import gid.gid;
import gobject.param_spec;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    A GParamSpec derived structure for arrays of values.
*/
class ParamSpecArray
{
  GstParamSpecArray cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gst.ParamSpecArray");

    cInstance = *cast(GstParamSpecArray*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gobject.param_spec.ParamSpec parentInstance()
  {
    return new gobject.param_spec.ParamSpec(cast(GParamSpec*)&(cast(GstParamSpecArray*)cPtr).parentInstance);
  }

  @property gobject.param_spec.ParamSpec elementSpec()
  {
    return new gobject.param_spec.ParamSpec(cast(GParamSpec*)(cast(GstParamSpecArray*)cPtr).elementSpec);
  }
}
