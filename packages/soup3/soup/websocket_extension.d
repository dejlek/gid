module soup.websocket_extension;

import gid.gid;
import glib.bytes;
import glib.error;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.types;

/**
    A WebSocket extension
  
  #SoupWebsocketExtension is the base class for WebSocket extension objects.
*/
class WebsocketExtension : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_websocket_extension_get_type != &gidSymbolNotFound ? soup_websocket_extension_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Get the parameters strings to be included in the request header.
    
    If the extension doesn't include any parameter in the request, this function
    returns null.
    Returns:     a new allocated string with the parameters
  */
  string getRequestParams()
  {
    char* _cretval;
    _cretval = soup_websocket_extension_get_request_params(cast(SoupWebsocketExtension*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
    return _retval;
  }

  /**
      Get the parameters strings to be included in the response header.
    
    If the extension doesn't include any parameter in the response, this function
    returns null.
    Returns:     a new allocated string with the parameters
  */
  string getResponseParams()
  {
    char* _cretval;
    _cretval = soup_websocket_extension_get_response_params(cast(SoupWebsocketExtension*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
    return _retval;
  }

  /**
      Process a message after it's received.
    
    If the payload isn't changed the given payload is just returned, otherwise
    [glib.bytes.Bytes.unref] is called on the given payload and a new
    [glib.bytes.Bytes] is returned with the new data.
    
    Extensions using reserved bits of the header will reset them in header.
    Params:
      header =       the message header
      payload =       the payload data
    Returns:     the message payload data, or null in case of error
  */
  glib.bytes.Bytes processIncomingMessage(ref ubyte header, glib.bytes.Bytes payload)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = soup_websocket_extension_process_incoming_message(cast(SoupWebsocketExtension*)cPtr, cast(ubyte*)&header, payload ? cast(GBytes*)payload.cPtr(Yes.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Process a message before it's sent.
    
    If the payload isn't changed the given payload is just returned, otherwise
    `methodGlib.Bytes.unref` is called on the given payload and a new
    [glib.bytes.Bytes] is returned with the new data.
    
    Extensions using reserved bits of the header will change them in header.
    Params:
      header =       the message header
      payload =       the payload data
    Returns:     the message payload data, or null in case of error
  */
  glib.bytes.Bytes processOutgoingMessage(ref ubyte header, glib.bytes.Bytes payload)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = soup_websocket_extension_process_outgoing_message(cast(SoupWebsocketExtension*)cPtr, cast(ubyte*)&header, payload ? cast(GBytes*)payload.cPtr(Yes.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }
}
