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
      throw new GidConstructException("Null instance pointer for pango.attr_float.AttrFloat");

    cInstance = *cast(PangoAttrFloat*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `attr` field.
      Returns: the common portion of the attribute
  */
  @property pango.attribute.Attribute attr()
  {
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrFloat*)cPtr).attr);
  }

  /**
      Get `value` field.
      Returns: the value of the attribute
  */
  @property double value()
  {
    return (cast(PangoAttrFloat*)cPtr).value;
  }

  /**
      Set `value` field.
      Params:
        propval = the value of the attribute
  */
  @property void value(double propval)
  {
    (cast(PangoAttrFloat*)cPtr).value = propval;
  }
}
