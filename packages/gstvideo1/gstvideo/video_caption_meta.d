module gstvideo.video_caption_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Extra buffer metadata providing Closed Caption.
*/
class VideoCaptionMeta
{
  GstVideoCaptionMeta cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoCaptionMeta");

    cInstance = *cast(GstVideoCaptionMeta*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoCaptionMeta*)cPtr).meta);
  }

  @property gstvideo.types.VideoCaptionType captionType()
  {
    return cast(gstvideo.types.VideoCaptionType)(cast(GstVideoCaptionMeta*)cPtr).captionType;
  }

  @property void captionType(gstvideo.types.VideoCaptionType propval)
  {
    (cast(GstVideoCaptionMeta*)cPtr).captionType = cast(GstVideoCaptionType)propval;
  }

  @property size_t size()
  {
    return (cast(GstVideoCaptionMeta*)cPtr).size;
  }

  @property void size(size_t propval)
  {
    (cast(GstVideoCaptionMeta*)cPtr).size = propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_caption_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
