module gstvideo.video_chroma_resample;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/** */
class VideoChromaResample
{
  GstVideoChromaResample* cInstancePtr;
  bool owned;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoChromaResample");

    cInstancePtr = cast(GstVideoChromaResample*)ptr;

    owned = take;
  }

  void* cPtr()
  {
    return cast(void*)cInstancePtr;
  }

  /**
      The resampler must be fed n_lines at a time. The first line should be
    at offset.
    Params:
      nLines =       the number of input lines
      offset =       the first line
  */
  void getInfo(out uint nLines, out int offset)
  {
    gst_video_chroma_resample_get_info(cast(GstVideoChromaResample*)cPtr, cast(uint*)&nLines, cast(int*)&offset);
  }
}
