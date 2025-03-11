module gstvideo.video_meta;

import gid.gid;
import gst.buffer;
import gst.map_info;
import gst.meta;
import gst.meta_info;
import gst.types;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_alignment;

/**
    Extra buffer metadata describing image properties
  
  This meta can also be used by downstream elements to specifiy their
  buffer layout requirements for upstream. Upstream should try to
  fit those requirements, if possible, in order to prevent buffer copies.
  
  This is done by passing a custom #GstStructure to
  [gst.query.Query.addAllocationMeta] when handling the ALLOCATION query.
  This structure should be named 'video-meta' and can have the following
  fields:
  $(LIST
    * padding-top (uint): extra pixels on the top
    * padding-bottom (uint): extra pixels on the bottom
    * padding-left (uint): extra pixels on the left side
    * padding-right (uint): extra pixels on the right side
  )
  The padding fields have the same semantic as #GstVideoMeta.alignment
  and so represent the paddings requested on produced video buffers.
  
  Since 1.24 it can be serialized using [gst.meta.Meta.serialize] and
  [gst.meta.Meta.deserialize].
*/
class VideoMeta
{
  GstVideoMeta cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoMeta");

    cInstance = *cast(GstVideoMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoMeta*)cPtr).meta);
  }

  @property gst.buffer.Buffer buffer()
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoMeta*)cPtr).buffer);
  }

  @property void buffer(gst.buffer.Buffer propval)
  {
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoMeta*)cPtr).buffer);
    dToC(propval, cast(void*)&(cast(GstVideoMeta*)cPtr).buffer);
  }

  @property gstvideo.types.VideoFrameFlags flags()
  {
    return cast(gstvideo.types.VideoFrameFlags)(cast(GstVideoMeta*)cPtr).flags;
  }

  @property void flags(gstvideo.types.VideoFrameFlags propval)
  {
    (cast(GstVideoMeta*)cPtr).flags = cast(GstVideoFrameFlags)propval;
  }

  @property gstvideo.types.VideoFormat format()
  {
    return cast(gstvideo.types.VideoFormat)(cast(GstVideoMeta*)cPtr).format;
  }

  @property void format(gstvideo.types.VideoFormat propval)
  {
    (cast(GstVideoMeta*)cPtr).format = cast(GstVideoFormat)propval;
  }

  @property int id()
  {
    return (cast(GstVideoMeta*)cPtr).id;
  }

  @property void id(int propval)
  {
    (cast(GstVideoMeta*)cPtr).id = propval;
  }

  @property uint width()
  {
    return (cast(GstVideoMeta*)cPtr).width;
  }

  @property void width(uint propval)
  {
    (cast(GstVideoMeta*)cPtr).width = propval;
  }

  @property uint height()
  {
    return (cast(GstVideoMeta*)cPtr).height;
  }

  @property void height(uint propval)
  {
    (cast(GstVideoMeta*)cPtr).height = propval;
  }

  @property uint nPlanes()
  {
    return (cast(GstVideoMeta*)cPtr).nPlanes;
  }

  @property void nPlanes(uint propval)
  {
    (cast(GstVideoMeta*)cPtr).nPlanes = propval;
  }

  alias UnmapFuncType = extern(C) bool function(GstVideoMeta* meta, uint plane, GstMapInfo* info);

  @property UnmapFuncType unmap()
  {
    return (cast(GstVideoMeta*)cPtr).unmap;
  }

  @property gstvideo.video_alignment.VideoAlignment alignment()
  {
    return new gstvideo.video_alignment.VideoAlignment(cast(GstVideoAlignment*)&(cast(GstVideoMeta*)cPtr).alignment);
  }

  /**
      Compute the padded height of each plane from meta (padded size
    divided by stride).
    
    It is not valid to call this function with a meta associated to a
    TILED video format.
    Params:
      planeHeight =       array used to store the plane height
    Returns:     true if meta's alignment is valid and plane_height has been
      updated, false otherwise
  */
  bool getPlaneHeight(ref uint[] planeHeight)
  {
    bool _retval;
    _retval = gst_video_meta_get_plane_height(cast(GstVideoMeta*)cPtr, planeHeight.ptr);
    return _retval;
  }

  /**
      Compute the size, in bytes, of each video plane described in meta including
    any padding and alignment constraint defined in meta->alignment.
    Params:
      planeSize =       array used to store the plane sizes
    Returns:     true if meta's alignment is valid and plane_size has been
      updated, false otherwise
  */
  bool getPlaneSize(ref size_t[] planeSize)
  {
    bool _retval;
    _retval = gst_video_meta_get_plane_size(cast(GstVideoMeta*)cPtr, planeSize.ptr);
    return _retval;
  }

  /**
      Map the video plane with index plane in meta and return a pointer to the
    first byte of the plane and the stride of the plane.
    Params:
      plane =       a plane
      info =       a #GstMapInfo
      data =       the data of plane
      stride =       the stride of plane
      flags =       GstMapFlags
    Returns:     TRUE if the map operation was successful.
  */
  bool map(uint plane, gst.map_info.MapInfo info, out void* data, out int stride, gst.types.MapFlags flags)
  {
    bool _retval;
    _retval = gst_video_meta_map(cast(GstVideoMeta*)cPtr, plane, info ? cast(GstMapInfo*)info.cPtr : null, cast(void**)&data, cast(int*)&stride, flags);
    return _retval;
  }

  /**
      Unmap a previously mapped plane with [gstvideo.video_meta.VideoMeta.map].
    Params:
      plane =       a plane
      info =       a #GstMapInfo
    Returns:     TRUE if the memory was successfully unmapped.
  */
  bool unmap(uint plane, gst.map_info.MapInfo info)
  {
    bool _retval;
    _retval = gst_video_meta_unmap(cast(GstVideoMeta*)cPtr, plane, info ? cast(GstMapInfo*)info.cPtr : null);
    return _retval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
