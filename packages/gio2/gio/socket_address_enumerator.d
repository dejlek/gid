module gio.socket_address_enumerator;

import gid.gid;
import gio.async_result;
import gio.async_result_mixin;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.socket_address;
import gio.types;
import glib.error;
import gobject.object;

/**
 * `GSocketAddressEnumerator` is an enumerator type for
 * [Gio.SocketAddress] instances. It is returned by enumeration functions
 * such as [Gio.SocketConnectable.enumerate], which returns a
 * `GSocketAddressEnumerator` to list each [Gio.SocketAddress] which could
 * be used to connect to that [Gio.SocketConnectable].
 * Enumeration is typically a blocking operation, so the asynchronous methods
 * [Gio.SocketAddressEnumerator.nextAsync] and
 * [Gio.SocketAddressEnumerator.nextFinish] should be used where
 * possible.
 * Each `GSocketAddressEnumerator` can only be enumerated once. Once
 * [Gio.SocketAddressEnumerator.next] has returned `NULL`, further
 * enumeration with that `GSocketAddressEnumerator` is not possible, and it can
 * be unreffed.
 */
class SocketAddressEnumerator : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_socket_address_enumerator_get_type != &gidSymbolNotFound ? g_socket_address_enumerator_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Retrieves the next #GSocketAddress from enumerator. Note that this
   * may block for some amount of time. $(LPAREN)Eg, a #GNetworkAddress may need
   * to do a DNS lookup before it can return an address.$(RPAREN) Use
   * [Gio.SocketAddressEnumerator.nextAsync] if you need to avoid
   * blocking.
   * If enumerator is expected to yield addresses, but for some reason
   * is unable to $(LPAREN)eg, because of a DNS error$(RPAREN), then the first call to
   * [Gio.SocketAddressEnumerator.next] will return an appropriate error
   * in *error. However, if the first call to
   * [Gio.SocketAddressEnumerator.next] succeeds, then any further
   * internal errors $(LPAREN)other than cancellable being triggered$(RPAREN) will be
   * ignored.
   * Params:
   *   cancellable = optional #GCancellable object, %NULL to ignore.
   * Returns: a #GSocketAddress $(LPAREN)owned by the caller$(RPAREN), or %NULL on
   *   error $(LPAREN)in which case *error will be set$(RPAREN) or if there are no
   *   more addresses.
   */
  SocketAddress next(Cancellable cancellable)
  {
    GSocketAddress* _cretval;
    GError *_err;
    _cretval = g_socket_address_enumerator_next(cast(GSocketAddressEnumerator*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!SocketAddress(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Asynchronously retrieves the next #GSocketAddress from enumerator
   * and then calls callback, which must call
   * [Gio.SocketAddressEnumerator.nextFinish] to get the result.
   * It is an error to call this multiple times before the previous callback has finished.
   * Params:
   *   cancellable = optional #GCancellable object, %NULL to ignore.
   *   callback = a #GAsyncReadyCallback to call
   *     when the request is satisfied
   */
  void nextAsync(Cancellable cancellable, AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_socket_address_enumerator_next_async(cast(GSocketAddressEnumerator*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Retrieves the result of a completed call to
   * [Gio.SocketAddressEnumerator.nextAsync]. See
   * [Gio.SocketAddressEnumerator.next] for more information about
   * error handling.
   * Params:
   *   result = a #GAsyncResult
   * Returns: a #GSocketAddress $(LPAREN)owned by the caller$(RPAREN), or %NULL on
   *   error $(LPAREN)in which case *error will be set$(RPAREN) or if there are no
   *   more addresses.
   */
  SocketAddress nextFinish(AsyncResult result)
  {
    GSocketAddress* _cretval;
    GError *_err;
    _cretval = g_socket_address_enumerator_next_finish(cast(GSocketAddressEnumerator*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!SocketAddress(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }
}
