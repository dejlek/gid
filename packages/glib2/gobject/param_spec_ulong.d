module gobject.param_spec_ulong;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
 * A #GParamSpec derived structure that contains the meta data for unsigned long integer properties.
 */
class ParamSpecULong : ParamSpec
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.ParamSpecULong");

    super(cast(GParamSpec*)ptr, take);
  }
}
