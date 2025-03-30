/// Module for [SDPOrigin] class
module gstsdp.sdporigin;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.types;

/**
    The contents of the SDP "o=" field which gives the originator of the session
    (their username and the address of the user's host) plus a session id and
    session version number.
*/
class SDPOrigin
{
  GstSDPOrigin cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstSdp.SDPOrigin");

    cInstance = *cast(GstSDPOrigin*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string username()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)cPtr).username);
  }

  @property void username(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPOrigin*)cPtr).username);
    dToC(propval, cast(void*)&(cast(GstSDPOrigin*)cPtr).username);
  }

  @property string sessId()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)cPtr).sessId);
  }

  @property void sessId(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPOrigin*)cPtr).sessId);
    dToC(propval, cast(void*)&(cast(GstSDPOrigin*)cPtr).sessId);
  }

  @property string sessVersion()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)cPtr).sessVersion);
  }

  @property void sessVersion(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPOrigin*)cPtr).sessVersion);
    dToC(propval, cast(void*)&(cast(GstSDPOrigin*)cPtr).sessVersion);
  }

  @property string nettype()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)cPtr).nettype);
  }

  @property void nettype(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPOrigin*)cPtr).nettype);
    dToC(propval, cast(void*)&(cast(GstSDPOrigin*)cPtr).nettype);
  }

  @property string addrtype()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)cPtr).addrtype);
  }

  @property void addrtype(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPOrigin*)cPtr).addrtype);
    dToC(propval, cast(void*)&(cast(GstSDPOrigin*)cPtr).addrtype);
  }

  @property string addr()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)cPtr).addr);
  }

  @property void addr(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPOrigin*)cPtr).addr);
    dToC(propval, cast(void*)&(cast(GstSDPOrigin*)cPtr).addr);
  }
}
