module Gio.TcpWrapperConnection;

import GObject.ObjectG;
import Gid.gid;
import Gio.IOStream;
import Gio.Socket;
import Gio.TcpConnection;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * A `GTcpWrapperConnection` can be used to wrap a [Gio.IOStream] that is
 * based on a [Gio.Socket], but which is not actually a
 * [Gio.SocketConnection]. This is used by [Gio.SocketClient] so
 * that it can always return a [Gio.SocketConnection], even when the
 * connection it has actually created is not directly a
 * [Gio.SocketConnection].
 */
class TcpWrapperConnection : TcpConnection
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return g_tcp_wrapper_connection_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Wraps base_io_stream and socket together as a #GSocketConnection.
   * Params:
   *   baseIoStream = the #GIOStream to wrap
   *   socket = the #GSocket associated with base_io_stream
   * Returns: the new #GSocketConnection.
   */
  this(IOStream baseIoStream, Socket socket)
  {
    GSocketConnection* _cretval;
    _cretval = g_tcp_wrapper_connection_new(baseIoStream ? cast(GIOStream*)baseIoStream.cPtr(No.Dup) : null, socket ? cast(GSocket*)socket.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets conn's base #GIOStream
   * Returns: conn's base #GIOStream
   */
  IOStream getBaseIoStream()
  {
    GIOStream* _cretval;
    _cretval = g_tcp_wrapper_connection_get_base_io_stream(cast(GTcpWrapperConnection*)cPtr);
    auto _retval = ObjectG.getDObject!IOStream(cast(GIOStream*)_cretval, No.Take);
    return _retval;
  }
}
