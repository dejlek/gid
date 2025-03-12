module gstaudio.audio_base_src;

import gid.gid;
import gobject.object;
import gstaudio.audio_ring_buffer;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;
import gstbase.push_src;

/**
    This is the base class for audio sources. Subclasses need to implement the
  ::create_ringbuffer vmethod. This base class will then take care of
  reading samples from the ringbuffer, synchronisation and flushing.
*/
class AudioBaseSrc : gstbase.push_src.PushSrc
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_base_src_get_type != &gidSymbolNotFound ? gst_audio_base_src_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override AudioBaseSrc self()
  {
    return this;
  }

  /**
      Create and return the #GstAudioRingBuffer for src. This function will call
    the ::create_ringbuffer vmethod and will set src as the parent of the
    returned buffer (see [gst.object.ObjectGst.setParent]).
    Returns:     The new ringbuffer of src.
  */
  gstaudio.audio_ring_buffer.AudioRingBuffer createRingbuffer()
  {
    GstAudioRingBuffer* _cretval;
    _cretval = gst_audio_base_src_create_ringbuffer(cast(GstAudioBaseSrc*)cPtr);
    auto _retval = ObjectG.getDObject!(gstaudio.audio_ring_buffer.AudioRingBuffer)(cast(GstAudioRingBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Queries whether src will provide a clock or not. See also
    gst_audio_base_src_set_provide_clock.
    Returns:     true if src will provide a clock.
  */
  bool getProvideClock()
  {
    bool _retval;
    _retval = gst_audio_base_src_get_provide_clock(cast(GstAudioBaseSrc*)cPtr);
    return _retval;
  }

  /**
      Get the current slave method used by src.
    Returns:     The current slave method used by src.
  */
  gstaudio.types.AudioBaseSrcSlaveMethod getSlaveMethod()
  {
    GstAudioBaseSrcSlaveMethod _cretval;
    _cretval = gst_audio_base_src_get_slave_method(cast(GstAudioBaseSrc*)cPtr);
    gstaudio.types.AudioBaseSrcSlaveMethod _retval = cast(gstaudio.types.AudioBaseSrcSlaveMethod)_cretval;
    return _retval;
  }

  /**
      Controls whether src will provide a clock or not. If provide is true,
    [gst.element.Element.provideClock] will return a clock that reflects the datarate
    of src. If provide is false, [gst.element.Element.provideClock] will return NULL.
    Params:
      provide =       new state
  */
  void setProvideClock(bool provide)
  {
    gst_audio_base_src_set_provide_clock(cast(GstAudioBaseSrc*)cPtr, provide);
  }

  /**
      Controls how clock slaving will be performed in src.
    Params:
      method =       the new slave method
  */
  void setSlaveMethod(gstaudio.types.AudioBaseSrcSlaveMethod method)
  {
    gst_audio_base_src_set_slave_method(cast(GstAudioBaseSrc*)cPtr, method);
  }
}
