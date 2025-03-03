module pango.fontset_simple;

import gid.gid;
import pango.c.functions;
import pango.c.types;
import pango.font;
import pango.fontset;
import pango.language;
import pango.types;

/**
 * `PangoFontsetSimple` is a implementation of the abstract
 * `PangoFontset` base class as an array of fonts.
 * When creating a `PangoFontsetSimple`, you have to provide
 * the array of fonts that make up the fontset.
 */
class FontsetSimple : pango.fontset.Fontset
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_fontset_simple_get_type != &gidSymbolNotFound ? pango_fontset_simple_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `PangoFontsetSimple` for the given language.
   * Params:
   *   language = a `PangoLanguage` tag
   * Returns: the newly allocated `PangoFontsetSimple`
   */
  this(pango.language.Language language)
  {
    PangoFontsetSimple* _cretval;
    _cretval = pango_fontset_simple_new(language ? cast(PangoLanguage*)language.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Adds a font to the fontset.
   * The fontset takes ownership of font.
   * Params:
   *   font = a `PangoFont`.
   */
  void append(pango.font.Font font)
  {
    pango_fontset_simple_append(cast(PangoFontsetSimple*)cPtr, font ? cast(PangoFont*)font.cPtr(Yes.Dup) : null);
  }

  /**
   * Returns the number of fonts in the fontset.
   * Returns: the size of fontset
   */
  int size()
  {
    int _retval;
    _retval = pango_fontset_simple_size(cast(PangoFontsetSimple*)cPtr);
    return _retval;
  }
}
