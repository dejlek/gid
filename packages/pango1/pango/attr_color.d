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

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Pango.AttrColor");

    cInstance = *cast(PangoAttrColor*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property pango.attribute.Attribute attr()
  {
    return new pango.attribute.Attribute(cast(PangoAttribute*)&(cast(PangoAttrColor*)cPtr).attr);
  }

  @property pango.color.Color color()
  {
    return new pango.color.Color(cast(PangoColor*)&(cast(PangoAttrColor*)cPtr).color);
  }
}
