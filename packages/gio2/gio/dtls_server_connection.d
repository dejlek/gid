module gio.dtls_server_connection;

public import gio.dtls_server_connection_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.datagram_based;
import gio.tls_certificate;
import gio.types;
import glib.error;
import gobject.object;

/**
 * `GDtlsServerConnection` is the server-side subclass of
 * [gio.dtls_connection.DtlsConnection], representing a server-side DTLS connection.
 */
interface DtlsServerConnection
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dtls_server_connection_get_type != &gidSymbolNotFound ? g_dtls_server_connection_get_type() : cast(GType)0;
  }

  /**
   * Creates a new #GDtlsServerConnection wrapping base_socket.
   * Params:
   *   baseSocket = the #GDatagramBased to wrap
   *   certificate = the default server certificate, or %NULL
   * Returns: the new
   *   #GDtlsServerConnection, or %NULL on error
   */
  static gio.dtls_server_connection.DtlsServerConnection new_(gio.datagram_based.DatagramBased baseSocket, gio.tls_certificate.TlsCertificate certificate = null)
  {
    GDatagramBased* _cretval;
    GError *_err;
    _cretval = g_dtls_server_connection_new(baseSocket ? cast(GDatagramBased*)(cast(ObjectG)baseSocket).cPtr(No.Dup) : null, certificate ? cast(GTlsCertificate*)certificate.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.dtls_server_connection.DtlsServerConnection)(cast(GDatagramBased*)_cretval, Yes.Take);
    return _retval;
  }
}
