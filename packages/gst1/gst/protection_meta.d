module gst.protection_meta;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.meta;
import gst.meta_info;
import gst.structure;
import gst.types;

/**
    Metadata type that holds information about a sample from a protection-protected
  track, including the information needed to decrypt it (if it is encrypted).
*/
class ProtectionMeta
{
  GstProtectionMeta cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gst.ProtectionMeta");

    cInstance = *cast(GstProtectionMeta*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstProtectionMeta*)cPtr).meta);
  }

  @property gst.structure.Structure info()
  {
    return new gst.structure.Structure(cast(GstStructure*)(cast(GstProtectionMeta*)cPtr).info);
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_protection_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
