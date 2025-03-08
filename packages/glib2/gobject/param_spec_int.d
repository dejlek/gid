module gobject.param_spec_int;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
    A #GParamSpec derived structure that contains the meta data for integer properties.
*/
class ParamSpecInt : gobject.param_spec.ParamSpec
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.ParamSpecInt");

    super(cast(GParamSpec*)ptr, take);
  }
}
