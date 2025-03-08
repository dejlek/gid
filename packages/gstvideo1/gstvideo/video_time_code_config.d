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

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoTimeCodeConfig");

    cInstance = *cast(GstVideoTimeCodeConfig*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property uint fpsN()
  {
    return (cast(GstVideoTimeCodeConfig*)cPtr).fpsN;
  }

  @property void fpsN(uint propval)
  {
    (cast(GstVideoTimeCodeConfig*)cPtr).fpsN = propval;
  }

  @property uint fpsD()
  {
    return (cast(GstVideoTimeCodeConfig*)cPtr).fpsD;
  }

  @property void fpsD(uint propval)
  {
    (cast(GstVideoTimeCodeConfig*)cPtr).fpsD = propval;
  }

  @property gstvideo.types.VideoTimeCodeFlags flags()
  {
    return cast(gstvideo.types.VideoTimeCodeFlags)(cast(GstVideoTimeCodeConfig*)cPtr).flags;
  }

  @property void flags(gstvideo.types.VideoTimeCodeFlags propval)
  {
    (cast(GstVideoTimeCodeConfig*)cPtr).flags = cast(GstVideoTimeCodeFlags)propval;
  }

  @property glib.date_time.DateTime latestDailyJam()
  {
    return new glib.date_time.DateTime(cast(GDateTime*)(cast(GstVideoTimeCodeConfig*)cPtr).latestDailyJam);
  }
}
