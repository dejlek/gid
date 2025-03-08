module gstsdp.sdpattribute;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.types;

/**
    The contents of the SDP "a=" field which contains a key/value pair.
*/
class SDPAttribute
{
  GstSDPAttribute cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstSdp.SDPAttribute");

    cInstance = *cast(GstSDPAttribute*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string key()
  {
    return (cast(GstSDPAttribute*)cPtr).key.fromCString(No.free);
  }

  @property void key(string propval)
  {
    safeFree(cast(void*)(cast(GstSDPAttribute*)cPtr).key);
    (cast(GstSDPAttribute*)cPtr).key = propval.toCString(Yes.alloc);
  }

  @property string value()
  {
    return (cast(GstSDPAttribute*)cPtr).value.fromCString(No.free);
  }

  @property void value(string propval)
  {
    safeFree(cast(void*)(cast(GstSDPAttribute*)cPtr).value);
    (cast(GstSDPAttribute*)cPtr).value = propval.toCString(Yes.alloc);
  }

  /**
      Clear the attribute.
    Returns:     GST_SDP_OK.
  */
  gstsdp.types.SDPResult clear()
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_attribute_clear(cast(GstSDPAttribute*)cPtr);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set the attribute with key and value.
    Params:
      key =       the key
      value =       the value
    Returns:     GST_SDP_OK.
  */
  gstsdp.types.SDPResult set(string key, string value = null)
  {
    GstSDPResult _cretval;
    const(char)* _key = key.toCString(No.alloc);
    const(char)* _value = value.toCString(No.alloc);
    _cretval = gst_sdp_attribute_set(cast(GstSDPAttribute*)cPtr, _key, _value);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }
}
