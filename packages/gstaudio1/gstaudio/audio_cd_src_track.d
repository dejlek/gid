/// Module for [AudioCdSrcTrack] class
module gstaudio.audio_cd_src_track;

import gid.gid;
import gst.tag_list;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    CD track abstraction to communicate TOC entries to the base class.
    
    This structure is only for use by sub-classed in connection with
    [gstaudio.audio_cd_src.AudioCdSrc.addTrack].
    
    Applications will be informed of the available tracks via a TOC message
    on the pipeline's #GstBus instead.
*/
class AudioCdSrcTrack
{
  GstAudioCdSrcTrack cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstAudio.AudioCdSrcTrack");

    cInstance = *cast(GstAudioCdSrcTrack*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property bool isAudio()
  {
    return (cast(GstAudioCdSrcTrack*)cPtr).isAudio;
  }

  @property void isAudio(bool propval)
  {
    (cast(GstAudioCdSrcTrack*)cPtr).isAudio = propval;
  }

  @property uint num()
  {
    return (cast(GstAudioCdSrcTrack*)cPtr).num;
  }

  @property void num(uint propval)
  {
    (cast(GstAudioCdSrcTrack*)cPtr).num = propval;
  }

  @property uint start()
  {
    return (cast(GstAudioCdSrcTrack*)cPtr).start;
  }

  @property void start(uint propval)
  {
    (cast(GstAudioCdSrcTrack*)cPtr).start = propval;
  }

  @property uint end()
  {
    return (cast(GstAudioCdSrcTrack*)cPtr).end;
  }

  @property void end(uint propval)
  {
    (cast(GstAudioCdSrcTrack*)cPtr).end = propval;
  }

  @property gst.tag_list.TagList tags()
  {
    return cToD!(gst.tag_list.TagList)(cast(void*)(cast(GstAudioCdSrcTrack*)cPtr).tags);
  }

  @property void tags(gst.tag_list.TagList propval)
  {
    cValueFree!(gst.tag_list.TagList)(cast(void*)(cast(GstAudioCdSrcTrack*)cPtr).tags);
    dToC(propval, cast(void*)&(cast(GstAudioCdSrcTrack*)cPtr).tags);
  }
}
