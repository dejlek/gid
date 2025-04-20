/// Module for [GlyphInfo] class
module pango.glyph_info;

import gid.gid;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    A [pango.glyph_info.GlyphInfo] structure represents a single glyph with
    positioning information and visual attributes.
*/
class GlyphInfo
{
  PangoGlyphInfo cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for pango.glyph_info.GlyphInfo");

    cInstance = *cast(PangoGlyphInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `glyph` field.
      Returns: the glyph itself.
  */
  @property pango.types.Glyph glyph()
  {
    return (cast(PangoGlyphInfo*)cPtr).glyph;
  }

  /**
      Set `glyph` field.
      Params:
        propval = the glyph itself.
  */
  @property void glyph(pango.types.Glyph propval)
  {
    (cast(PangoGlyphInfo*)cPtr).glyph = propval;
  }

  /**
      Get `geometry` field.
      Returns: the positional information about the glyph.
  */
  @property pango.types.GlyphGeometry geometry()
  {
    return cToD!(pango.types.GlyphGeometry)(cast(void*)&(cast(PangoGlyphInfo*)cPtr).geometry);
  }

  /**
      Set `geometry` field.
      Params:
        propval = the positional information about the glyph.
  */
  @property void geometry(pango.types.GlyphGeometry propval)
  {
    (cast(PangoGlyphInfo*)cPtr).geometry = propval;
  }

  /**
      Get `attr` field.
      Returns: the visual attributes of the glyph.
  */
  @property pango.types.GlyphVisAttr attr()
  {
    return cToD!(pango.types.GlyphVisAttr)(cast(void*)&(cast(PangoGlyphInfo*)cPtr).attr);
  }

  /**
      Set `attr` field.
      Params:
        propval = the visual attributes of the glyph.
  */
  @property void attr(pango.types.GlyphVisAttr propval)
  {
    (cast(PangoGlyphInfo*)cPtr).attr = propval;
  }
}
