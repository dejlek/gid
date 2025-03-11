module gstvideo.video_codec_state;

import gid.gid;
import gobject.boxed;
import gst.buffer;
import gst.caps;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_content_light_level;
import gstvideo.video_info;
import gstvideo.video_mastering_display_info;

/**
    Structure representing the state of an incoming or outgoing video
  stream for encoders and decoders.
  
  Decoders and encoders will receive such a state through their
  respective @set_format vmethods.
  
  Decoders and encoders can set the downstream state, by using the
  [gstvideo.video_decoder.VideoDecoder.setOutputState] or
  [gstvideo.video_encoder.VideoEncoder.setOutputState] methods.
*/
class VideoCodecState : gobject.boxed.Boxed
{

  this()
  {
    super(gMalloc(GstVideoCodecState.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_video_codec_state_get_type != &gidSymbolNotFound ? gst_video_codec_state_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property gstvideo.video_info.VideoInfo info()
  {
    return cToD!(gstvideo.video_info.VideoInfo)(cast(void*)&(cast(GstVideoCodecState*)cPtr).info);
  }

  @property gst.caps.Caps caps()
  {
    return cToD!(gst.caps.Caps)(cast(void*)(cast(GstVideoCodecState*)cPtr).caps);
  }

  @property void caps(gst.caps.Caps propval)
  {
    cValueFree!(gst.caps.Caps)(cast(void*)(cast(GstVideoCodecState*)cPtr).caps);
    dToC(propval, cast(void*)&(cast(GstVideoCodecState*)cPtr).caps);
  }

  @property gst.buffer.Buffer codecData()
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoCodecState*)cPtr).codecData);
  }

  @property void codecData(gst.buffer.Buffer propval)
  {
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoCodecState*)cPtr).codecData);
    dToC(propval, cast(void*)&(cast(GstVideoCodecState*)cPtr).codecData);
  }

  @property gst.caps.Caps allocationCaps()
  {
    return cToD!(gst.caps.Caps)(cast(void*)(cast(GstVideoCodecState*)cPtr).allocationCaps);
  }

  @property void allocationCaps(gst.caps.Caps propval)
  {
    cValueFree!(gst.caps.Caps)(cast(void*)(cast(GstVideoCodecState*)cPtr).allocationCaps);
    dToC(propval, cast(void*)&(cast(GstVideoCodecState*)cPtr).allocationCaps);
  }

  @property gstvideo.video_mastering_display_info.VideoMasteringDisplayInfo masteringDisplayInfo()
  {
    return new gstvideo.video_mastering_display_info.VideoMasteringDisplayInfo(cast(GstVideoMasteringDisplayInfo*)(cast(GstVideoCodecState*)cPtr).masteringDisplayInfo);
  }

  @property gstvideo.video_content_light_level.VideoContentLightLevel contentLightLevel()
  {
    return new gstvideo.video_content_light_level.VideoContentLightLevel(cast(GstVideoContentLightLevel*)(cast(GstVideoCodecState*)cPtr).contentLightLevel);
  }
}
