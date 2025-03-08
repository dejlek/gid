module gstvideo.video_time_code_interval;

import gid.gid;
import gobject.boxed;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    A representation of a difference between two #GstVideoTimeCode instances.
  Will not necessarily correspond to a real timecode (e.g. 00:00:10;00)
*/
class VideoTimeCodeInterval : gobject.boxed.Boxed
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"dup" dup = No.dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_video_time_code_interval_get_type != &gidSymbolNotFound ? gst_video_time_code_interval_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property uint hours()
  {
    return (cast(GstVideoTimeCodeInterval*)cPtr).hours;
  }

  @property void hours(uint propval)
  {
    (cast(GstVideoTimeCodeInterval*)cPtr).hours = propval;
  }

  @property uint minutes()
  {
    return (cast(GstVideoTimeCodeInterval*)cPtr).minutes;
  }

  @property void minutes(uint propval)
  {
    (cast(GstVideoTimeCodeInterval*)cPtr).minutes = propval;
  }

  @property uint seconds()
  {
    return (cast(GstVideoTimeCodeInterval*)cPtr).seconds;
  }

  @property void seconds(uint propval)
  {
    (cast(GstVideoTimeCodeInterval*)cPtr).seconds = propval;
  }

  @property uint frames()
  {
    return (cast(GstVideoTimeCodeInterval*)cPtr).frames;
  }

  @property void frames(uint propval)
  {
    (cast(GstVideoTimeCodeInterval*)cPtr).frames = propval;
  }

  /** */
  this(uint hours, uint minutes, uint seconds, uint frames)
  {
    GstVideoTimeCodeInterval* _cretval;
    _cretval = gst_video_time_code_interval_new(hours, minutes, seconds, frames);
    this(_cretval, Yes.take);
  }

  /**
      tc_inter_str must only have ":" as separators.
    Params:
      tcInterStr =       The string that represents the #GstVideoTimeCodeInterval
    Returns:     a new #GstVideoTimeCodeInterval from the given string
        or null if the string could not be passed.
  */
  static gstvideo.video_time_code_interval.VideoTimeCodeInterval newFromString(string tcInterStr)
  {
    GstVideoTimeCodeInterval* _cretval;
    const(char)* _tcInterStr = tcInterStr.toCString(No.alloc);
    _cretval = gst_video_time_code_interval_new_from_string(_tcInterStr);
    auto _retval = _cretval ? new gstvideo.video_time_code_interval.VideoTimeCodeInterval(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Initializes tc with empty/zero/NULL values.
  */
  void clear()
  {
    gst_video_time_code_interval_clear(cast(GstVideoTimeCodeInterval*)cPtr);
  }

  /** */
  gstvideo.video_time_code_interval.VideoTimeCodeInterval copy()
  {
    GstVideoTimeCodeInterval* _cretval;
    _cretval = gst_video_time_code_interval_copy(cast(const(GstVideoTimeCodeInterval)*)cPtr);
    auto _retval = _cretval ? new gstvideo.video_time_code_interval.VideoTimeCodeInterval(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Initializes tc with the given values.
    Params:
      hours =       the hours field of #GstVideoTimeCodeInterval
      minutes =       the minutes field of #GstVideoTimeCodeInterval
      seconds =       the seconds field of #GstVideoTimeCodeInterval
      frames =       the frames field of #GstVideoTimeCodeInterval
  */
  void init_(uint hours, uint minutes, uint seconds, uint frames)
  {
    gst_video_time_code_interval_init(cast(GstVideoTimeCodeInterval*)cPtr, hours, minutes, seconds, frames);
  }
}
