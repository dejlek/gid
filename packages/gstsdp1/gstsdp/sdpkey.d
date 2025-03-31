/// Module for [SDPKey] class
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstSdp.SDPKey");

    cInstance = *cast(GstSDPKey*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string type()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPKey*)cPtr).type);
  }

  @property void type(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPKey*)cPtr).type);
    dToC(propval, cast(void*)&(cast(GstSDPKey*)cPtr).type);
  }

  @property string data()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPKey*)cPtr).data);
  }

  @property void data(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPKey*)cPtr).data);
    dToC(propval, cast(void*)&(cast(GstSDPKey*)cPtr).data);
  }
}
