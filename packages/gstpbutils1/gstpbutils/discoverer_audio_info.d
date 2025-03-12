module gstpbutils.discoverer_audio_info;

import gid.gid;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.discoverer_stream_info;
import gstpbutils.types;

/**
    #GstDiscovererStreamInfo specific to audio streams.
*/
class DiscovererAudioInfo : gstpbutils.discoverer_stream_info.DiscovererStreamInfo
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_discoverer_audio_info_get_type != &gidSymbolNotFound ? gst_discoverer_audio_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override DiscovererAudioInfo self()
  {
    return this;
  }

  /** */
  uint getBitrate()
  {
    uint _retval;
    _retval = gst_discoverer_audio_info_get_bitrate(cast(const(GstDiscovererAudioInfo)*)cPtr);
    return _retval;
  }

  /** */
  ulong getChannelMask()
  {
    ulong _retval;
    _retval = gst_discoverer_audio_info_get_channel_mask(cast(const(GstDiscovererAudioInfo)*)cPtr);
    return _retval;
  }

  /** */
  uint getChannels()
  {
    uint _retval;
    _retval = gst_discoverer_audio_info_get_channels(cast(const(GstDiscovererAudioInfo)*)cPtr);
    return _retval;
  }

  /** */
  uint getDepth()
  {
    uint _retval;
    _retval = gst_discoverer_audio_info_get_depth(cast(const(GstDiscovererAudioInfo)*)cPtr);
    return _retval;
  }

  /** */
  string getLanguage()
  {
    const(char)* _cretval;
    _cretval = gst_discoverer_audio_info_get_language(cast(const(GstDiscovererAudioInfo)*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  uint getMaxBitrate()
  {
    uint _retval;
    _retval = gst_discoverer_audio_info_get_max_bitrate(cast(const(GstDiscovererAudioInfo)*)cPtr);
    return _retval;
  }

  /** */
  uint getSampleRate()
  {
    uint _retval;
    _retval = gst_discoverer_audio_info_get_sample_rate(cast(const(GstDiscovererAudioInfo)*)cPtr);
    return _retval;
  }
}
