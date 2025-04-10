/// Module for [AttrFloat] class
module pango.attr_float;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    The [pango.attr_float.AttrFloat] structure is used to represent attributes with
    a float or double value.
*/
class AttrFloat
{
  PangoAttrFloat cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Pango.AttrFloat");

    cInstance = *cast(PangoAttrFloat*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property pango.attribute.Attribute attr()
  {
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrFloat*)cPtr).attr);
  }

  @property double value()
  {
    return (cast(PangoAttrFloat*)cPtr).value;
  }

  @property void value(double propval)
  {
    (cast(PangoAttrFloat*)cPtr).value = propval;
  }
}
