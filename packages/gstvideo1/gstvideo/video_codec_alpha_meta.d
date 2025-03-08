module gstvideo.video_codec_alpha_meta;

import gid.gid;
import gst.buffer;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    This meta is primarily for internal use in GStreamer elements to support
  VP8/VP9 transparent video stored into WebM or Matroska containers, or
  transparent static AV1 images. Nothing prevents you from using this meta
  for custom purposes, but it generally can't be used to easily to add support
  for alpha channels to CODECs or formats that don't support that out of the
  box.
*/
class VideoCodecAlphaMeta
{
  GstVideoCodecAlphaMeta cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoCodecAlphaMeta");

    cInstance = *cast(GstVideoCodecAlphaMeta*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoCodecAlphaMeta*)cPtr).meta);
  }

  @property gst.buffer.Buffer buffer()
  {
    return new gst.buffer.Buffer(cast(GstBuffer*)(cast(GstVideoCodecAlphaMeta*)cPtr).buffer);
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_codec_alpha_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
