/// Module for [VideoSEIUserDataUnregisteredMeta] class
module gstvideo.video_seiuser_data_unregistered_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    H.264 H.265 metadata from SEI User Data Unregistered messages
*/
class VideoSEIUserDataUnregisteredMeta
{
  GstVideoSEIUserDataUnregisteredMeta cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoSEIUserDataUnregisteredMeta");

    cInstance = *cast(GstVideoSEIUserDataUnregisteredMeta*)ptr;

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
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoSEIUserDataUnregisteredMeta*)cPtr).meta);
  }

  @property size_t size()
  {
    return (cast(GstVideoSEIUserDataUnregisteredMeta*)cPtr).size;
  }

  @property void size(size_t propval)
  {
    (cast(GstVideoSEIUserDataUnregisteredMeta*)cPtr).size = propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_sei_user_data_unregistered_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
