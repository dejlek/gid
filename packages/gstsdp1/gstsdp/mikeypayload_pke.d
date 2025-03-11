module gstsdp.mikeypayload_pke;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeypayload;
import gstsdp.types;

/**
    The Envelope data payload contains the encrypted envelope key that is
  used in the public-key transport to protect the data in the Key data
  transport payload.  The encryption algorithm used is implicit from
  the certificate/public key used.
*/
class MIKEYPayloadPKE
{
  GstMIKEYPayloadPKE cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstSdp.MIKEYPayloadPKE");

    cInstance = *cast(GstMIKEYPayloadPKE*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gstsdp.mikeypayload.MIKEYPayload pt()
  {
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadPKE*)cPtr).pt);
  }

  @property gstsdp.types.MIKEYCacheType C()
  {
    return cast(gstsdp.types.MIKEYCacheType)(cast(GstMIKEYPayloadPKE*)cPtr).C;
  }

  @property void C(gstsdp.types.MIKEYCacheType propval)
  {
    (cast(GstMIKEYPayloadPKE*)cPtr).C = cast(GstMIKEYCacheType)propval;
  }

  @property ushort dataLen()
  {
    return (cast(GstMIKEYPayloadPKE*)cPtr).dataLen;
  }

  @property void dataLen(ushort propval)
  {
    (cast(GstMIKEYPayloadPKE*)cPtr).dataLen = propval;
  }
}
