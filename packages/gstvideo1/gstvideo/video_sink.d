module gstvideo.video_sink;

import gid.gid;
import gstbase.base_sink;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Provides useful functions and a base class for video sinks.
  
  GstVideoSink will configure the default base sink to drop frames that
  arrive later than 20ms as this is considered the default threshold for
  observing out-of-sync frames.
*/
class VideoSink : gstbase.base_sink.BaseSink
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_video_sink_get_type != &gidSymbolNotFound ? gst_video_sink_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }
}
