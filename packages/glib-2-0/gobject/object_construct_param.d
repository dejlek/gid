module gobject.object_construct_param;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;
import gobject.value;

/**
 * The GObjectConstructParam struct is an auxiliary structure used to hand
 * #GParamSpec/#GValue pairs to the @constructor of a #GObjectClass.
 */
class ObjectConstructParam
{
  GObjectConstructParam cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
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

  @property ParamSpec pspec()
  {
    return new ParamSpec(cast(GParamSpec*)(cast(GObjectConstructParam*)cPtr).pspec);
  }

  @property Value value()
  {
    return new Value(cast(GValue*)(cast(GObjectConstructParam*)cPtr).value);
  }
}
