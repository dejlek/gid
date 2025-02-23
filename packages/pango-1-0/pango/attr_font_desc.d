module pango.attr_font_desc;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.font_description;
import pango.types;

/**
 * The `PangoAttrFontDesc` structure is used to store an attribute that
 * sets all aspects of the font description at once.
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

  @property Attribute attr()
  {
    return new Attribute(cast(PangoAttribute*)&(cast(PangoAttrFontDesc*)cPtr).attr);
  }

  @property FontDescription desc()
  {
    return new FontDescription(cast(PangoFontDescription*)(cast(PangoAttrFontDesc*)cPtr).desc);
  }

  /**
   * Create a new font description attribute.
   * This attribute allows setting family, style, weight, variant,
   * stretch, and size simultaneously.
   * Params:
   *   desc = the font description
   * Returns: the newly allocated
   *   `PangoAttribute`, which should be freed with
   *   [Pango.Attribute.destroy]
   */
  static Attribute new_(FontDescription desc)
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_font_desc_new(desc ? cast(PangoFontDescription*)desc.cPtr(No.Dup) : null);
    auto _retval = _cretval ? new Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
