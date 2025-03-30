/// Module for [RTSPUrl] class
module gstrtsp.rtspurl;

import gid.gid;
import gobject.boxed;
import gstrtsp.c.functions;
import gstrtsp.c.types;
import gstrtsp.types;

/**
    Provides helper functions to handle RTSP urls.
*/
class RTSPUrl : gobject.boxed.Boxed
{

  /** */
  this()
  {
    super(gMalloc(GstRTSPUrl.sizeof), Yes.Take);
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
    return cast(void function())gst_rtsp_url_get_type != &gidSymbolNotFound ? gst_rtsp_url_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override RTSPUrl self()
  {
    return this;
  }

  @property gstrtsp.types.RTSPLowerTrans transports()
  {
    return cast(gstrtsp.types.RTSPLowerTrans)(cast(GstRTSPUrl*)cPtr).transports;
  }

  @property void transports(gstrtsp.types.RTSPLowerTrans propval)
  {
    (cast(GstRTSPUrl*)cPtr).transports = cast(GstRTSPLowerTrans)propval;
  }

  @property gstrtsp.types.RTSPFamily family()
  {
    return cast(gstrtsp.types.RTSPFamily)(cast(GstRTSPUrl*)cPtr).family;
  }

  @property void family(gstrtsp.types.RTSPFamily propval)
  {
    (cast(GstRTSPUrl*)cPtr).family = cast(GstRTSPFamily)propval;
  }

  @property string user()
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPUrl*)cPtr).user);
  }

  @property void user(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPUrl*)cPtr).user);
    dToC(propval, cast(void*)&(cast(GstRTSPUrl*)cPtr).user);
  }

  @property string passwd()
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPUrl*)cPtr).passwd);
  }

  @property void passwd(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPUrl*)cPtr).passwd);
    dToC(propval, cast(void*)&(cast(GstRTSPUrl*)cPtr).passwd);
  }

  @property string host()
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPUrl*)cPtr).host);
  }

  @property void host(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPUrl*)cPtr).host);
    dToC(propval, cast(void*)&(cast(GstRTSPUrl*)cPtr).host);
  }

  @property ushort port()
  {
    return (cast(GstRTSPUrl*)cPtr).port;
  }

  @property void port(ushort propval)
  {
    (cast(GstRTSPUrl*)cPtr).port = propval;
  }

  @property string abspath()
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPUrl*)cPtr).abspath);
  }

  @property void abspath(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPUrl*)cPtr).abspath);
    dToC(propval, cast(void*)&(cast(GstRTSPUrl*)cPtr).abspath);
  }

  @property string query()
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPUrl*)cPtr).query);
  }

  @property void query(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPUrl*)cPtr).query);
    dToC(propval, cast(void*)&(cast(GstRTSPUrl*)cPtr).query);
  }

  /**
      Make a copy of url.
      Returns: a copy of url. Free with gst_rtsp_url_free () after usage.
  */
  gstrtsp.rtspurl.RTSPUrl copy()
  {
    GstRTSPUrl* _cretval;
    _cretval = gst_rtsp_url_copy(cast(const(GstRTSPUrl)*)cPtr);
    auto _retval = _cretval ? new gstrtsp.rtspurl.RTSPUrl(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Splits the path of url on '/' boundaries, decoding the resulting components,
      
      The decoding performed by this routine is "URI decoding", as defined in RFC
      3986, commonly known as percent-decoding. For example, a string "foo\`2fbar`"
      will decode to "foo/bar" -- the \`2f` being replaced by the corresponding byte
      with hex value 0x2f. Note that there is no guarantee that the resulting byte
      sequence is valid in any given encoding. As a special case, \`00` is not
      unescaped to NUL, as that would prematurely terminate the string.
      
      Also note that since paths usually start with a slash, the first component
      will usually be the empty string.
      Returns: null-terminated array of URL components. Free with
        [glib.global.strfreev] when no longer needed.
  */
  string[] decodePathComponents()
  {
    char** _cretval;
    _cretval = gst_rtsp_url_decode_path_components(cast(const(GstRTSPUrl)*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /**
      Get the port number of url.
  
      Params:
        port = location to hold the port
      Returns: #GST_RTSP_OK.
  */
  gstrtsp.types.RTSPResult getPort(out ushort port)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_url_get_port(cast(const(GstRTSPUrl)*)cPtr, cast(ushort*)&port);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Get a newly allocated string describing the request URI for url.
      Returns: a string with the request URI. [glib.global.gfree] after usage.
  */
  string getRequestUri()
  {
    char* _cretval;
    _cretval = gst_rtsp_url_get_request_uri(cast(const(GstRTSPUrl)*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get a newly allocated string describing the request URI for url
      combined with the control path for control_path
  
      Params:
        controlPath = an RTSP aggregate control path
      Returns: a string with the request URI combined with the control path.
        [glib.global.gfree] after usage.
  */
  string getRequestUriWithControl(string controlPath)
  {
    char* _cretval;
    const(char)* _controlPath = controlPath.toCString(No.Alloc);
    _cretval = gst_rtsp_url_get_request_uri_with_control(cast(const(GstRTSPUrl)*)cPtr, _controlPath);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Set the port number in url to port.
  
      Params:
        port = the port
      Returns: #GST_RTSP_OK.
  */
  gstrtsp.types.RTSPResult setPort(ushort port)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_url_set_port(cast(GstRTSPUrl*)cPtr, port);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Parse the RTSP urlstr into a newly allocated #GstRTSPUrl. Free after usage
      with [gstrtsp.rtspurl.RTSPUrl.free].
  
      Params:
        urlstr = the url string to parse
        url = location to hold the result.
      Returns: a #GstRTSPResult.
  */
  static gstrtsp.types.RTSPResult parse(string urlstr, out gstrtsp.rtspurl.RTSPUrl url)
  {
    GstRTSPResult _cretval;
    const(char)* _urlstr = urlstr.toCString(No.Alloc);
    GstRTSPUrl* _url;
    _cretval = gst_rtsp_url_parse(_urlstr, &_url);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    url = new gstrtsp.rtspurl.RTSPUrl(cast(void*)_url, Yes.Take);
    return _retval;
  }
}
