module gstrtsp.rtspauth_credential;

import gid.gid;
import gobject.boxed;
import gstrtsp.c.functions;
import gstrtsp.c.types;
import gstrtsp.types;

/**
    RTSP Authentication credentials
*/
class RTSPAuthCredential : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(GstRTSPAuthCredential.sizeof), Yes.take);
  }

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"dup" dup = No.dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_rtsp_auth_credential_get_type != &gidSymbolNotFound ? gst_rtsp_auth_credential_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property gstrtsp.types.RTSPAuthMethod scheme()
  {
    return cast(gstrtsp.types.RTSPAuthMethod)(cast(GstRTSPAuthCredential*)cPtr).scheme;
  }

  @property void scheme(gstrtsp.types.RTSPAuthMethod propval)
  {
    (cast(GstRTSPAuthCredential*)cPtr).scheme = cast(GstRTSPAuthMethod)propval;
  }

  @property string authorization()
  {
    return (cast(GstRTSPAuthCredential*)cPtr).authorization.fromCString(No.free);
  }

  @property void authorization(string propval)
  {
    safeFree(cast(void*)(cast(GstRTSPAuthCredential*)cPtr).authorization);
    (cast(GstRTSPAuthCredential*)cPtr).authorization = propval.toCString(Yes.alloc);
  }
}
