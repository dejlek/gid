module harfbuzz.draw_state;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
 * Current drawing state.
 */
class DrawState : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(hb_draw_state_t.sizeof), Yes.Take);
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
    return cast(void function())hb_gobject_draw_state_get_type != &gidSymbolNotFound ? hb_gobject_draw_state_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  @property harfbuzz.types.Bool pathOpen()
  {
    return (cast(hb_draw_state_t*)cPtr).pathOpen;
  }

  @property void pathOpen(harfbuzz.types.Bool propval)
  {
    (cast(hb_draw_state_t*)cPtr).pathOpen = propval;
  }

  @property float pathStartX()
  {
    return (cast(hb_draw_state_t*)cPtr).pathStartX;
  }

  @property void pathStartX(float propval)
  {
    (cast(hb_draw_state_t*)cPtr).pathStartX = propval;
  }

  @property float pathStartY()
  {
    return (cast(hb_draw_state_t*)cPtr).pathStartY;
  }

  @property void pathStartY(float propval)
  {
    (cast(hb_draw_state_t*)cPtr).pathStartY = propval;
  }

  @property float currentX()
  {
    return (cast(hb_draw_state_t*)cPtr).currentX;
  }

  @property void currentX(float propval)
  {
    (cast(hb_draw_state_t*)cPtr).currentX = propval;
  }

  @property float currentY()
  {
    return (cast(hb_draw_state_t*)cPtr).currentY;
  }

  @property void currentY(float propval)
  {
    (cast(hb_draw_state_t*)cPtr).currentY = propval;
  }
}
