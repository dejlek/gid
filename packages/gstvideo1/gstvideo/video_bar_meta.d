module gstvideo.video_bar_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Bar data should be included in video user data
  whenever the rectangular picture area containing useful information
  does not extend to the full height or width of the coded frame
  and AFD alone is insufficient to describe the extent of the image.
  
  Note: either vertical or horizontal bars are specified, but not both.
  
  For more details, see:
  
  https://www.atsc.org/wp-content/uploads/2015/03/a_53-Part-4-2009.pdf
  
  and SMPTE ST2016-1
*/
class VideoBarMeta
{
  GstVideoBarMeta cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoBarMeta");

    cInstance = *cast(GstVideoBarMeta*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoBarMeta*)cPtr).meta);
  }

  @property ubyte field()
  {
    return (cast(GstVideoBarMeta*)cPtr).field;
  }

  @property void field(ubyte propval)
  {
    (cast(GstVideoBarMeta*)cPtr).field = propval;
  }

  @property bool isLetterbox()
  {
    return (cast(GstVideoBarMeta*)cPtr).isLetterbox;
  }

  @property void isLetterbox(bool propval)
  {
    (cast(GstVideoBarMeta*)cPtr).isLetterbox = propval;
  }

  @property uint barData1()
  {
    return (cast(GstVideoBarMeta*)cPtr).barData1;
  }

  @property void barData1(uint propval)
  {
    (cast(GstVideoBarMeta*)cPtr).barData1 = propval;
  }

  @property uint barData2()
  {
    return (cast(GstVideoBarMeta*)cPtr).barData2;
  }

  @property void barData2(uint propval)
  {
    (cast(GstVideoBarMeta*)cPtr).barData2 = propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_bar_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
