/// Module for [URISchemeResponse] class
module webkit.urischeme_response;

import gid.gid;
import gio.input_stream;
import gobject.object;
import soup.message_headers;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Represents a URI scheme response.
    
    If you register a particular URI scheme in a #WebKitWebContext,
    using [webkit.web_context.WebContext.registerUriScheme], you have to provide
    a #WebKitURISchemeRequestCallback. After that, when a URI response
    is made with that particular scheme, your callback will be
    called. There you will be able to provide more response parameters
    when the methods and properties of a #WebKitURISchemeRequest is not
    enough.
    
    When you finished setting up your #WebKitURISchemeResponse, call
    webkit_uri_request_finish_with_response() with it to return the response.
*/
class URISchemeResponse : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_uri_scheme_response_get_type != &gidSymbolNotFound ? webkit_uri_scheme_response_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override URISchemeResponse self()
  {
    return this;
  }

  /**
      Create a new #WebKitURISchemeResponse
  
      Params:
        inputStream = a #GInputStream to read the contents of the request
        streamLength = the length of the stream or -1 if not known
      Returns: the newly created #WebKitURISchemeResponse.
  */
  this(gio.input_stream.InputStream inputStream, long streamLength)
  {
    WebKitURISchemeResponse* _cretval;
    _cretval = webkit_uri_scheme_response_new(inputStream ? cast(GInputStream*)inputStream._cPtr(No.Dup) : null, streamLength);
    this(_cretval, Yes.Take);
  }

  /**
      Sets the content type for the response
  
      Params:
        contentType = the content type of the stream
  */
  void setContentType(string contentType)
  {
    const(char)* _contentType = contentType.toCString(No.Alloc);
    webkit_uri_scheme_response_set_content_type(cast(WebKitURISchemeResponse*)this._cPtr, _contentType);
  }

  /**
      Assign the provided #SoupMessageHeaders to the response.
      
      headers need to be of the type [soup.types.MessageHeadersType.Response].
      Any existing headers will be overwritten.
  
      Params:
        headers = the HTTP headers to be set
  */
  void setHttpHeaders(soup.message_headers.MessageHeaders headers)
  {
    webkit_uri_scheme_response_set_http_headers(cast(WebKitURISchemeResponse*)this._cPtr, headers ? cast(SoupMessageHeaders*)headers._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the status code and reason phrase for the response.
      
      If status_code is a known value and reason_phrase is null, the reason_phrase will be set automatically.
  
      Params:
        statusCode = the HTTP status code to be returned
        reasonPhrase = a reason phrase
  */
  void setStatus(uint statusCode, string reasonPhrase = null)
  {
    const(char)* _reasonPhrase = reasonPhrase.toCString(No.Alloc);
    webkit_uri_scheme_response_set_status(cast(WebKitURISchemeResponse*)this._cPtr, statusCode, _reasonPhrase);
  }
}
