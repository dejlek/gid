/// Module for [VideoAggregator] class
module gstvideo.video_aggregator;

import gid.gid;
import gobject.object;
import gst.task_pool;
import gstbase.aggregator;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    VideoAggregator can accept AYUV, ARGB and BGRA video streams. For each of the requested
    sink pads it will compare the incoming geometry and framerate to define the
    output parameters. Indeed output video frames will have the geometry of the
    biggest incoming video stream and the framerate of the fastest incoming one.
    
    VideoAggregator will do colorspace conversion.
    
    Zorder for each input stream can be configured on the
    #GstVideoAggregatorPad.
*/
class VideoAggregator : gstbase.aggregator.Aggregator
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_video_aggregator_get_type != &gidSymbolNotFound ? gst_video_aggregator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoAggregator self()
  {
    return this;
  }

  /**
      The returned #GstTaskPool is used internally for performing parallel
      video format conversions/scaling/etc during the
      #GstVideoAggregatorPadClass::prepare_frame_start() process.
      Subclasses can add their own operation to perform using the returned
      #GstTaskPool during #GstVideoAggregatorClass::aggregate_frames().
      Returns: the #GstTaskPool that can be used by subclasses
            for performing concurrent operations
  */
  gst.task_pool.TaskPool getExecutionTaskPool()
  {
    GstTaskPool* _cretval;
    _cretval = gst_video_aggregator_get_execution_task_pool(cast(GstVideoAggregator*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.task_pool.TaskPool)(cast(GstTaskPool*)_cretval, Yes.Take);
    return _retval;
  }
}
