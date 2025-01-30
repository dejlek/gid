module Pango.AttrLanguage;

import Gid.gid;
import Pango.Attribute;
import Pango.PgLanguage;
import Pango.Types;
import Pango.c.functions;
import Pango.c.types;

/**
 * The `PangoAttrLanguage` structure is used to represent attributes that
 * are languages.
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

  @property Attribute attr()
  {
    return new Attribute(cast(PangoAttribute*)&(cast(PangoAttrLanguage*)cPtr).attr);
  }

  @property PgLanguage value()
  {
    return new PgLanguage(cast(PangoLanguage*)(cast(PangoAttrLanguage*)cPtr).value);
  }

  /**
   * Create a new language tag attribute.
   * Params:
   *   language = language tag
   * Returns: the newly allocated
   *   `PangoAttribute`, which should be freed with
   *   [Pango.Attribute.destroy]
   */
  static Attribute new_(PgLanguage language)
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_language_new(language ? cast(PangoLanguage*)language.cPtr(No.Dup) : null);
    auto _retval = _cretval ? new Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
