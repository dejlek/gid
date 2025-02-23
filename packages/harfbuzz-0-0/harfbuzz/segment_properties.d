module harfbuzz.segment_properties;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
 * The structure that holds various text properties of an #hb_buffer_t. Can be
 * set and retrieved using [HarfBuzz.Global.bufferSetSegmentProperties] and
 * [HarfBuzz.Global.bufferGetSegmentProperties], respectively.
 */
class SegmentProperties : Boxed
{

  this()
  {
    super(safeMalloc(hb_segment_properties_t.sizeof), Yes.Take);
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
    return cast(void function())hb_gobject_segment_properties_get_type != &gidSymbolNotFound ? hb_gobject_segment_properties_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  @property Direction direction()
  {
    return cast(Direction)(cast(hb_segment_properties_t*)cPtr).direction;
  }

  @property void direction(Direction propval)
  {
    (cast(hb_segment_properties_t*)cPtr).direction = cast(hb_direction_t)propval;
  }

  @property Script script()
  {
    return cast(Script)(cast(hb_segment_properties_t*)cPtr).script;
  }

  @property void script(Script propval)
  {
    (cast(hb_segment_properties_t*)cPtr).script = cast(hb_script_t)propval;
  }

  @property language_t language()
  {
    return (cast(hb_segment_properties_t*)cPtr).language;
  }

  @property void language(language_t propval)
  {
    (cast(hb_segment_properties_t*)cPtr).language = propval;
  }
}
