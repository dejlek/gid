module gstsdp.sdpconnection;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.types;

/**
    The contents of the SDP "c=" field which contains connection data.
*/
class SDPConnection
{
  GstSDPConnection cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstSdp.SDPConnection");

    cInstance = *cast(GstSDPConnection*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string nettype()
  {
    return (cast(GstSDPConnection*)cPtr).nettype.fromCString(No.free);
  }

  @property void nettype(string propval)
  {
    safeFree(cast(void*)(cast(GstSDPConnection*)cPtr).nettype);
    (cast(GstSDPConnection*)cPtr).nettype = propval.toCString(Yes.alloc);
  }

  @property string addrtype()
  {
    return (cast(GstSDPConnection*)cPtr).addrtype.fromCString(No.free);
  }

  @property void addrtype(string propval)
  {
    safeFree(cast(void*)(cast(GstSDPConnection*)cPtr).addrtype);
    (cast(GstSDPConnection*)cPtr).addrtype = propval.toCString(Yes.alloc);
  }

  @property string address()
  {
    return (cast(GstSDPConnection*)cPtr).address.fromCString(No.free);
  }

  @property void address(string propval)
  {
    safeFree(cast(void*)(cast(GstSDPConnection*)cPtr).address);
    (cast(GstSDPConnection*)cPtr).address = propval.toCString(Yes.alloc);
  }

  @property uint ttl()
  {
    return (cast(GstSDPConnection*)cPtr).ttl;
  }

  @property void ttl(uint propval)
  {
    (cast(GstSDPConnection*)cPtr).ttl = propval;
  }

  @property uint addrNumber()
  {
    return (cast(GstSDPConnection*)cPtr).addrNumber;
  }

  @property void addrNumber(uint propval)
  {
    (cast(GstSDPConnection*)cPtr).addrNumber = propval;
  }

  /**
      Clear the connection.
    Returns:     GST_SDP_OK.
  */
  gstsdp.types.SDPResult clear()
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_connection_clear(cast(GstSDPConnection*)cPtr);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set the connection with the given parameters.
    Params:
      nettype =       the type of network. "IN" is defined to have the meaning
        "Internet".
      addrtype =       the type of address.
      address =       the address
      ttl =       the time to live of the address
      addrNumber =       the number of layers
    Returns:     GST_SDP_OK.
  */
  gstsdp.types.SDPResult set(string nettype, string addrtype, string address, uint ttl, uint addrNumber)
  {
    GstSDPResult _cretval;
    const(char)* _nettype = nettype.toCString(No.alloc);
    const(char)* _addrtype = addrtype.toCString(No.alloc);
    const(char)* _address = address.toCString(No.alloc);
    _cretval = gst_sdp_connection_set(cast(GstSDPConnection*)cPtr, _nettype, _addrtype, _address, ttl, addrNumber);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }
}
