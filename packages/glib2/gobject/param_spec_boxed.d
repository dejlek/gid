/// Module for [ParamSpecBoxed] class
module gobject.param_spec_boxed;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
    A #GParamSpec derived structure that contains the meta data for boxed properties.
*/
class ParamSpecBoxed : gobject.param_spec.ParamSpec
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.ParamSpecBoxed");

    super(cast(GParamSpec*)ptr, take);
  }
}
