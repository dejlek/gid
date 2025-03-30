/// Module for [AudioFormatInfo] class
module gstaudio.audio_format_info;

import gid.gid;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    Information for an audio format.
*/
class AudioFormatInfo
{
  GstAudioFormatInfo cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstAudio.AudioFormatInfo");

    cInstance = *cast(GstAudioFormatInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gstaudio.types.AudioFormat format()
  {
    return cast(gstaudio.types.AudioFormat)(cast(GstAudioFormatInfo*)cPtr).format;
  }

  @property void format(gstaudio.types.AudioFormat propval)
  {
    (cast(GstAudioFormatInfo*)cPtr).format = cast(GstAudioFormat)propval;
  }

  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GstAudioFormatInfo*)cPtr).name);
  }

  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstAudioFormatInfo*)cPtr).name);
    dToC(propval, cast(void*)&(cast(GstAudioFormatInfo*)cPtr).name);
  }

  @property string description()
  {
    return cToD!(string)(cast(void*)(cast(GstAudioFormatInfo*)cPtr).description);
  }

  @property void description(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstAudioFormatInfo*)cPtr).description);
    dToC(propval, cast(void*)&(cast(GstAudioFormatInfo*)cPtr).description);
  }

  @property gstaudio.types.AudioFormatFlags flags()
  {
    return cast(gstaudio.types.AudioFormatFlags)(cast(GstAudioFormatInfo*)cPtr).flags;
  }

  @property void flags(gstaudio.types.AudioFormatFlags propval)
  {
    (cast(GstAudioFormatInfo*)cPtr).flags = cast(GstAudioFormatFlags)propval;
  }

  @property int endianness()
  {
    return (cast(GstAudioFormatInfo*)cPtr).endianness;
  }

  @property void endianness(int propval)
  {
    (cast(GstAudioFormatInfo*)cPtr).endianness = propval;
  }

  @property int width()
  {
    return (cast(GstAudioFormatInfo*)cPtr).width;
  }

  @property void width(int propval)
  {
    (cast(GstAudioFormatInfo*)cPtr).width = propval;
  }

  @property int depth()
  {
    return (cast(GstAudioFormatInfo*)cPtr).depth;
  }

  @property void depth(int propval)
  {
    (cast(GstAudioFormatInfo*)cPtr).depth = propval;
  }

  @property gstaudio.types.AudioFormat unpackFormat()
  {
    return cast(gstaudio.types.AudioFormat)(cast(GstAudioFormatInfo*)cPtr).unpackFormat;
  }

  @property void unpackFormat(gstaudio.types.AudioFormat propval)
  {
    (cast(GstAudioFormatInfo*)cPtr).unpackFormat = cast(GstAudioFormat)propval;
  }

  /**
      Fill length bytes in dest with silence samples for info.
  
      Params:
        dest = a destination
            to fill
  */
  void fillSilence(ubyte[] dest)
  {
    size_t _length;
    if (dest)
      _length = cast(size_t)dest.length;

    auto _dest = cast(void*)dest.ptr;
    gst_audio_format_info_fill_silence(cast(const(GstAudioFormatInfo)*)cPtr, _dest, _length);
  }
}
