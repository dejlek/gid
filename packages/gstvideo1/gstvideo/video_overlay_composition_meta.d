module gstvideo.video_overlay_composition_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_overlay_composition;

/**
    Extra buffer metadata describing image overlay data.
*/
class VideoOverlayCompositionMeta
{
  GstVideoOverlayCompositionMeta cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoOverlayCompositionMeta");

    cInstance = *cast(GstVideoOverlayCompositionMeta*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoOverlayCompositionMeta*)cPtr).meta);
  }

  @property gstvideo.video_overlay_composition.VideoOverlayComposition overlay()
  {
    return new gstvideo.video_overlay_composition.VideoOverlayComposition(cast(GstVideoOverlayComposition*)(cast(GstVideoOverlayCompositionMeta*)cPtr).overlay);
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_overlay_composition_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
