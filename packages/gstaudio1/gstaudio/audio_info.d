module gstaudio.audio_info;

import gid.gid;
import gobject.boxed;
import gst.caps;
import gst.types;
import gstaudio.audio_format_info;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    Information describing audio properties. This information can be filled
  in from GstCaps with [gstaudio.audio_info.AudioInfo.fromCaps].
  
  Use the provided macros to access the info in this structure.
*/
class AudioInfo : gobject.boxed.Boxed
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
    return cast(void function())gst_audio_info_get_type != &gidSymbolNotFound ? gst_audio_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property gstaudio.audio_format_info.AudioFormatInfo finfo()
  {
    return new gstaudio.audio_format_info.AudioFormatInfo(cast(GstAudioFormatInfo*)(cast(GstAudioInfo*)cPtr).finfo);
  }

  @property gstaudio.types.AudioFlags flags()
  {
    return cast(gstaudio.types.AudioFlags)(cast(GstAudioInfo*)cPtr).flags;
  }

  @property void flags(gstaudio.types.AudioFlags propval)
  {
    (cast(GstAudioInfo*)cPtr).flags = cast(GstAudioFlags)propval;
  }

  @property gstaudio.types.AudioLayout layout()
  {
    return cast(gstaudio.types.AudioLayout)(cast(GstAudioInfo*)cPtr).layout;
  }

  @property void layout(gstaudio.types.AudioLayout propval)
  {
    (cast(GstAudioInfo*)cPtr).layout = cast(GstAudioLayout)propval;
  }

  @property int rate()
  {
    return (cast(GstAudioInfo*)cPtr).rate;
  }

  @property void rate(int propval)
  {
    (cast(GstAudioInfo*)cPtr).rate = propval;
  }

  @property int channels()
  {
    return (cast(GstAudioInfo*)cPtr).channels;
  }

  @property void channels(int propval)
  {
    (cast(GstAudioInfo*)cPtr).channels = propval;
  }

  @property int bpf()
  {
    return (cast(GstAudioInfo*)cPtr).bpf;
  }

  @property void bpf(int propval)
  {
    (cast(GstAudioInfo*)cPtr).bpf = propval;
  }

  /**
      Allocate a new #GstAudioInfo that is also initialized with
    [gstaudio.audio_info.AudioInfo.init_].
    Returns:     a new #GstAudioInfo. free with [gstaudio.audio_info.AudioInfo.free].
  */
  this()
  {
    GstAudioInfo* _cretval;
    _cretval = gst_audio_info_new();
    this(_cretval, Yes.take);
  }

  /**
      Parse caps to generate a #GstAudioInfo.
    Params:
      caps =       a #GstCaps
    Returns:     A #GstAudioInfo, or null if caps couldn't be parsed
  */
  static gstaudio.audio_info.AudioInfo newFromCaps(gst.caps.Caps caps)
  {
    GstAudioInfo* _cretval;
    _cretval = gst_audio_info_new_from_caps(caps ? cast(const(GstCaps)*)caps.cPtr(No.dup) : null);
    auto _retval = _cretval ? new gstaudio.audio_info.AudioInfo(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Converts among various #GstFormat types.  This function handles
    GST_FORMAT_BYTES, GST_FORMAT_TIME, and GST_FORMAT_DEFAULT.  For
    raw audio, GST_FORMAT_DEFAULT corresponds to audio frames.  This
    function can be used to handle pad queries of the type GST_QUERY_CONVERT.
    Params:
      srcFmt =       #GstFormat of the src_val
      srcVal =       value to convert
      destFmt =       #GstFormat of the dest_val
      destVal =       pointer to destination value
    Returns:     TRUE if the conversion was successful.
  */
  bool convert(gst.types.Format srcFmt, long srcVal, gst.types.Format destFmt, out long destVal)
  {
    bool _retval;
    _retval = gst_audio_info_convert(cast(const(GstAudioInfo)*)cPtr, srcFmt, srcVal, destFmt, cast(long*)&destVal);
    return _retval;
  }

  /**
      Copy a GstAudioInfo structure.
    Returns:     a new #GstAudioInfo. free with gst_audio_info_free.
  */
  gstaudio.audio_info.AudioInfo copy()
  {
    GstAudioInfo* _cretval;
    _cretval = gst_audio_info_copy(cast(const(GstAudioInfo)*)cPtr);
    auto _retval = _cretval ? new gstaudio.audio_info.AudioInfo(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Compares two #GstAudioInfo and returns whether they are equal or not
    Params:
      other =       a #GstAudioInfo
    Returns:     true if info and other are equal, else false.
  */
  bool isEqual(gstaudio.audio_info.AudioInfo other)
  {
    bool _retval;
    _retval = gst_audio_info_is_equal(cast(const(GstAudioInfo)*)cPtr, other ? cast(const(GstAudioInfo)*)other.cPtr(No.dup) : null);
    return _retval;
  }

  /**
      Set the default info for the audio info of format and rate and channels.
    
    Note: This initializes info first, no values are preserved.
    Params:
      format =       the format
      rate =       the samplerate
      channels =       the number of channels
      position =       the channel positions
  */
  void setFormat(gstaudio.types.AudioFormat format, int rate, int channels, gstaudio.types.AudioChannelPosition[] position = null)
  {
    assert(!position || position.length == 64);
    auto _position = cast(const(GstAudioChannelPosition)*)position.ptr;
    gst_audio_info_set_format(cast(GstAudioInfo*)cPtr, format, rate, channels, _position);
  }

  /**
      Convert the values of info into a #GstCaps.
    Returns:     the new #GstCaps containing the
               info of info.
  */
  gst.caps.Caps toCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_audio_info_to_caps(cast(const(GstAudioInfo)*)cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Parse caps and update info.
    Params:
      info =       a #GstAudioInfo
      caps =       a #GstCaps
    Returns:     TRUE if caps could be parsed
  */
  static bool fromCaps(out gstaudio.audio_info.AudioInfo info, gst.caps.Caps caps)
  {
    bool _retval;
    GstAudioInfo _info;
    _retval = gst_audio_info_from_caps(&_info, caps ? cast(const(GstCaps)*)caps.cPtr(No.dup) : null);
    info = new gstaudio.audio_info.AudioInfo(cast(void*)&_info, No.take);
    return _retval;
  }

  /**
      Initialize info with default values.
    Params:
      info =       a #GstAudioInfo
  */
  static void init_(out gstaudio.audio_info.AudioInfo info)
  {
    GstAudioInfo _info;
    gst_audio_info_init(&_info);
    info = new gstaudio.audio_info.AudioInfo(cast(void*)&_info, No.take);
  }
}
