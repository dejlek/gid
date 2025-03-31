/// Module for [AudioMeta] class
module gstaudio.audio_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstaudio.audio_info;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    #GstAudioDownmixMeta defines an audio downmix matrix to be send along with
    audio buffers. These functions in this module help to create and attach the
    meta as well as extracting it.
*/
class AudioMeta
{
  GstAudioMeta cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstAudio.AudioMeta");

    cInstance = *cast(GstAudioMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstAudioMeta*)cPtr).meta);
  }

  @property gstaudio.audio_info.AudioInfo info()
  {
    return cToD!(gstaudio.audio_info.AudioInfo)(cast(void*)&(cast(GstAudioMeta*)cPtr).info);
  }

  @property size_t samples()
  {
    return (cast(GstAudioMeta*)cPtr).samples;
  }

  @property void samples(size_t propval)
  {
    (cast(GstAudioMeta*)cPtr).samples = propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_audio_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
