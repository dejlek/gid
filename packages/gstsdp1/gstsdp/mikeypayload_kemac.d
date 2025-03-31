/// Module for [MIKEYPayloadKEMAC] class
module gstsdp.mikeypayload_kemac;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeypayload;
import gstsdp.types;

/**
    A structure holding the KEMAC payload
*/
class MIKEYPayloadKEMAC
{
  GstMIKEYPayloadKEMAC cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstSdp.MIKEYPayloadKEMAC");

    cInstance = *cast(GstMIKEYPayloadKEMAC*)ptr;

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
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadKEMAC*)cPtr).pt);
  }

  @property gstsdp.types.MIKEYEncAlg encAlg()
  {
    return cast(gstsdp.types.MIKEYEncAlg)(cast(GstMIKEYPayloadKEMAC*)cPtr).encAlg;
  }

  @property void encAlg(gstsdp.types.MIKEYEncAlg propval)
  {
    (cast(GstMIKEYPayloadKEMAC*)cPtr).encAlg = cast(GstMIKEYEncAlg)propval;
  }

  @property gstsdp.types.MIKEYMacAlg macAlg()
  {
    return cast(gstsdp.types.MIKEYMacAlg)(cast(GstMIKEYPayloadKEMAC*)cPtr).macAlg;
  }

  @property void macAlg(gstsdp.types.MIKEYMacAlg propval)
  {
    (cast(GstMIKEYPayloadKEMAC*)cPtr).macAlg = cast(GstMIKEYMacAlg)propval;
  }
}
