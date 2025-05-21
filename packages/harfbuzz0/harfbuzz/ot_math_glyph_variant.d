/// Module for [OtMathGlyphVariant] class
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

  /**
      Create a `ot_math_glyph_variant.OtMathGlyphVariant` boxed type.
      Params:
        glyph = The glyph index of the variant
        advance = The advance width of the variant
  */
  this(harfbuzz.types.Codepoint glyph = harfbuzz.types.Codepoint.init, harfbuzz.types.Position advance = harfbuzz.types.Position.init)
  {
    super(gMalloc(hb_ot_math_glyph_variant_t.sizeof), Yes.Take);
    this.glyph = glyph;
    this.advance = advance;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_ot_math_glyph_variant_get_type != &gidSymbolNotFound ? hb_gobject_ot_math_glyph_variant_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override OtMathGlyphVariant self()
  {
    return this;
  }

  /**
      Get `glyph` field.
      Returns: The glyph index of the variant
  */
  @property harfbuzz.types.Codepoint glyph()
  {
    return (cast(hb_ot_math_glyph_variant_t*)this._cPtr).glyph;
  }

  /**
      Set `glyph` field.
      Params:
        propval = The glyph index of the variant
  */
  @property void glyph(harfbuzz.types.Codepoint propval)
  {
    (cast(hb_ot_math_glyph_variant_t*)this._cPtr).glyph = propval;
  }

  /**
      Get `advance` field.
      Returns: The advance width of the variant
  */
  @property harfbuzz.types.Position advance()
  {
    return (cast(hb_ot_math_glyph_variant_t*)this._cPtr).advance;
  }

  /**
      Set `advance` field.
      Params:
        propval = The advance width of the variant
  */
  @property void advance(harfbuzz.types.Position propval)
  {
    (cast(hb_ot_math_glyph_variant_t*)this._cPtr).advance = propval;
  }
}
