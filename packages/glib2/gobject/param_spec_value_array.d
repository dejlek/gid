module gobject.param_spec_value_array;

import gid.global;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
 * A #GParamSpec derived structure that contains the meta data for #GValueArray properties.
 */
class ParamSpecValueArray : ParamSpec
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.ParamSpecValueArray");

    super(cast(GParamSpec*)ptr, take);
  }
}
