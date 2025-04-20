/// Module for [FontsetSimple] class
module pango.fontset_simple;

import gid.gid;
import pango.c.functions;
import pango.c.types;
import pango.font;
import pango.fontset;
import pango.language;
import pango.types;

/**
    [pango.fontset_simple.FontsetSimple] is a implementation of the abstract
    [pango.fontset.Fontset] base class as an array of fonts.
    
    When creating a [pango.fontset_simple.FontsetSimple], you have to provide
    the array of fonts that make up the fontset.
*/
class FontsetSimple : pango.fontset.Fontset
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_fontset_simple_get_type != &gidSymbolNotFound ? pango_fontset_simple_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FontsetSimple self()
  {
    return this;
  }

  /**
      Creates a new [pango.fontset_simple.FontsetSimple] for the given language.
  
      Params:
        language = a [pango.language.Language] tag
      Returns: the newly allocated [pango.fontset_simple.FontsetSimple]
  */
  this(pango.language.Language language)
  {
    PangoFontsetSimple* _cretval;
    _cretval = pango_fontset_simple_new(language ? cast(PangoLanguage*)language.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Adds a font to the fontset.
      
      The fontset takes ownership of font.
  
      Params:
        font = a [pango.font.Font].
  */
  void append(pango.font.Font font)
  {
    pango_fontset_simple_append(cast(PangoFontsetSimple*)cPtr, font ? cast(PangoFont*)font.cPtr(Yes.Dup) : null);
  }

  /**
      Returns the number of fonts in the fontset.
      Returns: the size of fontset
  */
  int size()
  {
    int _retval;
    _retval = pango_fontset_simple_size(cast(PangoFontsetSimple*)cPtr);
    return _retval;
  }
}
