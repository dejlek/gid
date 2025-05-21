/// Module for [ColorStop] class
module harfbuzz.color_stop;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Information about a color stop on a color line.
    
    Color lines typically have offsets ranging between 0 and 1,
    but that is not required.
    
    Note: despite @color being unpremultiplied here, interpolation in
    gradients shall happen in premultiplied space. See the OpenType spec
    [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
    section for details.
*/
class ColorStop : gobject.boxed.Boxed
{

  /**
      Create a `color_stop.ColorStop` boxed type.
      Params:
        offset = the offset of the color stop
        isForeground = whether the color is the foreground
        color = the color, unpremultiplied
  */
  this(float offset = 0.0, harfbuzz.types.Bool isForeground = harfbuzz.types.Bool.init, harfbuzz.types.Color color = harfbuzz.types.Color.init)
  {
    super(gMalloc(hb_color_stop_t.sizeof), Yes.Take);
    this.offset = offset;
    this.isForeground = isForeground;
    this.color = color;
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
    return cast(void function())hb_gobject_color_stop_get_type != &gidSymbolNotFound ? hb_gobject_color_stop_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorStop self()
  {
    return this;
  }

  /**
      Get `offset` field.
      Returns: the offset of the color stop
  */
  @property float offset()
  {
    return (cast(hb_color_stop_t*)this._cPtr).offset;
  }

  /**
      Set `offset` field.
      Params:
        propval = the offset of the color stop
  */
  @property void offset(float propval)
  {
    (cast(hb_color_stop_t*)this._cPtr).offset = propval;
  }

  /**
      Get `isForeground` field.
      Returns: whether the color is the foreground
  */
  @property harfbuzz.types.Bool isForeground()
  {
    return (cast(hb_color_stop_t*)this._cPtr).isForeground;
  }

  /**
      Set `isForeground` field.
      Params:
        propval = whether the color is the foreground
  */
  @property void isForeground(harfbuzz.types.Bool propval)
  {
    (cast(hb_color_stop_t*)this._cPtr).isForeground = propval;
  }

  /**
      Get `color` field.
      Returns: the color, unpremultiplied
  */
  @property harfbuzz.types.Color color()
  {
    return (cast(hb_color_stop_t*)this._cPtr).color;
  }

  /**
      Set `color` field.
      Params:
        propval = the color, unpremultiplied
  */
  @property void color(harfbuzz.types.Color propval)
  {
    (cast(hb_color_stop_t*)this._cPtr).color = propval;
  }
}
