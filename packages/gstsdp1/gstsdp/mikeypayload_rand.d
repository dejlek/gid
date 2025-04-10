/// Module for [MIKEYPayloadRAND] class
module gstsdp.mikeypayload_rand;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeypayload;
import gstsdp.types;

/**
    The RAND payload consists of a (pseudo-)random bit-string
*/
class MIKEYPayloadRAND
{
  GstMIKEYPayloadRAND cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstSdp.MIKEYPayloadRAND");

    cInstance = *cast(GstMIKEYPayloadRAND*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gstsdp.mikeypayload.MIKEYPayload pt()
  {
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadRAND*)cPtr).pt);
  }

  @property ubyte len()
  {
    return (cast(GstMIKEYPayloadRAND*)cPtr).len;
  }

  @property void len(ubyte propval)
  {
    (cast(GstMIKEYPayloadRAND*)cPtr).len = propval;
  }
}
