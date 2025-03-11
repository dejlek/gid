module gstsdp.mikeypayload_key_data;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeypayload;
import gstsdp.types;

/**
    The Key data payload contains key material. It should be added as sub
  payload to the KEMAC.
*/
class MIKEYPayloadKeyData
{
  GstMIKEYPayloadKeyData cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstSdp.MIKEYPayloadKeyData");

    cInstance = *cast(GstMIKEYPayloadKeyData*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gstsdp.mikeypayload.MIKEYPayload pt()
  {
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadKeyData*)cPtr).pt);
  }

  @property gstsdp.types.MIKEYKeyDataType keyType()
  {
    return cast(gstsdp.types.MIKEYKeyDataType)(cast(GstMIKEYPayloadKeyData*)cPtr).keyType;
  }

  @property void keyType(gstsdp.types.MIKEYKeyDataType propval)
  {
    (cast(GstMIKEYPayloadKeyData*)cPtr).keyType = cast(GstMIKEYKeyDataType)propval;
  }

  @property ushort keyLen()
  {
    return (cast(GstMIKEYPayloadKeyData*)cPtr).keyLen;
  }

  @property void keyLen(ushort propval)
  {
    (cast(GstMIKEYPayloadKeyData*)cPtr).keyLen = propval;
  }

  @property ushort saltLen()
  {
    return (cast(GstMIKEYPayloadKeyData*)cPtr).saltLen;
  }

  @property void saltLen(ushort propval)
  {
    (cast(GstMIKEYPayloadKeyData*)cPtr).saltLen = propval;
  }

  @property gstsdp.types.MIKEYKVType kvType()
  {
    return cast(gstsdp.types.MIKEYKVType)(cast(GstMIKEYPayloadKeyData*)cPtr).kvType;
  }

  @property void kvType(gstsdp.types.MIKEYKVType propval)
  {
    (cast(GstMIKEYPayloadKeyData*)cPtr).kvType = cast(GstMIKEYKVType)propval;
  }
}
