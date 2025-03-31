/// Module for [AudioClippingMeta] class
module gstaudio.audio_clipping_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gst.types;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    Extra buffer metadata describing how much audio has to be clipped from
    the start or end of a buffer. This is used for compressed formats, where
    the first frame usually has some additional samples due to encoder and
    decoder delays, and the last frame usually has some additional samples to
    be able to fill the complete last frame.
    
    This is used to ensure that decoded data in the end has the same amount of
    samples, and multiply decoded streams can be gaplessly concatenated.
    
    Note: If clipping of the start is done by adjusting the segment, this meta
    has to be dropped from buffers as otherwise clipping could happen twice.
*/
class AudioClippingMeta
{
  GstAudioClippingMeta cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstAudio.AudioClippingMeta");

    cInstance = *cast(GstAudioClippingMeta*)ptr;

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
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstAudioClippingMeta*)cPtr).meta);
  }

  @property gst.types.Format format()
  {
    return cast(gst.types.Format)(cast(GstAudioClippingMeta*)cPtr).format;
  }

  @property void format(gst.types.Format propval)
  {
    (cast(GstAudioClippingMeta*)cPtr).format = cast(GstFormat)propval;
  }

  @property ulong start()
  {
    return (cast(GstAudioClippingMeta*)cPtr).start;
  }

  @property void start(ulong propval)
  {
    (cast(GstAudioClippingMeta*)cPtr).start = propval;
  }

  @property ulong end()
  {
    return (cast(GstAudioClippingMeta*)cPtr).end;
  }

  @property void end(ulong propval)
  {
    (cast(GstAudioClippingMeta*)cPtr).end = propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_audio_clipping_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
