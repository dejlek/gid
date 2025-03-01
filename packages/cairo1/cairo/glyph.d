module cairo.glyph;

import cairo.c.functions;
import cairo.c.types;
import cairo.types;
import gid.global;
import gobject.boxed;

/**
 * The #cairo_glyph_t structure holds information about a single glyph
 * when drawing or measuring text. A font is $(LPAREN)in simple terms$(RPAREN) a
 * collection of shapes used to draw text. A glyph is one of these
 * shapes. There can be multiple glyphs for a single character
 * $(LPAREN)alternates to be used in different contexts, for example$(RPAREN), or a
 * glyph can be a <firstterm>ligature</firstterm> of multiple
 * characters. Cairo doesn't expose any way of converting input text
 * into glyphs, so in order to use the Cairo interfaces that take
 * arrays of glyphs, you must directly access the appropriate
 * underlying font system.
 * Note that the offsets given by @x and @y are not cumulative. When
 * drawing or measuring text, each glyph is individually positioned
 * with respect to the overall origin
 */
class Glyph : Boxed
{

  this()
  {
    super(safeMalloc(cairo_glyph_t.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())cairo_gobject_glyph_get_type != &gidSymbolNotFound ? cairo_gobject_glyph_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  @property gulong index()
  {
    return (cast(cairo_glyph_t*)cPtr).index;
  }

  @property void index(gulong propval)
  {
    (cast(cairo_glyph_t*)cPtr).index = propval;
  }

  @property double x()
  {
    return (cast(cairo_glyph_t*)cPtr).x;
  }

  @property void x(double propval)
  {
    (cast(cairo_glyph_t*)cPtr).x = propval;
  }

  @property double y()
  {
    return (cast(cairo_glyph_t*)cPtr).y;
  }

  @property void y(double propval)
  {
    (cast(cairo_glyph_t*)cPtr).y = propval;
  }
}
