module gstaudio.audio_ring_buffer_spec;

import gid.gid;
import gst.caps;
import gstaudio.audio_info;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    The structure containing the format specification of the ringbuffer.
  
  When @type is GST_AUDIO_RING_BUFFER_FORMAT_TYPE_DSD, the @dsd_format
  is valid (otherwise it is unused). Also, when DSD is the sample type,
  only the rate, channels, position, and bpf fields in @info are populated.
*/
class AudioRingBufferSpec
{
  GstAudioRingBufferSpec cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstAudio.AudioRingBufferSpec");

    cInstance = *cast(GstAudioRingBufferSpec*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.caps.Caps caps()
  {
    return cToD!(gst.caps.Caps)(cast(void*)(cast(GstAudioRingBufferSpec*)cPtr).caps);
  }

  @property void caps(gst.caps.Caps propval)
  {
    cValueFree!(gst.caps.Caps)(cast(void*)(cast(GstAudioRingBufferSpec*)cPtr).caps);
    dToC(propval, cast(void*)&(cast(GstAudioRingBufferSpec*)cPtr).caps);
  }

  @property gstaudio.types.AudioRingBufferFormatType type()
  {
    return cast(gstaudio.types.AudioRingBufferFormatType)(cast(GstAudioRingBufferSpec*)cPtr).type;
  }

  @property void type(gstaudio.types.AudioRingBufferFormatType propval)
  {
    (cast(GstAudioRingBufferSpec*)cPtr).type = cast(GstAudioRingBufferFormatType)propval;
  }

  @property gstaudio.audio_info.AudioInfo info()
  {
    return cToD!(gstaudio.audio_info.AudioInfo)(cast(void*)&(cast(GstAudioRingBufferSpec*)cPtr).info);
  }

  @property ulong latencyTime()
  {
    return (cast(GstAudioRingBufferSpec*)cPtr).latencyTime;
  }

  @property void latencyTime(ulong propval)
  {
    (cast(GstAudioRingBufferSpec*)cPtr).latencyTime = propval;
  }

  @property ulong bufferTime()
  {
    return (cast(GstAudioRingBufferSpec*)cPtr).bufferTime;
  }

  @property void bufferTime(ulong propval)
  {
    (cast(GstAudioRingBufferSpec*)cPtr).bufferTime = propval;
  }

  @property int segsize()
  {
    return (cast(GstAudioRingBufferSpec*)cPtr).segsize;
  }

  @property void segsize(int propval)
  {
    (cast(GstAudioRingBufferSpec*)cPtr).segsize = propval;
  }

  @property int segtotal()
  {
    return (cast(GstAudioRingBufferSpec*)cPtr).segtotal;
  }

  @property void segtotal(int propval)
  {
    (cast(GstAudioRingBufferSpec*)cPtr).segtotal = propval;
  }

  @property int seglatency()
  {
    return (cast(GstAudioRingBufferSpec*)cPtr).seglatency;
  }

  @property void seglatency(int propval)
  {
    (cast(GstAudioRingBufferSpec*)cPtr).seglatency = propval;
  }
}
