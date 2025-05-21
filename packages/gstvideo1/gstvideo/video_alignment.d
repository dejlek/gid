/// Module for [VideoAlignment] class
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

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_alignment.VideoAlignment");

    cInstance = *cast(GstVideoAlignment*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `paddingTop` field.
      Returns: extra pixels on the top
  */
  @property uint paddingTop()
  {
    return (cast(GstVideoAlignment*)this._cPtr).paddingTop;
  }

  /**
      Set `paddingTop` field.
      Params:
        propval = extra pixels on the top
  */
  @property void paddingTop(uint propval)
  {
    (cast(GstVideoAlignment*)this._cPtr).paddingTop = propval;
  }

  /**
      Get `paddingBottom` field.
      Returns: extra pixels on the bottom
  */
  @property uint paddingBottom()
  {
    return (cast(GstVideoAlignment*)this._cPtr).paddingBottom;
  }

  /**
      Set `paddingBottom` field.
      Params:
        propval = extra pixels on the bottom
  */
  @property void paddingBottom(uint propval)
  {
    (cast(GstVideoAlignment*)this._cPtr).paddingBottom = propval;
  }

  /**
      Get `paddingLeft` field.
      Returns: extra pixels on the left side
  */
  @property uint paddingLeft()
  {
    return (cast(GstVideoAlignment*)this._cPtr).paddingLeft;
  }

  /**
      Set `paddingLeft` field.
      Params:
        propval = extra pixels on the left side
  */
  @property void paddingLeft(uint propval)
  {
    (cast(GstVideoAlignment*)this._cPtr).paddingLeft = propval;
  }

  /**
      Get `paddingRight` field.
      Returns: extra pixels on the right side
  */
  @property uint paddingRight()
  {
    return (cast(GstVideoAlignment*)this._cPtr).paddingRight;
  }

  /**
      Set `paddingRight` field.
      Params:
        propval = extra pixels on the right side
  */
  @property void paddingRight(uint propval)
  {
    (cast(GstVideoAlignment*)this._cPtr).paddingRight = propval;
  }

  /**
      Set align to its default values with no padding and no alignment.
  */
  void reset()
  {
    gst_video_alignment_reset(cast(GstVideoAlignment*)this._cPtr);
  }
}
