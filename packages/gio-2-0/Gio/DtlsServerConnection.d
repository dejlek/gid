module Gio.DtlsServerConnection;

public import Gio.DtlsServerConnectionIfaceProxy;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;
import Gio.DatagramBased;
import Gio.DatagramBasedT;
import Gio.TlsCertificate;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * `GDtlsServerConnection` is the server-side subclass of
 * [Gio.DtlsConnection], representing a server-side DTLS connection.
 */
interface DtlsServerConnection
{

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
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
  static DtlsServerConnection new_(DatagramBased baseSocket, TlsCertificate certificate)
  {
    GDatagramBased* _cretval;
    GError *_err;
    _cretval = g_dtls_server_connection_new(baseSocket ? cast(GDatagramBased*)(cast(ObjectG)baseSocket).cPtr(No.Dup) : null, certificate ? cast(GTlsCertificate*)certificate.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!DtlsServerConnection(cast(GDatagramBased*)_cretval, Yes.Take);
    return _retval;
  }
}
