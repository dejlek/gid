module gstvideo.video_alignment;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Extra alignment parameters for the memory of video buffers. This
  structure is usually used to configure the bufferpool if it supports the
  #GST_BUFFER_POOL_OPTION_VIDEO_ALIGNMENT.
*/
class VideoAlignment
{
  GstVideoAlignment cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoAlignment");

    cInstance = *cast(GstVideoAlignment*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property uint paddingTop()
  {
    return (cast(GstVideoAlignment*)cPtr).paddingTop;
  }

  @property void paddingTop(uint propval)
  {
    (cast(GstVideoAlignment*)cPtr).paddingTop = propval;
  }

  @property uint paddingBottom()
  {
    return (cast(GstVideoAlignment*)cPtr).paddingBottom;
  }

  @property void paddingBottom(uint propval)
  {
    (cast(GstVideoAlignment*)cPtr).paddingBottom = propval;
  }

  @property uint paddingLeft()
  {
    return (cast(GstVideoAlignment*)cPtr).paddingLeft;
  }

  @property void paddingLeft(uint propval)
  {
    (cast(GstVideoAlignment*)cPtr).paddingLeft = propval;
  }

  @property uint paddingRight()
  {
    return (cast(GstVideoAlignment*)cPtr).paddingRight;
  }

  @property void paddingRight(uint propval)
  {
    (cast(GstVideoAlignment*)cPtr).paddingRight = propval;
  }

  /**
      Set align to its default values with no padding and no alignment.
  */
  void reset()
  {
    gst_video_alignment_reset(cast(GstVideoAlignment*)cPtr);
  }
}
