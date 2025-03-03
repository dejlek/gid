module gio.unix_connection;

import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.credentials;
import gio.socket_connection;
import gio.types;
import glib.error;
import gobject.object;

/**
 * This is the subclass of [gio.socket_connection.SocketConnection] that is created
 * for UNIX domain sockets.
 * It contains functions to do some of the UNIX socket specific
 * functionality like passing file descriptors.
 * Since GLib 2.72, `GUnixConnection` is available on all platforms. It requires
 * underlying system support $(LPAREN)such as Windows 10 with `AF_UNIX`$(RPAREN) at run time.
 * Before GLib 2.72, `<gio/gunixconnection.h>` belonged to the UNIX-specific GIO
 * interfaces, thus you had to use the `gio-unix-2.0.pc` pkg-config file when
 * using it. This is no longer necessary since GLib 2.72.
 */
class UnixConnection : gio.socket_connection.SocketConnection
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_unix_connection_get_type != &gidSymbolNotFound ? g_unix_connection_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Receives credentials from the sending end of the connection.  The
   * sending end has to call [gio.unix_connection.UnixConnection.sendCredentials] $(LPAREN)or
   * similar$(RPAREN) for this to work.
   * As well as reading the credentials this also reads $(LPAREN)and discards$(RPAREN) a
   * single byte from the stream, as this is required for credentials
   * passing to work on some implementations.
   * This method can be expected to be available on the following platforms:
   * - Linux since GLib 2.26
   * - FreeBSD since GLib 2.26
   * - GNU/kFreeBSD since GLib 2.36
   * - Solaris, Illumos and OpenSolaris since GLib 2.40
   * - GNU/Hurd since GLib 2.40
   * Other ways to exchange credentials with a foreign peer includes the
   * #GUnixCredentialsMessage type and [gio.socket.Socket.getCredentials] function.
   * Params:
   *   cancellable = A #GCancellable or %NULL.
   * Returns: Received credentials on success $(LPAREN)free with
   *   [gobject.object.ObjectG.unref]$(RPAREN), %NULL if error is set.
   */
  gio.credentials.Credentials receiveCredentials(gio.cancellable.Cancellable cancellable)
  {
    GCredentials* _cretval;
    GError *_err;
    _cretval = g_unix_connection_receive_credentials(cast(GUnixConnection*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.credentials.Credentials)(cast(GCredentials*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Asynchronously receive credentials.
   * For more details, see [gio.unix_connection.UnixConnection.receiveCredentials] which is
   * the synchronous version of this call.
   * When the operation is finished, callback will be called. You can then call
   * [gio.unix_connection.UnixConnection.receiveCredentialsFinish] to get the result of the operation.
   * Params:
   *   cancellable = optional #GCancellable object, %NULL to ignore.
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void receiveCredentialsAsync(gio.cancellable.Cancellable cancellable, gio.types.AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_unix_connection_receive_credentials_async(cast(GUnixConnection*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes an asynchronous receive credentials operation started with
   * [gio.unix_connection.UnixConnection.receiveCredentialsAsync].
   * Params:
   *   result = a #GAsyncResult.
   * Returns: a #GCredentials, or %NULL on error.
   *   Free the returned object with [gobject.object.ObjectG.unref].
   */
  gio.credentials.Credentials receiveCredentialsFinish(gio.async_result.AsyncResult result)
  {
    GCredentials* _cretval;
    GError *_err;
    _cretval = g_unix_connection_receive_credentials_finish(cast(GUnixConnection*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.credentials.Credentials)(cast(GCredentials*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Receives a file descriptor from the sending end of the connection.
   * The sending end has to call [gio.unix_connection.UnixConnection.sendFd] for this
   * to work.
   * As well as reading the fd this also reads a single byte from the
   * stream, as this is required for fd passing to work on some
   * implementations.
   * Params:
   *   cancellable = optional #GCancellable object, %NULL to ignore
   * Returns: a file descriptor on success, -1 on error.
   */
  int receiveFd(gio.cancellable.Cancellable cancellable)
  {
    int _retval;
    GError *_err;
    _retval = g_unix_connection_receive_fd(cast(GUnixConnection*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Passes the credentials of the current user the receiving side
   * of the connection. The receiving end has to call
   * [gio.unix_connection.UnixConnection.receiveCredentials] (or similar) to accept the
   * credentials.
   * As well as sending the credentials this also writes a single NUL
   * byte to the stream, as this is required for credentials passing to
   * work on some implementations.
   * This method can be expected to be available on the following platforms:
   * - Linux since GLib 2.26
   * - FreeBSD since GLib 2.26
   * - GNU/kFreeBSD since GLib 2.36
   * - Solaris, Illumos and OpenSolaris since GLib 2.40
   * - GNU/Hurd since GLib 2.40
   * Other ways to exchange credentials with a foreign peer includes the
   * #GUnixCredentialsMessage type and [gio.socket.Socket.getCredentials] function.
   * Params:
   *   cancellable = A #GCancellable or %NULL.
   * Returns: %TRUE on success, %FALSE if error is set.
   */
  bool sendCredentials(gio.cancellable.Cancellable cancellable)
  {
    bool _retval;
    GError *_err;
    _retval = g_unix_connection_send_credentials(cast(GUnixConnection*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Asynchronously send credentials.
   * For more details, see [gio.unix_connection.UnixConnection.sendCredentials] which is
   * the synchronous version of this call.
   * When the operation is finished, callback will be called. You can then call
   * [gio.unix_connection.UnixConnection.sendCredentialsFinish] to get the result of the operation.
   * Params:
   *   cancellable = optional #GCancellable object, %NULL to ignore.
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void sendCredentialsAsync(gio.cancellable.Cancellable cancellable, gio.types.AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_unix_connection_send_credentials_async(cast(GUnixConnection*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes an asynchronous send credentials operation started with
   * [gio.unix_connection.UnixConnection.sendCredentialsAsync].
   * Params:
   *   result = a #GAsyncResult.
   * Returns: %TRUE if the operation was successful, otherwise %FALSE.
   */
  bool sendCredentialsFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = g_unix_connection_send_credentials_finish(cast(GUnixConnection*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Passes a file descriptor to the receiving side of the
   * connection. The receiving end has to call [gio.unix_connection.UnixConnection.receiveFd]
   * to accept the file descriptor.
   * As well as sending the fd this also writes a single byte to the
   * stream, as this is required for fd passing to work on some
   * implementations.
   * Params:
   *   fd = a file descriptor
   *   cancellable = optional #GCancellable object, %NULL to ignore.
   * Returns: a %TRUE on success, %NULL on error.
   */
  bool sendFd(int fd, gio.cancellable.Cancellable cancellable)
  {
    bool _retval;
    GError *_err;
    _retval = g_unix_connection_send_fd(cast(GUnixConnection*)cPtr, fd, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
