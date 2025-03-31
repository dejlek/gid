/// Module for [AudioLevelMeta] class
module gstaudio.audio_level_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    Meta containing Audio Level Indication: https://tools.ietf.org/html/rfc6464
*/
class AudioLevelMeta
{
  GstAudioLevelMeta cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstAudio.AudioLevelMeta");

    cInstance = *cast(GstAudioLevelMeta*)ptr;

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
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstAudioLevelMeta*)cPtr).meta);
  }

  @property ubyte level()
  {
    return (cast(GstAudioLevelMeta*)cPtr).level;
  }

  @property void level(ubyte propval)
  {
    (cast(GstAudioLevelMeta*)cPtr).level = propval;
  }

  @property bool voiceActivity()
  {
    return (cast(GstAudioLevelMeta*)cPtr).voiceActivity;
  }

  @property void voiceActivity(bool propval)
  {
    (cast(GstAudioLevelMeta*)cPtr).voiceActivity = propval;
  }

  /**
      Return the #GstMetaInfo associated with #GstAudioLevelMeta.
      Returns: a #GstMetaInfo
  */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_audio_level_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
