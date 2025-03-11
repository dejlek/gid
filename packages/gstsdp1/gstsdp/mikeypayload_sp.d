module gstsdp.mikeypayload_sp;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeypayload;
import gstsdp.types;

/**
    The Security Policy payload defines a set of policies that apply to a
  specific security protocol
*/
class MIKEYPayloadSP
{
  GstMIKEYPayloadSP cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstSdp.MIKEYPayloadSP");

    cInstance = *cast(GstMIKEYPayloadSP*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gstsdp.mikeypayload.MIKEYPayload pt()
  {
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadSP*)cPtr).pt);
  }

  @property uint policy()
  {
    return (cast(GstMIKEYPayloadSP*)cPtr).policy;
  }

  @property void policy(uint propval)
  {
    (cast(GstMIKEYPayloadSP*)cPtr).policy = propval;
  }

  @property gstsdp.types.MIKEYSecProto proto()
  {
    return cast(gstsdp.types.MIKEYSecProto)(cast(GstMIKEYPayloadSP*)cPtr).proto;
  }

  @property void proto(gstsdp.types.MIKEYSecProto propval)
  {
    (cast(GstMIKEYPayloadSP*)cPtr).proto = cast(GstMIKEYSecProto)propval;
  }
}
