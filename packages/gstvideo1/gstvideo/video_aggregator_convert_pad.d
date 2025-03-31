/// Module for [VideoAggregatorConvertPad] class
module gstvideo.video_aggregator_convert_pad;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_aggregator_pad;

/**
    An implementation of GstPad that can be used with #GstVideoAggregator.
    
    See #GstVideoAggregator for more details.
*/
class VideoAggregatorConvertPad : gstvideo.video_aggregator_pad.VideoAggregatorPad
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_video_aggregator_convert_pad_get_type != &gidSymbolNotFound ? gst_video_aggregator_convert_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override VideoAggregatorConvertPad self()
  {
    return this;
  }

  /**
      Requests the pad to check and update the converter before the next usage to
      update for any changes that have happened.
  */
  void updateConversionInfo()
  {
    gst_video_aggregator_convert_pad_update_conversion_info(cast(GstVideoAggregatorConvertPad*)cPtr);
  }
}
