/// Module for [OtMathGlyphPart] class
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

  /**
      Create a `ot_math_glyph_part.OtMathGlyphPart` boxed type.
      Params:
        glyph = The glyph index of the variant part
        startConnectorLength = The length of the connector on the starting side of the variant part
        endConnectorLength = The length of the connector on the ending side of the variant part
        fullAdvance = The total advance of the part
        flags = #hb_ot_math_glyph_part_flags_t flags for the part
  */
  this(harfbuzz.types.Codepoint glyph = harfbuzz.types.Codepoint.init, harfbuzz.types.Position startConnectorLength = harfbuzz.types.Position.init, harfbuzz.types.Position endConnectorLength = harfbuzz.types.Position.init, harfbuzz.types.Position fullAdvance = harfbuzz.types.Position.init, harfbuzz.types.OtMathGlyphPartFlags flags = harfbuzz.types.OtMathGlyphPartFlags.init)
  {
    super(gMalloc(hb_ot_math_glyph_part_t.sizeof), Yes.Take);
    this.glyph = glyph;
    this.startConnectorLength = startConnectorLength;
    this.endConnectorLength = endConnectorLength;
    this.fullAdvance = fullAdvance;
    this.flags = flags;
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
    return cast(void function())hb_gobject_ot_math_glyph_part_get_type != &gidSymbolNotFound ? hb_gobject_ot_math_glyph_part_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override OtMathGlyphPart self()
  {
    return this;
  }

  /**
      Get `glyph` field.
      Returns: The glyph index of the variant part
  */
  @property harfbuzz.types.Codepoint glyph()
  {
    return (cast(hb_ot_math_glyph_part_t*)this._cPtr).glyph;
  }

  /**
      Set `glyph` field.
      Params:
        propval = The glyph index of the variant part
  */
  @property void glyph(harfbuzz.types.Codepoint propval)
  {
    (cast(hb_ot_math_glyph_part_t*)this._cPtr).glyph = propval;
  }

  /**
      Get `startConnectorLength` field.
      Returns: The length of the connector on the starting side of the variant part
  */
  @property harfbuzz.types.Position startConnectorLength()
  {
    return (cast(hb_ot_math_glyph_part_t*)this._cPtr).startConnectorLength;
  }

  /**
      Set `startConnectorLength` field.
      Params:
        propval = The length of the connector on the starting side of the variant part
  */
  @property void startConnectorLength(harfbuzz.types.Position propval)
  {
    (cast(hb_ot_math_glyph_part_t*)this._cPtr).startConnectorLength = propval;
  }

  /**
      Get `endConnectorLength` field.
      Returns: The length of the connector on the ending side of the variant part
  */
  @property harfbuzz.types.Position endConnectorLength()
  {
    return (cast(hb_ot_math_glyph_part_t*)this._cPtr).endConnectorLength;
  }

  /**
      Set `endConnectorLength` field.
      Params:
        propval = The length of the connector on the ending side of the variant part
  */
  @property void endConnectorLength(harfbuzz.types.Position propval)
  {
    (cast(hb_ot_math_glyph_part_t*)this._cPtr).endConnectorLength = propval;
  }

  /**
      Get `fullAdvance` field.
      Returns: The total advance of the part
  */
  @property harfbuzz.types.Position fullAdvance()
  {
    return (cast(hb_ot_math_glyph_part_t*)this._cPtr).fullAdvance;
  }

  /**
      Set `fullAdvance` field.
      Params:
        propval = The total advance of the part
  */
  @property void fullAdvance(harfbuzz.types.Position propval)
  {
    (cast(hb_ot_math_glyph_part_t*)this._cPtr).fullAdvance = propval;
  }

  /**
      Get `flags` field.
      Returns: #hb_ot_math_glyph_part_flags_t flags for the part
  */
  @property harfbuzz.types.OtMathGlyphPartFlags flags()
  {
    return cast(harfbuzz.types.OtMathGlyphPartFlags)(cast(hb_ot_math_glyph_part_t*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = #hb_ot_math_glyph_part_flags_t flags for the part
  */
  @property void flags(harfbuzz.types.OtMathGlyphPartFlags propval)
  {
    (cast(hb_ot_math_glyph_part_t*)this._cPtr).flags = cast(hb_ot_math_glyph_part_flags_t)propval;
  }
}
