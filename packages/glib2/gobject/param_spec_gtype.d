module gobject.param_spec_gtype;

import gid.global;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
 * A #GParamSpec derived structure that contains the meta data for #GType properties.
 */
class ParamSpecGType : ParamSpec
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.ParamSpecGType");

    super(cast(GParamSpec*)ptr, take);
  }
}
