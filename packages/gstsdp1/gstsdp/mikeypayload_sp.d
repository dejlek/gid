/// Module for [MIKEYPayloadSP] class
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstsdp.mikeypayload_sp.MIKEYPayloadSP");

    cInstance = *cast(GstMIKEYPayloadSP*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `pt` field.
      Returns: the payload header
  */
  @property gstsdp.mikeypayload.MIKEYPayload pt()
  {
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadSP*)cPtr).pt);
  }

  /**
      Get `policy` field.
      Returns: the policy number
  */
  @property uint policy()
  {
    return (cast(GstMIKEYPayloadSP*)cPtr).policy;
  }

  /**
      Set `policy` field.
      Params:
        propval = the policy number
  */
  @property void policy(uint propval)
  {
    (cast(GstMIKEYPayloadSP*)cPtr).policy = propval;
  }

  /**
      Get `proto` field.
      Returns: the security protocol
  */
  @property gstsdp.types.MIKEYSecProto proto()
  {
    return cast(gstsdp.types.MIKEYSecProto)(cast(GstMIKEYPayloadSP*)cPtr).proto;
  }

  /**
      Set `proto` field.
      Params:
        propval = the security protocol
  */
  @property void proto(gstsdp.types.MIKEYSecProto propval)
  {
    (cast(GstMIKEYPayloadSP*)cPtr).proto = cast(GstMIKEYSecProto)propval;
  }
}
