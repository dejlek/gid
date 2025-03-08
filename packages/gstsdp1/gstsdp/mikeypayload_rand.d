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

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstSdp.MIKEYPayloadRAND");

    cInstance = *cast(GstMIKEYPayloadRAND*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gstsdp.mikeypayload.MIKEYPayload pt()
  {
    return new gstsdp.mikeypayload.MIKEYPayload(cast(GstMIKEYPayload*)&(cast(GstMIKEYPayloadRAND*)cPtr).pt);
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
