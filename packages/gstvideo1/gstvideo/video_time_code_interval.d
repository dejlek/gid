/// Module for [VideoTimeCodeInterval] class
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
    return cast(void function())gst_video_time_code_interval_get_type != &gidSymbolNotFound ? gst_video_time_code_interval_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoTimeCodeInterval self()
  {
    return this;
  }

  /**
      Get `hours` field.
      Returns: the hours field of #GstVideoTimeCodeInterval
  */
  @property uint hours()
  {
    return (cast(GstVideoTimeCodeInterval*)this._cPtr).hours;
  }

  /**
      Set `hours` field.
      Params:
        propval = the hours field of #GstVideoTimeCodeInterval
  */
  @property void hours(uint propval)
  {
    (cast(GstVideoTimeCodeInterval*)this._cPtr).hours = propval;
  }

  /**
      Get `minutes` field.
      Returns: the minutes field of #GstVideoTimeCodeInterval
  */
  @property uint minutes()
  {
    return (cast(GstVideoTimeCodeInterval*)this._cPtr).minutes;
  }

  /**
      Set `minutes` field.
      Params:
        propval = the minutes field of #GstVideoTimeCodeInterval
  */
  @property void minutes(uint propval)
  {
    (cast(GstVideoTimeCodeInterval*)this._cPtr).minutes = propval;
  }

  /**
      Get `seconds` field.
      Returns: the seconds field of #GstVideoTimeCodeInterval
  */
  @property uint seconds()
  {
    return (cast(GstVideoTimeCodeInterval*)this._cPtr).seconds;
  }

  /**
      Set `seconds` field.
      Params:
        propval = the seconds field of #GstVideoTimeCodeInterval
  */
  @property void seconds(uint propval)
  {
    (cast(GstVideoTimeCodeInterval*)this._cPtr).seconds = propval;
  }

  /**
      Get `frames` field.
      Returns: the frames field of #GstVideoTimeCodeInterval
  */
  @property uint frames()
  {
    return (cast(GstVideoTimeCodeInterval*)this._cPtr).frames;
  }

  /**
      Set `frames` field.
      Params:
        propval = the frames field of #GstVideoTimeCodeInterval
  */
  @property void frames(uint propval)
  {
    (cast(GstVideoTimeCodeInterval*)this._cPtr).frames = propval;
  }

  /** */
  this(uint hours, uint minutes, uint seconds, uint frames)
  {
    GstVideoTimeCodeInterval* _cretval;
    _cretval = gst_video_time_code_interval_new(hours, minutes, seconds, frames);
    this(_cretval, Yes.Take);
  }

  /**
      tc_inter_str must only have ":" as separators.
  
      Params:
        tcInterStr = The string that represents the #GstVideoTimeCodeInterval
      Returns: a new #GstVideoTimeCodeInterval from the given string
          or null if the string could not be passed.
  */
  static gstvideo.video_time_code_interval.VideoTimeCodeInterval newFromString(string tcInterStr)
  {
    GstVideoTimeCodeInterval* _cretval;
    const(char)* _tcInterStr = tcInterStr.toCString(No.Alloc);
    _cretval = gst_video_time_code_interval_new_from_string(_tcInterStr);
    auto _retval = _cretval ? new gstvideo.video_time_code_interval.VideoTimeCodeInterval(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Initializes tc with empty/zero/NULL values.
  */
  void clear()
  {
    gst_video_time_code_interval_clear(cast(GstVideoTimeCodeInterval*)this._cPtr);
  }

  /** */
  gstvideo.video_time_code_interval.VideoTimeCodeInterval copy()
  {
    GstVideoTimeCodeInterval* _cretval;
    _cretval = gst_video_time_code_interval_copy(cast(const(GstVideoTimeCodeInterval)*)this._cPtr);
    auto _retval = _cretval ? new gstvideo.video_time_code_interval.VideoTimeCodeInterval(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Initializes tc with the given values.
  
      Params:
        hours = the hours field of #GstVideoTimeCodeInterval
        minutes = the minutes field of #GstVideoTimeCodeInterval
        seconds = the seconds field of #GstVideoTimeCodeInterval
        frames = the frames field of #GstVideoTimeCodeInterval
  */
  void init_(uint hours, uint minutes, uint seconds, uint frames)
  {
    gst_video_time_code_interval_init(cast(GstVideoTimeCodeInterval*)this._cPtr, hours, minutes, seconds, frames);
  }
}
