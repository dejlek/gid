/// Module for [ParamSpecChar] class
module gobject.param_spec_char;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
    A #GParamSpec derived structure that contains the meta data for character properties.
*/
class ParamSpecChar : gobject.param_spec.ParamSpec
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gobject.param_spec_char.ParamSpecChar");

    super(cast(GParamSpec*)ptr, take);
  }
}
