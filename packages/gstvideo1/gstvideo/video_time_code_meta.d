module gstvideo.video_time_code_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_time_code;

/**
    Extra buffer metadata describing the GstVideoTimeCode of the frame.
  
  Each frame is assumed to have its own timecode, i.e. they are not
  automatically incremented/interpolated.
*/
class VideoTimeCodeMeta
{
  GstVideoTimeCodeMeta cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoTimeCodeMeta");

    cInstance = *cast(GstVideoTimeCodeMeta*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoTimeCodeMeta*)cPtr).meta);
  }

  @property gstvideo.video_time_code.VideoTimeCode tc()
  {
    return new gstvideo.video_time_code.VideoTimeCode(cast(GstVideoTimeCode*)&(cast(GstVideoTimeCodeMeta*)cPtr).tc);
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_time_code_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
