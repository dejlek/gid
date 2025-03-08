module gstsdp.sdpbandwidth;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.types;

/**
    The contents of the SDP "b=" field which specifies the proposed bandwidth to
  be used by the session or media.
*/
class SDPBandwidth
{
  GstSDPBandwidth cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstSdp.SDPBandwidth");

    cInstance = *cast(GstSDPBandwidth*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string bwtype()
  {
    return (cast(GstSDPBandwidth*)cPtr).bwtype.fromCString(No.free);
  }

  @property void bwtype(string propval)
  {
    safeFree(cast(void*)(cast(GstSDPBandwidth*)cPtr).bwtype);
    (cast(GstSDPBandwidth*)cPtr).bwtype = propval.toCString(Yes.alloc);
  }

  @property uint bandwidth()
  {
    return (cast(GstSDPBandwidth*)cPtr).bandwidth;
  }

  @property void bandwidth(uint propval)
  {
    (cast(GstSDPBandwidth*)cPtr).bandwidth = propval;
  }

  /**
      Reset the bandwidth information in bw.
    Returns:     a #GstSDPResult.
  */
  gstsdp.types.SDPResult clear()
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_bandwidth_clear(cast(GstSDPBandwidth*)cPtr);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set bandwidth information in bw.
    Params:
      bwtype =       the bandwidth modifier type
      bandwidth =       the bandwidth in kilobits per second
    Returns:     a #GstSDPResult.
  */
  gstsdp.types.SDPResult set(string bwtype, uint bandwidth)
  {
    GstSDPResult _cretval;
    const(char)* _bwtype = bwtype.toCString(No.alloc);
    _cretval = gst_sdp_bandwidth_set(cast(GstSDPBandwidth*)cPtr, _bwtype, bandwidth);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }
}
