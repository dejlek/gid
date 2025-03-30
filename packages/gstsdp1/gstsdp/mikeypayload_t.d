/// Module for [MIKEYPayloadT] class
module gstsdp.mikeypayload_t;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeypayload;
import gstsdp.types;

/**
    The timestamp payload carries the timestamp information
*/
class MIKEYPayloadT
{
  GstMIKEYPayloadT cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstSdp.MIKEYPayloadT");

    cInstance = *cast(GstMIKEYPayloadT*)ptr;

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
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadT*)cPtr).pt);
  }

  @property gstsdp.types.MIKEYTSType type()
  {
    return cast(gstsdp.types.MIKEYTSType)(cast(GstMIKEYPayloadT*)cPtr).type;
  }

  @property void type(gstsdp.types.MIKEYTSType propval)
  {
    (cast(GstMIKEYPayloadT*)cPtr).type = cast(GstMIKEYTSType)propval;
  }
}
