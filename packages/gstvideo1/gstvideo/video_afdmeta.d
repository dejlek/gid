module gstvideo.video_afdmeta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Active Format Description (AFD)
  
  For details, see Table 6.14 Active Format in:
  
  ATSC Digital Television Standard:
  Part 4 – MPEG-2 Video System Characteristics
  
  https://www.atsc.org/wp-content/uploads/2015/03/a_53-Part-4-2009.pdf
  
  and Active Format Description in Complete list of AFD codes
  
  https://en.wikipedia.org/wiki/Active_Format_Description#Complete_list_of_AFD_codes
  
  and SMPTE ST2016-1
*/
class VideoAFDMeta
{
  GstVideoAFDMeta cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoAFDMeta");

    cInstance = *cast(GstVideoAFDMeta*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoAFDMeta*)cPtr).meta);
  }

  @property ubyte field()
  {
    return (cast(GstVideoAFDMeta*)cPtr).field;
  }

  @property void field(ubyte propval)
  {
    (cast(GstVideoAFDMeta*)cPtr).field = propval;
  }

  @property gstvideo.types.VideoAFDSpec spec()
  {
    return cast(gstvideo.types.VideoAFDSpec)(cast(GstVideoAFDMeta*)cPtr).spec;
  }

  @property void spec(gstvideo.types.VideoAFDSpec propval)
  {
    (cast(GstVideoAFDMeta*)cPtr).spec = cast(GstVideoAFDSpec)propval;
  }

  @property gstvideo.types.VideoAFDValue afd()
  {
    return cast(gstvideo.types.VideoAFDValue)(cast(GstVideoAFDMeta*)cPtr).afd;
  }

  @property void afd(gstvideo.types.VideoAFDValue propval)
  {
    (cast(GstVideoAFDMeta*)cPtr).afd = cast(GstVideoAFDValue)propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_afd_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
