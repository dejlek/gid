/// Module for [RTSPAuthCredential] class
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

  /** */
  this()
  {
    super(gMalloc(GstRTSPAuthCredential.sizeof), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_rtsp_auth_credential_get_type != &gidSymbolNotFound ? gst_rtsp_auth_credential_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override RTSPAuthCredential self()
  {
    return this;
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
    return cToD!(string)(cast(void*)(cast(GstRTSPAuthCredential*)cPtr).authorization);
  }

  @property void authorization(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPAuthCredential*)cPtr).authorization);
    dToC(propval, cast(void*)&(cast(GstRTSPAuthCredential*)cPtr).authorization);
  }
}
