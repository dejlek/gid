/// Module for [AudioAggregatorConvertPad] class
module gstaudio.audio_aggregator_convert_pad;

import gid.gid;
import gobject.object;
import gst.structure;
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

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_aggregator_convert_pad_get_type != &gidSymbolNotFound ? gst_audio_aggregator_convert_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioAggregatorConvertPad self()
  {
    return this;
  }

  /** */
  @property gst.structure.Structure converterConfig()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.structure.Structure)("converter-config");
  }

  /** */
  @property void converterConfig(gst.structure.Structure propval)
  {
    gobject.object.ObjectWrap.setProperty!(gst.structure.Structure)("converter-config", propval);
  }
}
