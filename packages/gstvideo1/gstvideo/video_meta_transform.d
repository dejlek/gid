module gstvideo.video_meta_transform;

import gid.gid;
import glib.types;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_info;

/**
    Extra data passed to a video transform #GstMetaTransformFunction such as:
  "gst-video-scale".
*/
class VideoMetaTransform
{
  GstVideoMetaTransform cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoMetaTransform");

    cInstance = *cast(GstVideoMetaTransform*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gstvideo.video_info.VideoInfo inInfo()
  {
    return new gstvideo.video_info.VideoInfo(cast(GstVideoInfo*)(cast(GstVideoMetaTransform*)cPtr).inInfo);
  }

  @property gstvideo.video_info.VideoInfo outInfo()
  {
    return new gstvideo.video_info.VideoInfo(cast(GstVideoInfo*)(cast(GstVideoMetaTransform*)cPtr).outInfo);
  }

  /**
      Get the #GQuark for the "gst-video-scale" metadata transform operation.
    Returns:     a #GQuark
  */
  static glib.types.Quark scaleGetQuark()
  {
    glib.types.Quark _retval;
    _retval = gst_video_meta_transform_scale_get_quark();
    return _retval;
  }
}
