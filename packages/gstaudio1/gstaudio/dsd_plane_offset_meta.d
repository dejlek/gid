module gstaudio.dsd_plane_offset_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    Buffer metadata describing planar DSD contents in the buffer. This is not needed
  for interleaved DSD data, and is required for non-interleaved (= planar) data.
  
  The different channels in @offsets are always in the GStreamer channel order.
  Zero-copy channel reordering can be implemented by swapping the values in
  @offsets.
  
  It is not allowed for channels to overlap in memory,
  i.e. for each i in [0, channels), the range
  [@offsets[i], @offsets[i] + @num_bytes_per_channel) must not overlap
  with any other such range.
  
  It is, however, allowed to have parts of the buffer memory unused, by using
  @offsets and @num_bytes_per_channel in such a way that leave gaps on it.
  This is used to implement zero-copy clipping in non-interleaved buffers.
  
  Obviously, due to the above, it is not safe to infer the
  number of valid bytes from the size of the buffer. You should always
  use the @num_bytes_per_channel variable of this metadata.
*/
class DsdPlaneOffsetMeta
{
  GstDsdPlaneOffsetMeta cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstAudio.DsdPlaneOffsetMeta");

    cInstance = *cast(GstDsdPlaneOffsetMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstDsdPlaneOffsetMeta*)cPtr).meta);
  }

  @property int numChannels()
  {
    return (cast(GstDsdPlaneOffsetMeta*)cPtr).numChannels;
  }

  @property void numChannels(int propval)
  {
    (cast(GstDsdPlaneOffsetMeta*)cPtr).numChannels = propval;
  }

  @property size_t numBytesPerChannel()
  {
    return (cast(GstDsdPlaneOffsetMeta*)cPtr).numBytesPerChannel;
  }

  @property void numBytesPerChannel(size_t propval)
  {
    (cast(GstDsdPlaneOffsetMeta*)cPtr).numBytesPerChannel = propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_dsd_plane_offset_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
