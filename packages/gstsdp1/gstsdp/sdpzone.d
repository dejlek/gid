module gstsdp.sdpzone;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.types;

/**
    The contents of the SDP "z=" field which allows the sender to
  specify a list of time zone adjustments and offsets from the base
  time.
*/
class SDPZone
{
  GstSDPZone cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstSdp.SDPZone");

    cInstance = *cast(GstSDPZone*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string time()
  {
    return (cast(GstSDPZone*)cPtr).time.fromCString(No.Free);
  }

  @property void time(string propval)
  {
    safeFree(cast(void*)(cast(GstSDPZone*)cPtr).time);
    (cast(GstSDPZone*)cPtr).time = propval.toCString(Yes.Alloc);
  }

  @property string typedTime()
  {
    return (cast(GstSDPZone*)cPtr).typedTime.fromCString(No.Free);
  }

  @property void typedTime(string propval)
  {
    safeFree(cast(void*)(cast(GstSDPZone*)cPtr).typedTime);
    (cast(GstSDPZone*)cPtr).typedTime = propval.toCString(Yes.Alloc);
  }

  /**
      Reset the zone information in zone.
    Returns:     a #GstSDPResult.
  */
  gstsdp.types.SDPResult clear()
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_zone_clear(cast(GstSDPZone*)cPtr);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set zone information in zone.
    Params:
      adjTime =       the NTP time that a time zone adjustment happens
      typedTime =       the offset from the time when the session was first scheduled
    Returns:     a #GstSDPResult.
  */
  gstsdp.types.SDPResult set(string adjTime, string typedTime)
  {
    GstSDPResult _cretval;
    const(char)* _adjTime = adjTime.toCString(No.Alloc);
    const(char)* _typedTime = typedTime.toCString(No.Alloc);
    _cretval = gst_sdp_zone_set(cast(GstSDPZone*)cPtr, _adjTime, _typedTime);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }
}
