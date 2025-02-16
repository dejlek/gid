module HarfBuzz.ColorLine;

import GObject.Boxed;
import Gid.gid;
import HarfBuzz.Types;
import HarfBuzz.c.functions;
import HarfBuzz.c.types;

/**
 * A struct containing color information for a gradient.
 */
class ColorLine : Boxed
{

  this()
  {
    super(safeMalloc(hb_color_line_t.sizeof), Yes.Take);
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
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_color_line_get_type != &gidSymbolNotFound ? hb_gobject_color_line_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  @property hb_color_line_get_color_stops_func_t getColorStops()
  {
    return (cast(hb_color_line_t*)cPtr).getColorStops;
  }

  @property void getColorStops(hb_color_line_get_color_stops_func_t propval)
  {
    (cast(hb_color_line_t*)cPtr).getColorStops = propval;
  }

  @property hb_color_line_get_extend_func_t getExtend()
  {
    return (cast(hb_color_line_t*)cPtr).getExtend;
  }

  @property void getExtend(hb_color_line_get_extend_func_t propval)
  {
    (cast(hb_color_line_t*)cPtr).getExtend = propval;
  }
}
