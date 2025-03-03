module harfbuzz.color_stop;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
 * Information about a color stop on a color line.
 * Color lines typically have offsets ranging between 0 and 1,
 * but that is not required.
 * Note: despite @color being unpremultiplied here, interpolation in
 * gradients shall happen in premultiplied space. See the OpenType spec
 * [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
 * section for details.
 */
class ColorStop : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(hb_color_stop_t.sizeof), Yes.Take);
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
    return cast(void function())hb_gobject_color_stop_get_type != &gidSymbolNotFound ? hb_gobject_color_stop_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  @property float offset()
  {
    return (cast(hb_color_stop_t*)cPtr).offset;
  }

  @property void offset(float propval)
  {
    (cast(hb_color_stop_t*)cPtr).offset = propval;
  }

  @property harfbuzz.types.Bool isForeground()
  {
    return (cast(hb_color_stop_t*)cPtr).isForeground;
  }

  @property void isForeground(harfbuzz.types.Bool propval)
  {
    (cast(hb_color_stop_t*)cPtr).isForeground = propval;
  }

  @property harfbuzz.types.Color color()
  {
    return (cast(hb_color_stop_t*)cPtr).color;
  }

  @property void color(harfbuzz.types.Color propval)
  {
    (cast(hb_color_stop_t*)cPtr).color = propval;
  }
}
