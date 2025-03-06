module harfbuzz.segment_properties;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    The structure that holds various text properties of an #hb_buffer_t. Can be
  set and retrieved using [harfbuzz.global.bufferSetSegmentProperties] and
  [harfbuzz.global.bufferGetSegmentProperties], respectively.
*/
class SegmentProperties : gobject.boxed.Boxed
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

  @property harfbuzz.types.Direction direction()
  {
    return cast(harfbuzz.types.Direction)(cast(hb_segment_properties_t*)cPtr).direction;
  }

  @property void direction(harfbuzz.types.Direction propval)
  {
    (cast(hb_segment_properties_t*)cPtr).direction = cast(hb_direction_t)propval;
  }

  @property harfbuzz.types.Script script()
  {
    return cast(harfbuzz.types.Script)(cast(hb_segment_properties_t*)cPtr).script;
  }

  @property void script(harfbuzz.types.Script propval)
  {
    (cast(hb_segment_properties_t*)cPtr).script = cast(hb_script_t)propval;
  }

  @property harfbuzz.types.Language language()
  {
    return (cast(hb_segment_properties_t*)cPtr).language;
  }

  @property void language(harfbuzz.types.Language propval)
  {
    (cast(hb_segment_properties_t*)cPtr).language = propval;
  }
}
