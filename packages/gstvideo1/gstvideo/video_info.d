module gstvideo.video_info;

import gid.gid;
import gobject.boxed;
import gst.caps;
import gst.types;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_alignment;
import gstvideo.video_colorimetry;
import gstvideo.video_format_info;

/**
    Information describing image properties. This information can be filled
  in from GstCaps with [gstvideo.video_info.VideoInfo.fromCaps]. The information is also used
  to store the specific video info when mapping a video frame with
  [gstvideo.video_frame.VideoFrame.map].
  
  Use the provided macros to access the info in this structure.
*/
class VideoInfo : gobject.boxed.Boxed
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"dup" dup = No.dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_video_info_get_type != &gidSymbolNotFound ? gst_video_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property gstvideo.video_format_info.VideoFormatInfo finfo()
  {
    return new gstvideo.video_format_info.VideoFormatInfo(cast(GstVideoFormatInfo*)(cast(GstVideoInfo*)cPtr).finfo);
  }

  @property gstvideo.types.VideoInterlaceMode interlaceMode()
  {
    return cast(gstvideo.types.VideoInterlaceMode)(cast(GstVideoInfo*)cPtr).interlaceMode;
  }

  @property void interlaceMode(gstvideo.types.VideoInterlaceMode propval)
  {
    (cast(GstVideoInfo*)cPtr).interlaceMode = cast(GstVideoInterlaceMode)propval;
  }

  @property gstvideo.types.VideoFlags flags()
  {
    return cast(gstvideo.types.VideoFlags)(cast(GstVideoInfo*)cPtr).flags;
  }

  @property void flags(gstvideo.types.VideoFlags propval)
  {
    (cast(GstVideoInfo*)cPtr).flags = cast(GstVideoFlags)propval;
  }

  @property int width()
  {
    return (cast(GstVideoInfo*)cPtr).width;
  }

  @property void width(int propval)
  {
    (cast(GstVideoInfo*)cPtr).width = propval;
  }

  @property int height()
  {
    return (cast(GstVideoInfo*)cPtr).height;
  }

  @property void height(int propval)
  {
    (cast(GstVideoInfo*)cPtr).height = propval;
  }

  @property size_t size()
  {
    return (cast(GstVideoInfo*)cPtr).size;
  }

  @property void size(size_t propval)
  {
    (cast(GstVideoInfo*)cPtr).size = propval;
  }

  @property int views()
  {
    return (cast(GstVideoInfo*)cPtr).views;
  }

  @property void views(int propval)
  {
    (cast(GstVideoInfo*)cPtr).views = propval;
  }

  @property gstvideo.types.VideoChromaSite chromaSite()
  {
    return cast(gstvideo.types.VideoChromaSite)(cast(GstVideoInfo*)cPtr).chromaSite;
  }

  @property void chromaSite(gstvideo.types.VideoChromaSite propval)
  {
    (cast(GstVideoInfo*)cPtr).chromaSite = cast(GstVideoChromaSite)propval;
  }

  @property gstvideo.video_colorimetry.VideoColorimetry colorimetry()
  {
    return new gstvideo.video_colorimetry.VideoColorimetry(cast(GstVideoColorimetry*)&(cast(GstVideoInfo*)cPtr).colorimetry);
  }

  @property int parN()
  {
    return (cast(GstVideoInfo*)cPtr).parN;
  }

  @property void parN(int propval)
  {
    (cast(GstVideoInfo*)cPtr).parN = propval;
  }

  @property int parD()
  {
    return (cast(GstVideoInfo*)cPtr).parD;
  }

  @property void parD(int propval)
  {
    (cast(GstVideoInfo*)cPtr).parD = propval;
  }

  @property int fpsN()
  {
    return (cast(GstVideoInfo*)cPtr).fpsN;
  }

  @property void fpsN(int propval)
  {
    (cast(GstVideoInfo*)cPtr).fpsN = propval;
  }

  @property int fpsD()
  {
    return (cast(GstVideoInfo*)cPtr).fpsD;
  }

  @property void fpsD(int propval)
  {
    (cast(GstVideoInfo*)cPtr).fpsD = propval;
  }

  /**
      Allocate a new #GstVideoInfo that is also initialized with
    [gstvideo.video_info.VideoInfo.init_].
    Returns:     a new #GstVideoInfo. free with [gstvideo.video_info.VideoInfo.free].
  */
  this()
  {
    GstVideoInfo* _cretval;
    _cretval = gst_video_info_new();
    this(_cretval, Yes.take);
  }

  /**
      Parse caps to generate a #GstVideoInfo.
    Params:
      caps =       a #GstCaps
    Returns:     A #GstVideoInfo, or null if caps couldn't be parsed
  */
  static gstvideo.video_info.VideoInfo newFromCaps(gst.caps.Caps caps)
  {
    GstVideoInfo* _cretval;
    _cretval = gst_video_info_new_from_caps(caps ? cast(const(GstCaps)*)caps.cPtr(No.dup) : null);
    auto _retval = _cretval ? new gstvideo.video_info.VideoInfo(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Adjust the offset and stride fields in info so that the padding and
    stride alignment in align is respected.
    
    Extra padding will be added to the right side when stride alignment padding
    is required and align will be updated with the new padding values.
    Params:
      align_ =       alignment parameters
    Returns:     false if alignment could not be applied, e.g. because the
        size of a frame can't be represented as a 32 bit integer (Since: 1.12)
  */
  bool align_(gstvideo.video_alignment.VideoAlignment align_)
  {
    bool _retval;
    _retval = gst_video_info_align(cast(GstVideoInfo*)cPtr, align_ ? cast(GstVideoAlignment*)align_.cPtr : null);
    return _retval;
  }

  /**
      Extra padding will be added to the right side when stride alignment padding
    is required and align will be updated with the new padding values.
    
    This variant of [gstvideo.video_info.VideoInfo.align_] provides the updated size, in bytes,
    of each video plane after the alignment, including all horizontal and vertical
    paddings.
    
    In case of GST_VIDEO_INTERLACE_MODE_ALTERNATE info, the returned sizes are the
    ones used to hold a single field, not the full frame.
    Params:
      align_ =       alignment parameters
      planeSize =       array used to store the plane sizes
    Returns:     false if alignment could not be applied, e.g. because the
        size of a frame can't be represented as a 32 bit integer
  */
  bool alignFull(gstvideo.video_alignment.VideoAlignment align_, out size_t planeSize)
  {
    bool _retval;
    _retval = gst_video_info_align_full(cast(GstVideoInfo*)cPtr, align_ ? cast(GstVideoAlignment*)align_.cPtr : null, cast(size_t*)&planeSize);
    return _retval;
  }

  /**
      Converts among various #GstFormat types.  This function handles
    GST_FORMAT_BYTES, GST_FORMAT_TIME, and GST_FORMAT_DEFAULT.  For
    raw video, GST_FORMAT_DEFAULT corresponds to video frames.  This
    function can be used to handle pad queries of the type GST_QUERY_CONVERT.
    Params:
      srcFormat =       #GstFormat of the src_value
      srcValue =       value to convert
      destFormat =       #GstFormat of the dest_value
      destValue =       pointer to destination value
    Returns:     TRUE if the conversion was successful.
  */
  bool convert(gst.types.Format srcFormat, long srcValue, gst.types.Format destFormat, out long destValue)
  {
    bool _retval;
    _retval = gst_video_info_convert(cast(const(GstVideoInfo)*)cPtr, srcFormat, srcValue, destFormat, cast(long*)&destValue);
    return _retval;
  }

  /**
      Copy a GstVideoInfo structure.
    Returns:     a new #GstVideoInfo. free with gst_video_info_free.
  */
  gstvideo.video_info.VideoInfo copy()
  {
    GstVideoInfo* _cretval;
    _cretval = gst_video_info_copy(cast(const(GstVideoInfo)*)cPtr);
    auto _retval = _cretval ? new gstvideo.video_info.VideoInfo(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Compares two #GstVideoInfo and returns whether they are equal or not
    Params:
      other =       a #GstVideoInfo
    Returns:     true if info and other are equal, else false.
  */
  bool isEqual(gstvideo.video_info.VideoInfo other)
  {
    bool _retval;
    _retval = gst_video_info_is_equal(cast(const(GstVideoInfo)*)cPtr, other ? cast(const(GstVideoInfo)*)other.cPtr(No.dup) : null);
    return _retval;
  }

  /**
      Set the default info for a video frame of format and width and height.
    
    Note: This initializes info first, no values are preserved. This function
    does not set the offsets correctly for interlaced vertically
    subsampled formats.
    Params:
      format =       the format
      width =       a width
      height =       a height
    Returns:     false if the returned video info is invalid, e.g. because the
        size of a frame can't be represented as a 32 bit integer (Since: 1.12)
  */
  bool setFormat(gstvideo.types.VideoFormat format, uint width, uint height)
  {
    bool _retval;
    _retval = gst_video_info_set_format(cast(GstVideoInfo*)cPtr, format, width, height);
    return _retval;
  }

  /**
      Same as #gst_video_info_set_format but also allowing to set the interlaced
    mode.
    Params:
      format =       the format
      mode =       a #GstVideoInterlaceMode
      width =       a width
      height =       a height
    Returns:     false if the returned video info is invalid, e.g. because the
        size of a frame can't be represented as a 32 bit integer.
  */
  bool setInterlacedFormat(gstvideo.types.VideoFormat format, gstvideo.types.VideoInterlaceMode mode, uint width, uint height)
  {
    bool _retval;
    _retval = gst_video_info_set_interlaced_format(cast(GstVideoInfo*)cPtr, format, mode, width, height);
    return _retval;
  }

  /**
      Convert the values of info into a #GstCaps.
    Returns:     a new #GstCaps containing the info of info.
  */
  gst.caps.Caps toCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_video_info_to_caps(cast(const(GstVideoInfo)*)cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Parse caps and update info.
    Params:
      info =       #GstVideoInfo
      caps =       a #GstCaps
    Returns:     TRUE if caps could be parsed
  */
  static bool fromCaps(out gstvideo.video_info.VideoInfo info, gst.caps.Caps caps)
  {
    bool _retval;
    GstVideoInfo _info;
    _retval = gst_video_info_from_caps(&_info, caps ? cast(const(GstCaps)*)caps.cPtr(No.dup) : null);
    info = new gstvideo.video_info.VideoInfo(cast(void*)&_info, No.take);
    return _retval;
  }

  /**
      Initialize info with default values.
    Params:
      info =       a #GstVideoInfo
  */
  static void init_(out gstvideo.video_info.VideoInfo info)
  {
    GstVideoInfo _info;
    gst_video_info_init(&_info);
    info = new gstvideo.video_info.VideoInfo(cast(void*)&_info, No.take);
  }
}
