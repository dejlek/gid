module gio.tls_server_connection;

public import gio.tls_server_connection_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.iostream;
import gio.tls_certificate;
import gio.types;
import glib.error;
import gobject.object;

/**
 * `GTlsServerConnection` is the server-side subclass of
 * [gio.tls_connection.TlsConnection], representing a server-side TLS connection.
 */
interface TlsServerConnection
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_tls_server_connection_get_type != &gidSymbolNotFound ? g_tls_server_connection_get_type() : cast(GType)0;
  }

  /**
   * Creates a new #GTlsServerConnection wrapping base_io_stream $(LPAREN)which
   * must have pollable input and output streams$(RPAREN).
   * See the documentation for #GTlsConnection:base-io-stream for restrictions
   * on when application code can run operations on the base_io_stream after
   * this function has returned.
   * Params:
   *   baseIoStream = the #GIOStream to wrap
   *   certificate = the default server certificate, or %NULL
   * Returns: the new
   *   #GTlsServerConnection, or %NULL on error
   */
  static gio.tls_server_connection.TlsServerConnection new_(gio.iostream.IOStream baseIoStream, gio.tls_certificate.TlsCertificate certificate)
  {
    GIOStream* _cretval;
    GError *_err;
    _cretval = g_tls_server_connection_new(baseIoStream ? cast(GIOStream*)baseIoStream.cPtr(No.Dup) : null, certificate ? cast(GTlsCertificate*)certificate.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.tls_server_connection.TlsServerConnection)(cast(GIOStream*)_cretval, Yes.Take);
    return _retval;
  }
}
