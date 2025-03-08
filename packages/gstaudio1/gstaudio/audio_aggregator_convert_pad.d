module gstaudio.audio_aggregator_convert_pad;

import gid.gid;
import gstaudio.audio_aggregator_pad;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    An implementation of GstPad that can be used with #GstAudioAggregator.
  
  See #GstAudioAggregator for more details.
*/
class AudioAggregatorConvertPad : gstaudio.audio_aggregator_pad.AudioAggregatorPad
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_aggregator_convert_pad_get_type != &gidSymbolNotFound ? gst_audio_aggregator_convert_pad_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }
}
