module pango.attr_font_desc;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.font_description;
import pango.types;

/**
    The [pango.attr_font_desc.AttrFontDesc] structure is used to store an attribute that
  sets all aspects of the font description at once.
*/
class AttrFontDesc
{
  PangoAttrFontDesc cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Pango.AttrFontDesc");

    cInstance = *cast(PangoAttrFontDesc*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property pango.attribute.Attribute attr()
  {
    return new pango.attribute.Attribute(cast(PangoAttribute*)&(cast(PangoAttrFontDesc*)cPtr).attr);
  }

  @property pango.font_description.FontDescription desc()
  {
    return new pango.font_description.FontDescription(cast(PangoFontDescription*)(cast(PangoAttrFontDesc*)cPtr).desc);
  }

  /**
      Create a new font description attribute.
    
    This attribute allows setting family, style, weight, variant,
    stretch, and size simultaneously.
    Params:
      desc =       the font description
    Returns:     the newly allocated
        [pango.attribute.Attribute], which should be freed with
        [pango.attribute.Attribute.destroy]
  */
  static pango.attribute.Attribute new_(pango.font_description.FontDescription desc)
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_font_desc_new(desc ? cast(const(PangoFontDescription)*)desc.cPtr(No.Dup) : null);
    auto _retval = _cretval ? new pango.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
