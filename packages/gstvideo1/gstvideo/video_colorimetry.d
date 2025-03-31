/// Module for [VideoColorimetry] class
module gstvideo.video_colorimetry;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Structure describing the color info.
*/
class VideoColorimetry
{
  GstVideoColorimetry cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoColorimetry");

    cInstance = *cast(GstVideoColorimetry*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gstvideo.types.VideoColorRange range()
  {
    return cast(gstvideo.types.VideoColorRange)(cast(GstVideoColorimetry*)cPtr).range;
  }

  @property void range(gstvideo.types.VideoColorRange propval)
  {
    (cast(GstVideoColorimetry*)cPtr).range = cast(GstVideoColorRange)propval;
  }

  @property gstvideo.types.VideoColorMatrix matrix()
  {
    return cast(gstvideo.types.VideoColorMatrix)(cast(GstVideoColorimetry*)cPtr).matrix;
  }

  @property void matrix(gstvideo.types.VideoColorMatrix propval)
  {
    (cast(GstVideoColorimetry*)cPtr).matrix = cast(GstVideoColorMatrix)propval;
  }

  @property gstvideo.types.VideoTransferFunction transfer()
  {
    return cast(gstvideo.types.VideoTransferFunction)(cast(GstVideoColorimetry*)cPtr).transfer;
  }

  @property void transfer(gstvideo.types.VideoTransferFunction propval)
  {
    (cast(GstVideoColorimetry*)cPtr).transfer = cast(GstVideoTransferFunction)propval;
  }

  @property gstvideo.types.VideoColorPrimaries primaries()
  {
    return cast(gstvideo.types.VideoColorPrimaries)(cast(GstVideoColorimetry*)cPtr).primaries;
  }

  @property void primaries(gstvideo.types.VideoColorPrimaries propval)
  {
    (cast(GstVideoColorimetry*)cPtr).primaries = cast(GstVideoColorPrimaries)propval;
  }

  /**
      Parse the colorimetry string and update cinfo with the parsed
      values.
  
      Params:
        color = a colorimetry string
      Returns: true if color points to valid colorimetry info.
  */
  bool fromString(string color)
  {
    bool _retval;
    const(char)* _color = color.toCString(No.Alloc);
    _retval = gst_video_colorimetry_from_string(cast(GstVideoColorimetry*)cPtr, _color);
    return _retval;
  }

  /**
      Compare the 2 colorimetry sets for equality
  
      Params:
        other = another #GstVideoColorimetry
      Returns: true if cinfo and other are equal.
  */
  bool isEqual(gstvideo.video_colorimetry.VideoColorimetry other)
  {
    bool _retval;
    _retval = gst_video_colorimetry_is_equal(cast(const(GstVideoColorimetry)*)cPtr, other ? cast(const(GstVideoColorimetry)*)other.cPtr : null);
    return _retval;
  }

  /**
      Compare the 2 colorimetry sets for functionally equality
  
      Params:
        bitdepth = bitdepth of a format associated with cinfo
        other = another #GstVideoColorimetry
        otherBitdepth = bitdepth of a format associated with other
      Returns: true if cinfo and other are equivalent.
  */
  bool isEquivalent(uint bitdepth, gstvideo.video_colorimetry.VideoColorimetry other, uint otherBitdepth)
  {
    bool _retval;
    _retval = gst_video_colorimetry_is_equivalent(cast(const(GstVideoColorimetry)*)cPtr, bitdepth, other ? cast(const(GstVideoColorimetry)*)other.cPtr : null, otherBitdepth);
    return _retval;
  }

  /**
      Check if the colorimetry information in info matches that of the
      string color.
  
      Params:
        color = a colorimetry string
      Returns: true if color conveys the same colorimetry info as the color
        information in info.
  */
  bool matches(string color)
  {
    bool _retval;
    const(char)* _color = color.toCString(No.Alloc);
    _retval = gst_video_colorimetry_matches(cast(const(GstVideoColorimetry)*)cPtr, _color);
    return _retval;
  }

  /**
      Make a string representation of cinfo.
      Returns: a string representation of cinfo
        or null if all the entries of cinfo are unknown values.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gst_video_colorimetry_to_string(cast(const(GstVideoColorimetry)*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
