module gio.native_socket_address;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.socket_address;
import gio.socket_connectable;
import gio.socket_connectable_mixin;
import gio.types;

/**
 * A socket address of some unknown native type.
 * This corresponds to a general `struct sockaddr` of a type not otherwise
 * handled by GLib.
 */
class NativeSocketAddress : SocketAddress
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_native_socket_address_get_type != &gidSymbolNotFound ? g_native_socket_address_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new #GNativeSocketAddress for native and len.
   * Params:
   *   native = a native address object
   *   len = the length of native, in bytes
   * Returns: a new #GNativeSocketAddress
   */
  this(void* native, size_t len)
  {
    GSocketAddress* _cretval;
    _cretval = g_native_socket_address_new(native, len);
    this(_cretval, Yes.Take);
  }
}
