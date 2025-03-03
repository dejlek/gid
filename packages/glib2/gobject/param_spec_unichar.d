module gobject.param_spec_unichar;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
 * A #GParamSpec derived structure that contains the meta data for unichar $(LPAREN)unsigned integer$(RPAREN) properties.
 */
class ParamSpecUnichar : gobject.param_spec.ParamSpec
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.ParamSpecUnichar");

    super(cast(GParamSpec*)ptr, take);
  }
}
