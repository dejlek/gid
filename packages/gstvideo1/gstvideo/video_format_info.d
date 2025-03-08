module gstvideo.video_format_info;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Information for a video format.
*/
class VideoFormatInfo
{
  GstVideoFormatInfo cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoFormatInfo");

    cInstance = *cast(GstVideoFormatInfo*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gstvideo.types.VideoFormat format()
  {
    return cast(gstvideo.types.VideoFormat)(cast(GstVideoFormatInfo*)cPtr).format;
  }

  @property void format(gstvideo.types.VideoFormat propval)
  {
    (cast(GstVideoFormatInfo*)cPtr).format = cast(GstVideoFormat)propval;
  }

  @property string name()
  {
    return (cast(GstVideoFormatInfo*)cPtr).name.fromCString(No.free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GstVideoFormatInfo*)cPtr).name);
    (cast(GstVideoFormatInfo*)cPtr).name = propval.toCString(Yes.alloc);
  }

  @property string description()
  {
    return (cast(GstVideoFormatInfo*)cPtr).description.fromCString(No.free);
  }

  @property void description(string propval)
  {
    safeFree(cast(void*)(cast(GstVideoFormatInfo*)cPtr).description);
    (cast(GstVideoFormatInfo*)cPtr).description = propval.toCString(Yes.alloc);
  }

  @property gstvideo.types.VideoFormatFlags flags()
  {
    return cast(gstvideo.types.VideoFormatFlags)(cast(GstVideoFormatInfo*)cPtr).flags;
  }

  @property void flags(gstvideo.types.VideoFormatFlags propval)
  {
    (cast(GstVideoFormatInfo*)cPtr).flags = cast(GstVideoFormatFlags)propval;
  }

  @property uint bits()
  {
    return (cast(GstVideoFormatInfo*)cPtr).bits;
  }

  @property void bits(uint propval)
  {
    (cast(GstVideoFormatInfo*)cPtr).bits = propval;
  }

  @property uint nComponents()
  {
    return (cast(GstVideoFormatInfo*)cPtr).nComponents;
  }

  @property void nComponents(uint propval)
  {
    (cast(GstVideoFormatInfo*)cPtr).nComponents = propval;
  }

  @property uint nPlanes()
  {
    return (cast(GstVideoFormatInfo*)cPtr).nPlanes;
  }

  @property void nPlanes(uint propval)
  {
    (cast(GstVideoFormatInfo*)cPtr).nPlanes = propval;
  }

  @property gstvideo.types.VideoFormat unpackFormat()
  {
    return cast(gstvideo.types.VideoFormat)(cast(GstVideoFormatInfo*)cPtr).unpackFormat;
  }

  @property void unpackFormat(gstvideo.types.VideoFormat propval)
  {
    (cast(GstVideoFormatInfo*)cPtr).unpackFormat = cast(GstVideoFormat)propval;
  }

  @property int packLines()
  {
    return (cast(GstVideoFormatInfo*)cPtr).packLines;
  }

  @property void packLines(int propval)
  {
    (cast(GstVideoFormatInfo*)cPtr).packLines = propval;
  }

  @property gstvideo.types.VideoTileMode tileMode()
  {
    return cast(gstvideo.types.VideoTileMode)(cast(GstVideoFormatInfo*)cPtr).tileMode;
  }

  @property void tileMode(gstvideo.types.VideoTileMode propval)
  {
    (cast(GstVideoFormatInfo*)cPtr).tileMode = cast(GstVideoTileMode)propval;
  }

  @property uint tileWs()
  {
    return (cast(GstVideoFormatInfo*)cPtr).tileWs;
  }

  @property void tileWs(uint propval)
  {
    (cast(GstVideoFormatInfo*)cPtr).tileWs = propval;
  }

  @property uint tileHs()
  {
    return (cast(GstVideoFormatInfo*)cPtr).tileHs;
  }

  @property void tileHs(uint propval)
  {
    (cast(GstVideoFormatInfo*)cPtr).tileHs = propval;
  }

  /**
      Fill components with the number of all the components packed in plane p
    for the format info. A value of -1 in components indicates that no more
    components are packed in the plane.
    Params:
      plane =       a plane number
      components =       array used to store component numbers
  */
  void component(uint plane, out int components)
  {
    gst_video_format_info_component(cast(const(GstVideoFormatInfo)*)cPtr, plane, cast(int*)&components);
  }

  /**
      Extrapolate plane stride from the first stride of an image. This helper is
    useful to support legacy API were only one stride is supported.
    Params:
      plane =       a plane number
      stride =       The fist plane stride
    Returns:     The extrapolated stride for plane
  */
  int extrapolateStride(int plane, int stride)
  {
    int _retval;
    _retval = gst_video_format_info_extrapolate_stride(cast(const(GstVideoFormatInfo)*)cPtr, plane, stride);
    return _retval;
  }
}
