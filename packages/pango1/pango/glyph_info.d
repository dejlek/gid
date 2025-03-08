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

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Pango.GlyphInfo");

    cInstance = *cast(PangoGlyphInfo*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property pango.types.Glyph glyph()
  {
    return (cast(PangoGlyphInfo*)cPtr).glyph;
  }

  @property void glyph(pango.types.Glyph propval)
  {
    (cast(PangoGlyphInfo*)cPtr).glyph = propval;
  }

  @property pango.types.GlyphGeometry geometry()
  {
    return (cast(PangoGlyphInfo*)cPtr).geometry;
  }

  @property void geometry(pango.types.GlyphGeometry propval)
  {
    (cast(PangoGlyphInfo*)cPtr).geometry = propval;
  }

  @property pango.types.GlyphVisAttr attr()
  {
    return (cast(PangoGlyphInfo*)cPtr).attr;
  }

  @property void attr(pango.types.GlyphVisAttr propval)
  {
    (cast(PangoGlyphInfo*)cPtr).attr = propval;
  }
}
