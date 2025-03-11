module pango.attr_int;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    The [pango.attr_int.AttrInt] structure is used to represent attributes with
  an integer or enumeration value.
*/
class AttrInt
{
  PangoAttrInt cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Pango.AttrInt");

    cInstance = *cast(PangoAttrInt*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property pango.attribute.Attribute attr()
  {
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrInt*)cPtr).attr);
  }

  @property int value()
  {
    return (cast(PangoAttrInt*)cPtr).value;
  }

  @property void value(int propval)
  {
    (cast(PangoAttrInt*)cPtr).value = propval;
  }
}
