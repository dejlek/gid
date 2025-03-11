module gstvideo.video_region_of_interest_meta;

import gid.gid;
import glib.types;
import gst.meta;
import gst.meta_info;
import gst.structure;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Extra buffer metadata describing an image region of interest
*/
class VideoRegionOfInterestMeta
{
  GstVideoRegionOfInterestMeta cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoRegionOfInterestMeta");

    cInstance = *cast(GstVideoRegionOfInterestMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoRegionOfInterestMeta*)cPtr).meta);
  }

  @property glib.types.Quark roiType()
  {
    return (cast(GstVideoRegionOfInterestMeta*)cPtr).roiType;
  }

  @property void roiType(glib.types.Quark propval)
  {
    (cast(GstVideoRegionOfInterestMeta*)cPtr).roiType = propval;
  }

  @property int id()
  {
    return (cast(GstVideoRegionOfInterestMeta*)cPtr).id;
  }

  @property void id(int propval)
  {
    (cast(GstVideoRegionOfInterestMeta*)cPtr).id = propval;
  }

  @property int parentId()
  {
    return (cast(GstVideoRegionOfInterestMeta*)cPtr).parentId;
  }

  @property void parentId(int propval)
  {
    (cast(GstVideoRegionOfInterestMeta*)cPtr).parentId = propval;
  }

  @property uint x()
  {
    return (cast(GstVideoRegionOfInterestMeta*)cPtr).x;
  }

  @property void x(uint propval)
  {
    (cast(GstVideoRegionOfInterestMeta*)cPtr).x = propval;
  }

  @property uint y()
  {
    return (cast(GstVideoRegionOfInterestMeta*)cPtr).y;
  }

  @property void y(uint propval)
  {
    (cast(GstVideoRegionOfInterestMeta*)cPtr).y = propval;
  }

  @property uint w()
  {
    return (cast(GstVideoRegionOfInterestMeta*)cPtr).w;
  }

  @property void w(uint propval)
  {
    (cast(GstVideoRegionOfInterestMeta*)cPtr).w = propval;
  }

  @property uint h()
  {
    return (cast(GstVideoRegionOfInterestMeta*)cPtr).h;
  }

  @property void h(uint propval)
  {
    (cast(GstVideoRegionOfInterestMeta*)cPtr).h = propval;
  }

  /**
      Attach element-specific parameters to meta meant to be used by downstream
    elements which may handle this ROI.
    The name of s is used to identify the element these parameters are meant for.
    
    This is typically used to tell encoders how they should encode this specific region.
    For example, a structure named "roi/x264enc" could be used to give the
    QP offsets this encoder should use when encoding the region described in meta.
    Multiple parameters can be defined for the same meta so different encoders
    can be supported by cross platform applications).
    Params:
      s =       a #GstStructure
  */
  void addParam(gst.structure.Structure s)
  {
    gst_video_region_of_interest_meta_add_param(cast(GstVideoRegionOfInterestMeta*)cPtr, s ? cast(GstStructure*)s.cPtr(Yes.Dup) : null);
  }

  /**
      Retrieve the parameter for meta having name as structure name,
    or null if there is none.
    Params:
      name =       a name.
    Returns:     a #GstStructure
  
    Version: See also: gst_video_region_of_interest_meta_add_param()
  */
  gst.structure.Structure getParam(string name)
  {
    GstStructure* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_video_region_of_interest_meta_get_param(cast(GstVideoRegionOfInterestMeta*)cPtr, _name);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_region_of_interest_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
