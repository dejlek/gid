module gobject.param_spec_uint64;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
 * A #GParamSpec derived structure that contains the meta data for unsigned 64bit integer properties.
 */
class ParamSpecUInt64 : ParamSpec
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.ParamSpecUInt64");

    super(cast(GParamSpec*)ptr, take);
  }
}
