module gstvideo.video_aggregator_parallel_convert_pad;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_aggregator_convert_pad;

/**
    An implementation of GstPad that can be used with #GstVideoAggregator.
  
  See #GstVideoAggregator for more details.
*/
class VideoAggregatorParallelConvertPad : gstvideo.video_aggregator_convert_pad.VideoAggregatorConvertPad
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_video_aggregator_parallel_convert_pad_get_type != &gidSymbolNotFound ? gst_video_aggregator_parallel_convert_pad_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override VideoAggregatorParallelConvertPad self()
  {
    return this;
  }
}
