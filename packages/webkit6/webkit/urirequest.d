/// Module for [URIRequest] class
module webkit.urirequest;

import gid.gid;
import gobject.object;
import soup.message_headers;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Represents a URI request.
    
    A #WebKitURIRequest can be created with a URI using the
    [webkitwebprocessextension.urirequest.URIRequest.new_] method, and you can get the URI of an
    existing request with the [webkitwebprocessextension.urirequest.URIRequest.getUri] one.
*/
class URIRequest : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_uri_request_get_type != &gidSymbolNotFound ? webkit_uri_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override URIRequest self()
  {
    return this;
  }

  /**
      Get `uri` property.
      Returns: The URI to which the request will be made.
  */
  @property string uri()
  {
    return getUri();
  }

  /**
      Set `uri` property.
      Params:
        propval = The URI to which the request will be made.
  */
  @property void uri(string propval)
  {
    return setUri(propval);
  }

  /**
      Creates a new #WebKitURIRequest for the given URI.
  
      Params:
        uri = an URI
      Returns: a new #WebKitURIRequest
  */
  this(string uri)
  {
    WebKitURIRequest* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = webkit_uri_request_new(_uri);
    this(_cretval, Yes.Take);
  }

  /**
      Get the HTTP headers of a #WebKitURIRequest as a #SoupMessageHeaders.
      Returns: a #SoupMessageHeaders with the HTTP headers of request
           or null if request is not an HTTP request.
  */
  soup.message_headers.MessageHeaders getHttpHeaders()
  {
    SoupMessageHeaders* _cretval;
    _cretval = webkit_uri_request_get_http_headers(cast(WebKitURIRequest*)cPtr);
    auto _retval = _cretval ? new soup.message_headers.MessageHeaders(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the HTTP method of the #WebKitURIRequest.
      Returns: the HTTP method of the #WebKitURIRequest or null if request is not
           an HTTP request.
  */
  string getHttpMethod()
  {
    const(char)* _cretval;
    _cretval = webkit_uri_request_get_http_method(cast(WebKitURIRequest*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Obtains the request URI.
      Returns: request URI, as a string.
  */
  string getUri()
  {
    const(char)* _cretval;
    _cretval = webkit_uri_request_get_uri(cast(WebKitURIRequest*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Set the URI of request
  
      Params:
        uri = an URI
  */
  void setUri(string uri)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    webkit_uri_request_set_uri(cast(WebKitURIRequest*)cPtr, _uri);
  }
}
