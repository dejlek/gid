module gstaudio.audio_downmix_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    Extra buffer metadata describing audio downmixing matrix. This metadata is
  attached to audio buffers and contains a matrix to downmix the buffer number
  of channels to @channels.
  
  @matrix is an two-dimensional array of @to_channels times @from_channels
  coefficients, i.e. the i-th output channels is constructed by multiplicating
  the input channels with the coefficients in @matrix[i] and taking the sum
  of the results.
*/
class AudioDownmixMeta
{
  GstAudioDownmixMeta cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstAudio.AudioDownmixMeta");

    cInstance = *cast(GstAudioDownmixMeta*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstAudioDownmixMeta*)cPtr).meta);
  }

  @property int fromChannels()
  {
    return (cast(GstAudioDownmixMeta*)cPtr).fromChannels;
  }

  @property void fromChannels(int propval)
  {
    (cast(GstAudioDownmixMeta*)cPtr).fromChannels = propval;
  }

  @property int toChannels()
  {
    return (cast(GstAudioDownmixMeta*)cPtr).toChannels;
  }

  @property void toChannels(int propval)
  {
    (cast(GstAudioDownmixMeta*)cPtr).toChannels = propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_audio_downmix_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
