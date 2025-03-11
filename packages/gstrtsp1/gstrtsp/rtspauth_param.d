module gstrtsp.rtspauth_param;

import gid.gid;
import gobject.boxed;
import gstrtsp.c.functions;
import gstrtsp.c.types;
import gstrtsp.types;

/**
    RTSP Authentication parameter
*/
class RTSPAuthParam : gobject.boxed.Boxed
{

  this()
  {
    super(gMalloc(GstRTSPAuthParam.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_rtsp_auth_param_get_type != &gidSymbolNotFound ? gst_rtsp_auth_param_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPAuthParam*)cPtr).name);
  }

  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPAuthParam*)cPtr).name);
    dToC(propval, cast(void*)&(cast(GstRTSPAuthParam*)cPtr).name);
  }

  @property string value()
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPAuthParam*)cPtr).value);
  }

  @property void value(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPAuthParam*)cPtr).value);
    dToC(propval, cast(void*)&(cast(GstRTSPAuthParam*)cPtr).value);
  }

  /** */
  gstrtsp.rtspauth_param.RTSPAuthParam copy()
  {
    GstRTSPAuthParam* _cretval;
    _cretval = gst_rtsp_auth_param_copy(cast(GstRTSPAuthParam*)cPtr);
    auto _retval = _cretval ? new gstrtsp.rtspauth_param.RTSPAuthParam(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
