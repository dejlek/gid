module gstvideo.ancillary_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    #GstMeta for carrying SMPTE-291M Ancillary data. Note that all the ADF fields
     (@DID to @checksum) are 10bit values with parity/non-parity high-bits set.
*/
class AncillaryMeta
{
  GstAncillaryMeta cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.AncillaryMeta");

    cInstance = *cast(GstAncillaryMeta*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstAncillaryMeta*)cPtr).meta);
  }

  @property gstvideo.types.AncillaryMetaField field()
  {
    return cast(gstvideo.types.AncillaryMetaField)(cast(GstAncillaryMeta*)cPtr).field;
  }

  @property void field(gstvideo.types.AncillaryMetaField propval)
  {
    (cast(GstAncillaryMeta*)cPtr).field = cast(GstAncillaryMetaField)propval;
  }

  @property bool cNotYChannel()
  {
    return (cast(GstAncillaryMeta*)cPtr).cNotYChannel;
  }

  @property void cNotYChannel(bool propval)
  {
    (cast(GstAncillaryMeta*)cPtr).cNotYChannel = propval;
  }

  @property ushort line()
  {
    return (cast(GstAncillaryMeta*)cPtr).line;
  }

  @property void line(ushort propval)
  {
    (cast(GstAncillaryMeta*)cPtr).line = propval;
  }

  @property ushort offset()
  {
    return (cast(GstAncillaryMeta*)cPtr).offset;
  }

  @property void offset(ushort propval)
  {
    (cast(GstAncillaryMeta*)cPtr).offset = propval;
  }

  @property ushort DID()
  {
    return (cast(GstAncillaryMeta*)cPtr).DID;
  }

  @property void DID(ushort propval)
  {
    (cast(GstAncillaryMeta*)cPtr).DID = propval;
  }

  @property ushort SDIDBlockNumber()
  {
    return (cast(GstAncillaryMeta*)cPtr).SDIDBlockNumber;
  }

  @property void SDIDBlockNumber(ushort propval)
  {
    (cast(GstAncillaryMeta*)cPtr).SDIDBlockNumber = propval;
  }

  @property ushort dataCount()
  {
    return (cast(GstAncillaryMeta*)cPtr).dataCount;
  }

  @property void dataCount(ushort propval)
  {
    (cast(GstAncillaryMeta*)cPtr).dataCount = propval;
  }

  @property ushort checksum()
  {
    return (cast(GstAncillaryMeta*)cPtr).checksum;
  }

  @property void checksum(ushort propval)
  {
    (cast(GstAncillaryMeta*)cPtr).checksum = propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_ancillary_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
