module pango.attr_font_features;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    The [pango.attr_font_features.AttrFontFeatures] structure is used to represent OpenType
  font features as an attribute.
*/
class AttrFontFeatures
{
  PangoAttrFontFeatures cInstance;

  this(void* ptr, Flag!"take" take = No.take)
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
    return (cast(PangoAttrFontFeatures*)cPtr).features.fromCString(No.free);
  }

  @property void features(string propval)
  {
    safeFree(cast(void*)(cast(PangoAttrFontFeatures*)cPtr).features);
    (cast(PangoAttrFontFeatures*)cPtr).features = propval.toCString(Yes.alloc);
  }

  /**
      Create a new font features tag attribute.
    
    You can use this attribute to select OpenType font features like small-caps,
    alternative glyphs, ligatures, etc. for fonts that support them.
    Params:
      features =       a string with OpenType font features, with the syntax of the [CSS
        font-feature-settings property](https://www.w3.org/TR/css-fonts-4/#font-rend-desc)
    Returns:     the newly allocated
        [pango.attribute.Attribute], which should be freed with
        [pango.attribute.Attribute.destroy]
  */
  static pango.attribute.Attribute new_(string features)
  {
    PangoAttribute* _cretval;
    const(char)* _features = features.toCString(No.alloc);
    _cretval = pango_attr_font_features_new(_features);
    auto _retval = _cretval ? new pango.attribute.Attribute(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }
}
