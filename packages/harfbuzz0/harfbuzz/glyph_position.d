module harfbuzz.glyph_position;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    The #hb_glyph_position_t is the structure that holds the positions of the
  glyph in both horizontal and vertical directions. All positions in
  #hb_glyph_position_t are relative to the current point.
*/
class GlyphPosition : gobject.boxed.Boxed
{

  this()
  {
    super(gMalloc(hb_glyph_position_t.sizeof), Yes.Take);
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
    return cast(void function())hb_gobject_glyph_position_get_type != &gidSymbolNotFound ? hb_gobject_glyph_position_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override GlyphPosition self()
  {
    return this;
  }

  @property harfbuzz.types.Position xAdvance()
  {
    return (cast(hb_glyph_position_t*)cPtr).xAdvance;
  }

  @property void xAdvance(harfbuzz.types.Position propval)
  {
    (cast(hb_glyph_position_t*)cPtr).xAdvance = propval;
  }

  @property harfbuzz.types.Position yAdvance()
  {
    return (cast(hb_glyph_position_t*)cPtr).yAdvance;
  }

  @property void yAdvance(harfbuzz.types.Position propval)
  {
    (cast(hb_glyph_position_t*)cPtr).yAdvance = propval;
  }

  @property harfbuzz.types.Position xOffset()
  {
    return (cast(hb_glyph_position_t*)cPtr).xOffset;
  }

  @property void xOffset(harfbuzz.types.Position propval)
  {
    (cast(hb_glyph_position_t*)cPtr).xOffset = propval;
  }

  @property harfbuzz.types.Position yOffset()
  {
    return (cast(hb_glyph_position_t*)cPtr).yOffset;
  }

  @property void yOffset(harfbuzz.types.Position propval)
  {
    (cast(hb_glyph_position_t*)cPtr).yOffset = propval;
  }
}
