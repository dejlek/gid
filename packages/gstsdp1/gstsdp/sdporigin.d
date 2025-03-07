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

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstSdp.SDPOrigin");

    cInstance = *cast(GstSDPOrigin*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string username()
  {
    return (cast(GstSDPOrigin*)cPtr).username.fromCString(No.Free);
  }

  @property void username(string propval)
  {
    safeFree(cast(void*)(cast(GstSDPOrigin*)cPtr).username);
    (cast(GstSDPOrigin*)cPtr).username = propval.toCString(Yes.Alloc);
  }

  @property string sessId()
  {
    return (cast(GstSDPOrigin*)cPtr).sessId.fromCString(No.Free);
  }

  @property void sessId(string propval)
  {
    safeFree(cast(void*)(cast(GstSDPOrigin*)cPtr).sessId);
    (cast(GstSDPOrigin*)cPtr).sessId = propval.toCString(Yes.Alloc);
  }

  @property string sessVersion()
  {
    return (cast(GstSDPOrigin*)cPtr).sessVersion.fromCString(No.Free);
  }

  @property void sessVersion(string propval)
  {
    safeFree(cast(void*)(cast(GstSDPOrigin*)cPtr).sessVersion);
    (cast(GstSDPOrigin*)cPtr).sessVersion = propval.toCString(Yes.Alloc);
  }

  @property string nettype()
  {
    return (cast(GstSDPOrigin*)cPtr).nettype.fromCString(No.Free);
  }

  @property void nettype(string propval)
  {
    safeFree(cast(void*)(cast(GstSDPOrigin*)cPtr).nettype);
    (cast(GstSDPOrigin*)cPtr).nettype = propval.toCString(Yes.Alloc);
  }

  @property string addrtype()
  {
    return (cast(GstSDPOrigin*)cPtr).addrtype.fromCString(No.Free);
  }

  @property void addrtype(string propval)
  {
    safeFree(cast(void*)(cast(GstSDPOrigin*)cPtr).addrtype);
    (cast(GstSDPOrigin*)cPtr).addrtype = propval.toCString(Yes.Alloc);
  }

  @property string addr()
  {
    return (cast(GstSDPOrigin*)cPtr).addr.fromCString(No.Free);
  }

  @property void addr(string propval)
  {
    safeFree(cast(void*)(cast(GstSDPOrigin*)cPtr).addr);
    (cast(GstSDPOrigin*)cPtr).addr = propval.toCString(Yes.Alloc);
  }
}
