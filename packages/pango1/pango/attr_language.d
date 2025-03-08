module pango.attr_language;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.language;
import pango.types;

/**
    The [pango.attr_language.AttrLanguage] structure is used to represent attributes that
  are languages.
*/
class AttrLanguage
{
  PangoAttrLanguage cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Pango.AttrLanguage");

    cInstance = *cast(PangoAttrLanguage*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property pango.attribute.Attribute attr()
  {
    return new pango.attribute.Attribute(cast(PangoAttribute*)&(cast(PangoAttrLanguage*)cPtr).attr);
  }

  @property pango.language.Language value()
  {
    return new pango.language.Language(cast(PangoLanguage*)(cast(PangoAttrLanguage*)cPtr).value);
  }

  /**
      Create a new language tag attribute.
    Params:
      language =       language tag
    Returns:     the newly allocated
        [pango.attribute.Attribute], which should be freed with
        [pango.attribute.Attribute.destroy]
  */
  static pango.attribute.Attribute new_(pango.language.Language language)
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_language_new(language ? cast(PangoLanguage*)language.cPtr(No.Dup) : null);
    auto _retval = _cretval ? new pango.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
