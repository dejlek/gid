module gobject.param_spec_int64;

import gid.global;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
 * A #GParamSpec derived structure that contains the meta data for 64bit integer properties.
 */
class ParamSpecInt64 : ParamSpec
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.ParamSpecInt64");

    super(cast(GParamSpec*)ptr, take);
  }
}
