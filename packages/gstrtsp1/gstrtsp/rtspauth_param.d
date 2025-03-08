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
    super(safeMalloc(GstRTSPAuthParam.sizeof), Yes.take);
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
    return cast(void function())gst_rtsp_auth_param_get_type != &gidSymbolNotFound ? gst_rtsp_auth_param_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property string name()
  {
    return (cast(GstRTSPAuthParam*)cPtr).name.fromCString(No.free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GstRTSPAuthParam*)cPtr).name);
    (cast(GstRTSPAuthParam*)cPtr).name = propval.toCString(Yes.alloc);
  }

  @property string value()
  {
    return (cast(GstRTSPAuthParam*)cPtr).value.fromCString(No.free);
  }

  @property void value(string propval)
  {
    safeFree(cast(void*)(cast(GstRTSPAuthParam*)cPtr).value);
    (cast(GstRTSPAuthParam*)cPtr).value = propval.toCString(Yes.alloc);
  }

  /** */
  gstrtsp.rtspauth_param.RTSPAuthParam copy()
  {
    GstRTSPAuthParam* _cretval;
    _cretval = gst_rtsp_auth_param_copy(cast(GstRTSPAuthParam*)cPtr);
    auto _retval = _cretval ? new gstrtsp.rtspauth_param.RTSPAuthParam(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }
}
