module harfbuzz.ot_math_glyph_variant;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Data type to hold math-variant information for a glyph.
*/
class OtMathGlyphVariant : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(hb_ot_math_glyph_variant_t.sizeof), Yes.take);
  }

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"dup" dup = No.dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_ot_math_glyph_variant_get_type != &gidSymbolNotFound ? hb_gobject_ot_math_glyph_variant_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property harfbuzz.types.Codepoint glyph()
  {
    return (cast(hb_ot_math_glyph_variant_t*)cPtr).glyph;
  }

  @property void glyph(harfbuzz.types.Codepoint propval)
  {
    (cast(hb_ot_math_glyph_variant_t*)cPtr).glyph = propval;
  }

  @property harfbuzz.types.Position advance()
  {
    return (cast(hb_ot_math_glyph_variant_t*)cPtr).advance;
  }

  @property void advance(harfbuzz.types.Position propval)
  {
    (cast(hb_ot_math_glyph_variant_t*)cPtr).advance = propval;
  }
}
