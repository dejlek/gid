module gobject.param_spec_boolean;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
    A #GParamSpec derived structure that contains the meta data for boolean properties.
*/
class ParamSpecBoolean : gobject.param_spec.ParamSpec
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.ParamSpecBoolean");

    super(cast(GParamSpec*)ptr, take);
  }
}
