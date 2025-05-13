/// Module for [Glyph] class
module cairo.glyph;

import cairo.c.functions;
import cairo.c.types;
import cairo.types;
import gid.gid;
import gobject.boxed;

/**
    The #cairo_glyph_t structure holds information about a single glyph
    when drawing or measuring text. A font is (in simple terms) a
    collection of shapes used to draw text. A glyph is one of these
    shapes. There can be multiple glyphs for a single character
    (alternates to be used in different contexts, for example), or a
    glyph can be a <firstterm>ligature</firstterm> of multiple
    characters. Cairo doesn't expose any way of converting input text
    into glyphs, so in order to use the Cairo interfaces that take
    arrays of glyphs, you must directly access the appropriate
    underlying font system.
    
    Note that the offsets given by @x and @y are not cumulative. When
    drawing or measuring text, each glyph is individually positioned
    with respect to the overall origin
*/
class Glyph : gobject.boxed.Boxed
{

  /**
      Create a `glyph.Glyph` boxed type.
      Params:
        index = glyph index in the font. The exact interpretation of the
               glyph index depends on the font technology being used.
        x = the offset in the X direction between the origin used for
              drawing or measuring the string and the origin of this glyph.
        y = the offset in the Y direction between the origin used for
              drawing or measuring the string and the origin of this glyph.
  */
  this(gulong index = gulong.init, double x = 0.0, double y = 0.0)
  {
    super(gMalloc(cairo_glyph_t.sizeof), Yes.Take);
    this.index = index;
    this.x = x;
    this.y = y;
  }

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
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
    return cast(void function())cairo_gobject_glyph_get_type != &gidSymbolNotFound ? cairo_gobject_glyph_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Glyph self()
  {
    return this;
  }

  /**
      Get `index` field.
      Returns: glyph index in the font. The exact interpretation of the
           glyph index depends on the font technology being used.
  */
  @property gulong index()
  {
    return (cast(cairo_glyph_t*)this._cPtr).index;
  }

  /**
      Set `index` field.
      Params:
        propval = glyph index in the font. The exact interpretation of the
             glyph index depends on the font technology being used.
  */
  @property void index(gulong propval)
  {
    (cast(cairo_glyph_t*)this._cPtr).index = propval;
  }

  /**
      Get `x` field.
      Returns: the offset in the X direction between the origin used for
          drawing or measuring the string and the origin of this glyph.
  */
  @property double x()
  {
    return (cast(cairo_glyph_t*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = the offset in the X direction between the origin used for
            drawing or measuring the string and the origin of this glyph.
  */
  @property void x(double propval)
  {
    (cast(cairo_glyph_t*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: the offset in the Y direction between the origin used for
          drawing or measuring the string and the origin of this glyph.
  */
  @property double y()
  {
    return (cast(cairo_glyph_t*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = the offset in the Y direction between the origin used for
            drawing or measuring the string and the origin of this glyph.
  */
  @property void y(double propval)
  {
    (cast(cairo_glyph_t*)this._cPtr).y = propval;
  }
}
