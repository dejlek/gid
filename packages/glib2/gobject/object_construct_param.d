module gobject.object_construct_param;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;
import gobject.value;

/**
    The GObjectConstructParam struct is an auxiliary structure used to hand
  #GParamSpec/#GValue pairs to the @constructor of a #GObjectClass.
*/
class ObjectConstructParam
{
  GObjectConstructParam cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.ObjectConstructParam");

    cInstance = *cast(GObjectConstructParam*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gobject.param_spec.ParamSpec pspec()
  {
    return new gobject.param_spec.ParamSpec(cast(GParamSpec*)(cast(GObjectConstructParam*)cPtr).pspec);
  }

  @property gobject.value.Value value()
  {
    return new gobject.value.Value(cast(GValue*)(cast(GObjectConstructParam*)cPtr).value);
  }
}
