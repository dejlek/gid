/// Module for [VideoTimeCodeConfig] class
module gstvideo.video_time_code_config;

import gid.gid;
import glib.date_time;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Supported frame rates: 30000/1001, 60000/1001 (both with and without drop
    frame), and integer frame rates e.g. 25/1, 30/1, 50/1, 60/1.
    
    The configuration of the time code.
*/
class VideoTimeCodeConfig
{
  GstVideoTimeCodeConfig cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_time_code_config.VideoTimeCodeConfig");

    cInstance = *cast(GstVideoTimeCodeConfig*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `fpsN` field.
      Returns: Numerator of the frame rate
  */
  @property uint fpsN()
  {
    return (cast(GstVideoTimeCodeConfig*)cPtr).fpsN;
  }

  /**
      Set `fpsN` field.
      Params:
        propval = Numerator of the frame rate
  */
  @property void fpsN(uint propval)
  {
    (cast(GstVideoTimeCodeConfig*)cPtr).fpsN = propval;
  }

  /**
      Get `fpsD` field.
      Returns: Denominator of the frame rate
  */
  @property uint fpsD()
  {
    return (cast(GstVideoTimeCodeConfig*)cPtr).fpsD;
  }

  /**
      Set `fpsD` field.
      Params:
        propval = Denominator of the frame rate
  */
  @property void fpsD(uint propval)
  {
    (cast(GstVideoTimeCodeConfig*)cPtr).fpsD = propval;
  }

  /**
      Get `flags` field.
      Returns: the corresponding #GstVideoTimeCodeFlags
  */
  @property gstvideo.types.VideoTimeCodeFlags flags()
  {
    return cast(gstvideo.types.VideoTimeCodeFlags)(cast(GstVideoTimeCodeConfig*)cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = the corresponding #GstVideoTimeCodeFlags
  */
  @property void flags(gstvideo.types.VideoTimeCodeFlags propval)
  {
    (cast(GstVideoTimeCodeConfig*)cPtr).flags = cast(GstVideoTimeCodeFlags)propval;
  }

  /**
      Get `latestDailyJam` field.
      Returns: The latest daily jam information, if present, or NULL
  */
  @property glib.date_time.DateTime latestDailyJam()
  {
    return cToD!(glib.date_time.DateTime)(cast(void*)(cast(GstVideoTimeCodeConfig*)cPtr).latestDailyJam);
  }

  /**
      Set `latestDailyJam` field.
      Params:
        propval = The latest daily jam information, if present, or NULL
  */
  @property void latestDailyJam(glib.date_time.DateTime propval)
  {
    cValueFree!(glib.date_time.DateTime)(cast(void*)(cast(GstVideoTimeCodeConfig*)cPtr).latestDailyJam);
    dToC(propval, cast(void*)&(cast(GstVideoTimeCodeConfig*)cPtr).latestDailyJam);
  }
}
