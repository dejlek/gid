module gstvideo.video_resampler;

import gid.gid;
import gst.structure;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    #GstVideoResampler is a structure which holds the information
  required to perform various kinds of resampling filtering.
*/
class VideoResampler
{
  GstVideoResampler cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoResampler");

    cInstance = *cast(GstVideoResampler*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property int inSize()
  {
    return (cast(GstVideoResampler*)cPtr).inSize;
  }

  @property void inSize(int propval)
  {
    (cast(GstVideoResampler*)cPtr).inSize = propval;
  }

  @property int outSize()
  {
    return (cast(GstVideoResampler*)cPtr).outSize;
  }

  @property void outSize(int propval)
  {
    (cast(GstVideoResampler*)cPtr).outSize = propval;
  }

  @property uint maxTaps()
  {
    return (cast(GstVideoResampler*)cPtr).maxTaps;
  }

  @property void maxTaps(uint propval)
  {
    (cast(GstVideoResampler*)cPtr).maxTaps = propval;
  }

  @property uint nPhases()
  {
    return (cast(GstVideoResampler*)cPtr).nPhases;
  }

  @property void nPhases(uint propval)
  {
    (cast(GstVideoResampler*)cPtr).nPhases = propval;
  }

  /**
      Clear a previously initialized #GstVideoResampler resampler.
  */
  void clear()
  {
    gst_video_resampler_clear(cast(GstVideoResampler*)cPtr);
  }

  /** */
  bool init_(gstvideo.types.VideoResamplerMethod method, gstvideo.types.VideoResamplerFlags flags, uint nPhases, uint nTaps, double shift, uint inSize, uint outSize, gst.structure.Structure options)
  {
    bool _retval;
    _retval = gst_video_resampler_init(cast(GstVideoResampler*)cPtr, method, flags, nPhases, nTaps, shift, inSize, outSize, options ? cast(GstStructure*)options.cPtr(No.Dup) : null);
    return _retval;
  }
}
