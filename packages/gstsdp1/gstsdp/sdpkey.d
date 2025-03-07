module gstsdp.sdpkey;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.types;

/**
    The contents of the SDP "k=" field which is used to convey encryption
  keys.
*/
class SDPKey
{
  GstSDPKey cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstSdp.SDPKey");

    cInstance = *cast(GstSDPKey*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string type()
  {
    return (cast(GstSDPKey*)cPtr).type.fromCString(No.Free);
  }

  @property void type(string propval)
  {
    safeFree(cast(void*)(cast(GstSDPKey*)cPtr).type);
    (cast(GstSDPKey*)cPtr).type = propval.toCString(Yes.Alloc);
  }

  @property string data()
  {
    return (cast(GstSDPKey*)cPtr).data.fromCString(No.Free);
  }

  @property void data(string propval)
  {
    safeFree(cast(void*)(cast(GstSDPKey*)cPtr).data);
    (cast(GstSDPKey*)cPtr).data = propval.toCString(Yes.Alloc);
  }
}
