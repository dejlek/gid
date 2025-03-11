module pango.attr_color;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.color;
import pango.types;

/**
    The [pango.attr_color.AttrColor] structure is used to represent attributes that
  are colors.
*/
class AttrColor
{
  PangoAttrColor cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Pango.AttrColor");

    cInstance = *cast(PangoAttrColor*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property pango.attribute.Attribute attr()
  {
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrColor*)cPtr).attr);
  }

  @property pango.color.Color color()
  {
    return cToD!(pango.color.Color)(cast(void*)&(cast(PangoAttrColor*)cPtr).color);
  }
}
