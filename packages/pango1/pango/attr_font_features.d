module pango.attr_font_features;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
 * The `PangoAttrFontFeatures` structure is used to represent OpenType
 * font features as an attribute.
 */
class AttrFontFeatures
{
  PangoAttrFontFeatures cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Pango.AttrFontFeatures");

    cInstance = *cast(PangoAttrFontFeatures*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property pango.attribute.Attribute attr()
  {
    return new pango.attribute.Attribute(cast(PangoAttribute*)&(cast(PangoAttrFontFeatures*)cPtr).attr);
  }

  @property string features()
  {
    return (cast(PangoAttrFontFeatures*)cPtr).features.fromCString(No.Free);
  }

  @property void features(string propval)
  {
    safeFree(cast(void*)(cast(PangoAttrFontFeatures*)cPtr).features);
    (cast(PangoAttrFontFeatures*)cPtr).features = propval.toCString(Yes.Alloc);
  }

  /**
   * Create a new font features tag attribute.
   * You can use this attribute to select OpenType font features like small-caps,
   * alternative glyphs, ligatures, etc. for fonts that support them.
   * Params:
   *   features = a string with OpenType font features, with the syntax of the [CSS
   *     font-feature-settings property]$(LPAREN)https://www.w3.org/TR/css-fonts-4/#font-rend-desc$(RPAREN)
   * Returns: the newly allocated
   *   `PangoAttribute`, which should be freed with
   *   [pango.attribute.Attribute.destroy]
   */
  static pango.attribute.Attribute new_(string features)
  {
    PangoAttribute* _cretval;
    const(char)* _features = features.toCString(No.Alloc);
    _cretval = pango_attr_font_features_new(_features);
    auto _retval = _cretval ? new pango.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
