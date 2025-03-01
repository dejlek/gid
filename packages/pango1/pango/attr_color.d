module pango.attr_color;

import gid.global;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.color;
import pango.types;

/**
 * The `PangoAttrColor` structure is used to represent attributes that
 * are colors.
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
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property Attribute attr()
  {
    return new Attribute(cast(PangoAttribute*)&(cast(PangoAttrColor*)cPtr).attr);
  }

  @property Color color()
  {
    return new Color(cast(PangoColor*)&(cast(PangoAttrColor*)cPtr).color);
  }
}
