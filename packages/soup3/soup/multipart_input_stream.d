module soup.multipart_input_stream;

import gid.gid;
import gio.async_result;
import gio.async_result_mixin;
import gio.cancellable;
import gio.filter_input_stream;
import gio.input_stream;
import gio.pollable_input_stream;
import gio.pollable_input_stream_mixin;
import gio.types;
import glib.error;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.message;
import soup.message_headers;
import soup.types;

/**
 * Handles streams of multipart messages.
 * This adds support for the multipart responses. For handling the
 * multiple parts the user needs to wrap the [Gio.InputStream] obtained by
 * sending the request with a class@MultipartInputStream and use
 * [Soup.MultipartInputStream.nextPart] before reading. Responses
 * which are not wrapped will be treated like non-multipart responses.
 * Note that although #SoupMultipartInputStream is a [Gio.InputStream],
 * you should not read directly from it, and the results are undefined
 * if you do.
 */
class MultipartInputStream : FilterInputStream, PollableInputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_multipart_input_stream_get_type != &gidSymbolNotFound ? soup_multipart_input_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin PollableInputStreamT!();

  /**
   * Creates a new #SoupMultipartInputStream that wraps the
   * [Gio.InputStream] obtained by sending the classMessage.
   * Reads should not be done directly through this object, use the input streams
   * returned by [Soup.MultipartInputStream.nextPart] or its async
   * counterpart instead.
   * Params:
   *   msg = the #SoupMessage the response is related to.
   *   baseStream = the #GInputStream returned by sending the request.
   * Returns: a new #SoupMultipartInputStream
   */
  this(Message msg, InputStream baseStream)
  {
    SoupMultipartInputStream* _cretval;
    _cretval = soup_multipart_input_stream_new(msg ? cast(SoupMessage*)msg.cPtr(No.Dup) : null, baseStream ? cast(GInputStream*)baseStream.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Obtains the headers for the part currently being processed.
   * Note that the structMessageHeaders that are returned are owned by the
   * #SoupMultipartInputStream and will be replaced when a call is made to
   * [Soup.MultipartInputStream.nextPart] or its async counterpart, so if
   * keeping the headers is required, a copy must be made.
   * Note that if a part had no headers at all an empty structMessageHeaders
   * will be returned.
   * Returns: a #SoupMessageHeaders
   *   containing the headers for the part currently being processed or
   *   %NULL if the headers failed to parse.
   */
  MessageHeaders getHeaders()
  {
    SoupMessageHeaders* _cretval;
    _cretval = soup_multipart_input_stream_get_headers(cast(SoupMultipartInputStream*)cPtr);
    auto _retval = _cretval ? new MessageHeaders(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Obtains an input stream for the next part.
   * When dealing with a multipart response the input stream needs to be wrapped
   * in a #SoupMultipartInputStream and this function or its async counterpart
   * need to be called to obtain the first part for reading.
   * After calling this function,
   * [Soup.MultipartInputStream.getHeaders] can be used to obtain the
   * headers for the first part. A read of 0 bytes indicates the end of
   * the part; a new call to this function should be done at that point,
   * to obtain the next part.
   * Params:
   *   cancellable = a #GCancellable
   * Returns: a new #GInputStream, or
   *   %NULL if there are no more parts
   */
  InputStream nextPart(Cancellable cancellable)
  {
    GInputStream* _cretval;
    GError *_err;
    _cretval = soup_multipart_input_stream_next_part(cast(SoupMultipartInputStream*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!InputStream(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Obtains a [Gio.InputStream] for the next request.
   * See [Soup.MultipartInputStream.nextPart] for details on the workflow.
   * Params:
   *   ioPriority = the I/O priority for the request.
   *   cancellable = a #GCancellable.
   *   callback = callback to call when request is satisfied.
   */
  void nextPartAsync(int ioPriority, Cancellable cancellable, AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    soup_multipart_input_stream_next_part_async(cast(SoupMultipartInputStream*)cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes an asynchronous request for the next part.
   * Params:
   *   result = a #GAsyncResult.
   * Returns: a newly created
   *   [Gio.InputStream] for reading the next part or %NULL if there are no
   *   more parts.
   */
  InputStream nextPartFinish(AsyncResult result)
  {
    GInputStream* _cretval;
    GError *_err;
    _cretval = soup_multipart_input_stream_next_part_finish(cast(SoupMultipartInputStream*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!InputStream(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }
}
