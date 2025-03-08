module harfbuzz.ot_math_glyph_part;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Data type to hold information for a "part" component of a math-variant glyph.
  Large variants for stretchable math glyphs (such as parentheses) can be constructed
  on the fly from parts.
*/
class OtMathGlyphPart : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(hb_ot_math_glyph_part_t.sizeof), Yes.Take);
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
    return cast(void function())hb_gobject_ot_math_glyph_part_get_type != &gidSymbolNotFound ? hb_gobject_ot_math_glyph_part_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property harfbuzz.types.Codepoint glyph()
  {
    return (cast(hb_ot_math_glyph_part_t*)cPtr).glyph;
  }

  @property void glyph(harfbuzz.types.Codepoint propval)
  {
    (cast(hb_ot_math_glyph_part_t*)cPtr).glyph = propval;
  }

  @property harfbuzz.types.Position startConnectorLength()
  {
    return (cast(hb_ot_math_glyph_part_t*)cPtr).startConnectorLength;
  }

  @property void startConnectorLength(harfbuzz.types.Position propval)
  {
    (cast(hb_ot_math_glyph_part_t*)cPtr).startConnectorLength = propval;
  }

  @property harfbuzz.types.Position endConnectorLength()
  {
    return (cast(hb_ot_math_glyph_part_t*)cPtr).endConnectorLength;
  }

  @property void endConnectorLength(harfbuzz.types.Position propval)
  {
    (cast(hb_ot_math_glyph_part_t*)cPtr).endConnectorLength = propval;
  }

  @property harfbuzz.types.Position fullAdvance()
  {
    return (cast(hb_ot_math_glyph_part_t*)cPtr).fullAdvance;
  }

  @property void fullAdvance(harfbuzz.types.Position propval)
  {
    (cast(hb_ot_math_glyph_part_t*)cPtr).fullAdvance = propval;
  }

  @property harfbuzz.types.OtMathGlyphPartFlags flags()
  {
    return cast(harfbuzz.types.OtMathGlyphPartFlags)(cast(hb_ot_math_glyph_part_t*)cPtr).flags;
  }

  @property void flags(harfbuzz.types.OtMathGlyphPartFlags propval)
  {
    (cast(hb_ot_math_glyph_part_t*)cPtr).flags = cast(hb_ot_math_glyph_part_flags_t)propval;
  }
}
