module harfbuzz.glyph_info;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    The #hb_glyph_info_t is the structure that holds information about the
  glyphs and their relation to input text.
*/
class GlyphInfo : gobject.boxed.Boxed
{

  this()
  {
    super(gMalloc(hb_glyph_info_t.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_glyph_info_get_type != &gidSymbolNotFound ? hb_gobject_glyph_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property harfbuzz.types.Codepoint codepoint()
  {
    return (cast(hb_glyph_info_t*)cPtr).codepoint;
  }

  @property void codepoint(harfbuzz.types.Codepoint propval)
  {
    (cast(hb_glyph_info_t*)cPtr).codepoint = propval;
  }

  @property uint cluster()
  {
    return (cast(hb_glyph_info_t*)cPtr).cluster;
  }

  @property void cluster(uint propval)
  {
    (cast(hb_glyph_info_t*)cPtr).cluster = propval;
  }
}
