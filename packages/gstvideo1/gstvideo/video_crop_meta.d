module gstvideo.video_crop_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Extra buffer metadata describing image cropping.
*/
class VideoCropMeta
{
  GstVideoCropMeta cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoCropMeta");

    cInstance = *cast(GstVideoCropMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoCropMeta*)cPtr).meta);
  }

  @property uint x()
  {
    return (cast(GstVideoCropMeta*)cPtr).x;
  }

  @property void x(uint propval)
  {
    (cast(GstVideoCropMeta*)cPtr).x = propval;
  }

  @property uint y()
  {
    return (cast(GstVideoCropMeta*)cPtr).y;
  }

  @property void y(uint propval)
  {
    (cast(GstVideoCropMeta*)cPtr).y = propval;
  }

  @property uint width()
  {
    return (cast(GstVideoCropMeta*)cPtr).width;
  }

  @property void width(uint propval)
  {
    (cast(GstVideoCropMeta*)cPtr).width = propval;
  }

  @property uint height()
  {
    return (cast(GstVideoCropMeta*)cPtr).height;
  }

  @property void height(uint propval)
  {
    (cast(GstVideoCropMeta*)cPtr).height = propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_crop_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
