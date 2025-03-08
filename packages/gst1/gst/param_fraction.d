module gst.param_fraction;

import gid.gid;
import gobject.param_spec;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    A fundamental type that describes a #GParamSpec for fractional
  properties
*/
class ParamFraction : gobject.param_spec.ParamSpec
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gst.ParamFraction");

    super(cast(GParamSpec*)ptr, take);
  }
}
