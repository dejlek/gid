module gio.socket_address;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.socket_connectable;
import gio.socket_connectable_mixin;
import gio.types;
import glib.error;
import gobject.object;

/**
 * `GSocketAddress` is the equivalent of
 * [`struct sockaddr`]$(LPAREN)$(RPAREN)(man:sockaddr3type) and its subtypes in the BSD sockets
 * API. This is an abstract class; use [gio.inet_socket_address.InetSocketAddress] for
 * internet sockets, or [gio.unix_socket_address.UnixSocketAddress] for UNIX domain sockets.
 */
class SocketAddress : gobject.object.ObjectG, gio.socket_connectable.SocketConnectable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_socket_address_get_type != &gidSymbolNotFound ? g_socket_address_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin SocketConnectableT!();

  /**
   * Creates a #GSocketAddress subclass corresponding to the native
   * struct sockaddr native.
   * Params:
   *   native = a pointer to a struct sockaddr
   *   len = the size of the memory location pointed to by native
   * Returns: a new #GSocketAddress if native could successfully
   *   be converted, otherwise %NULL
   */
  static gio.socket_address.SocketAddress newFromNative(void* native, size_t len)
  {
    GSocketAddress* _cretval;
    _cretval = g_socket_address_new_from_native(native, len);
    auto _retval = ObjectG.getDObject!(gio.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Gets the socket family type of address.
   * Returns: the socket family type of address
   */
  gio.types.SocketFamily getFamily()
  {
    GSocketFamily _cretval;
    _cretval = g_socket_address_get_family(cast(GSocketAddress*)cPtr);
    gio.types.SocketFamily _retval = cast(gio.types.SocketFamily)_cretval;
    return _retval;
  }

  /**
   * Gets the size of address's native struct sockaddr.
   * You can use this to allocate memory to pass to
   * [gio.socket_address.SocketAddress.toNative].
   * Returns: the size of the native struct sockaddr that
   *   address represents
   */
  ptrdiff_t getNativeSize()
  {
    ptrdiff_t _retval;
    _retval = g_socket_address_get_native_size(cast(GSocketAddress*)cPtr);
    return _retval;
  }

  /**
   * Converts a #GSocketAddress to a native struct sockaddr, which can
   * be passed to low-level functions like connect$(LPAREN)$(RPAREN) or bind$(LPAREN)$(RPAREN).
   * If not enough space is available, a %G_IO_ERROR_NO_SPACE error
   * is returned. If the address type is not known on the system
   * then a %G_IO_ERROR_NOT_SUPPORTED error is returned.
   * Params:
   *   dest = a pointer to a memory location that will contain the native
   *     struct sockaddr
   *   destlen = the size of dest. Must be at least as large as
   *     [gio.socket_address.SocketAddress.getNativeSize]
   * Returns: %TRUE if dest was filled in, %FALSE on error
   */
  bool toNative(void* dest, size_t destlen)
  {
    bool _retval;
    GError *_err;
    _retval = g_socket_address_to_native(cast(GSocketAddress*)cPtr, dest, destlen, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
