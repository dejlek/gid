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

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstSdp.SDPAttribute");

    cInstance = *cast(GstSDPAttribute*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string key()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPAttribute*)cPtr).key);
  }

  @property void key(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPAttribute*)cPtr).key);
    dToC(propval, cast(void*)&(cast(GstSDPAttribute*)cPtr).key);
  }

  @property string value()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPAttribute*)cPtr).value);
  }

  @property void value(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPAttribute*)cPtr).value);
    dToC(propval, cast(void*)&(cast(GstSDPAttribute*)cPtr).value);
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
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    _cretval = gst_sdp_attribute_set(cast(GstSDPAttribute*)cPtr, _key, _value);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }
}
