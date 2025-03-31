/// Module for [ParamSpecUInt] class
module gobject.param_spec_uint;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
    A #GParamSpec derived structure that contains the meta data for unsigned integer properties.
*/
class ParamSpecUInt : gobject.param_spec.ParamSpec
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.ParamSpecUInt");

    super(cast(GParamSpec*)ptr, take);
  }
}
