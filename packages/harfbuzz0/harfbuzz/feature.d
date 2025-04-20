/// Module for [Feature] class
module harfbuzz.feature;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    The #hb_feature_t is the structure that holds information about requested
    feature application. The feature will be applied with the given value to all
    glyphs which are in clusters between @start (inclusive) and @end (exclusive).
    Setting start to #HB_FEATURE_GLOBAL_START and end to #HB_FEATURE_GLOBAL_END
    specifies that the feature always applies to the entire buffer.
*/
class Feature : gobject.boxed.Boxed
{

  /**
      Create a `feature.Feature` boxed type.
      Params:
        tag = The #hb_tag_t tag of the feature
        value = The value of the feature. 0 disables the feature, non-zero (usually
          1) enables the feature.  For features implemented as lookup type 3 (like
          'salt') the @value is a one based index into the alternates.
        start = the cluster to start applying this feature setting (inclusive).
        end = the cluster to end applying this feature setting (exclusive).
  */
  this(harfbuzz.types.Tag tag = harfbuzz.types.Tag.init, uint value = uint.init, uint start = uint.init, uint end = uint.init)
  {
    super(gMalloc(hb_feature_t.sizeof), Yes.Take);
    this.tag = tag;
    this.value = value;
    this.start = start;
    this.end = end;
  }

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_feature_get_type != &gidSymbolNotFound ? hb_gobject_feature_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Feature self()
  {
    return this;
  }

  /**
      Get `tag` field.
      Returns: The #hb_tag_t tag of the feature
  */
  @property harfbuzz.types.Tag tag()
  {
    return (cast(hb_feature_t*)cPtr).tag;
  }

  /**
      Set `tag` field.
      Params:
        propval = The #hb_tag_t tag of the feature
  */
  @property void tag(harfbuzz.types.Tag propval)
  {
    (cast(hb_feature_t*)cPtr).tag = propval;
  }

  /**
      Get `value` field.
      Returns: The value of the feature. 0 disables the feature, non-zero (usually
      1) enables the feature.  For features implemented as lookup type 3 (like
      'salt') the @value is a one based index into the alternates.
  */
  @property uint value()
  {
    return (cast(hb_feature_t*)cPtr).value;
  }

  /**
      Set `value` field.
      Params:
        propval = The value of the feature. 0 disables the feature, non-zero (usually
        1) enables the feature.  For features implemented as lookup type 3 (like
        'salt') the @value is a one based index into the alternates.
  */
  @property void value(uint propval)
  {
    (cast(hb_feature_t*)cPtr).value = propval;
  }

  /**
      Get `start` field.
      Returns: the cluster to start applying this feature setting (inclusive).
  */
  @property uint start()
  {
    return (cast(hb_feature_t*)cPtr).start;
  }

  /**
      Set `start` field.
      Params:
        propval = the cluster to start applying this feature setting (inclusive).
  */
  @property void start(uint propval)
  {
    (cast(hb_feature_t*)cPtr).start = propval;
  }

  /**
      Get `end` field.
      Returns: the cluster to end applying this feature setting (exclusive).
  */
  @property uint end()
  {
    return (cast(hb_feature_t*)cPtr).end;
  }

  /**
      Set `end` field.
      Params:
        propval = the cluster to end applying this feature setting (exclusive).
  */
  @property void end(uint propval)
  {
    (cast(hb_feature_t*)cPtr).end = propval;
  }
}
