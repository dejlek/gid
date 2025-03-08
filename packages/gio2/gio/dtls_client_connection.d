module gio.dtls_client_connection;

public import gio.dtls_client_connection_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.datagram_based;
import gio.socket_connectable;
import gio.types;
import glib.error;
import gobject.object;

/**
    [gio.dtls_client_connection.DtlsClientConnection] is the client-side subclass of
  [gio.dtls_connection.DtlsConnection], representing a client-side DTLS connection.
*/
interface DtlsClientConnection
{

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dtls_client_connection_get_type != &gidSymbolNotFound ? g_dtls_client_connection_get_type() : cast(GType)0;
  }

  /**
      Creates a new #GDtlsClientConnection wrapping base_socket which is
    assumed to communicate with the server identified by server_identity.
    Params:
      baseSocket =       the #GDatagramBased to wrap
      serverIdentity =       the expected identity of the server
    Returns:     the new
        #GDtlsClientConnection, or null on error
  */
  static gio.dtls_client_connection.DtlsClientConnection new_(gio.datagram_based.DatagramBased baseSocket, gio.socket_connectable.SocketConnectable serverIdentity = null)
  {
    GDatagramBased* _cretval;
    GError *_err;
    _cretval = g_dtls_client_connection_new(baseSocket ? cast(GDatagramBased*)(cast(ObjectG)baseSocket).cPtr(No.dup) : null, serverIdentity ? cast(GSocketConnectable*)(cast(ObjectG)serverIdentity).cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.dtls_client_connection.DtlsClientConnection)(cast(GDatagramBased*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Gets conn's expected server identity
    Returns:     a #GSocketConnectable describing the
      expected server identity, or null if the expected identity is not
      known.
  */
  gio.socket_connectable.SocketConnectable getServerIdentity();

  /**
      Gets conn's validation flags
    
    This function does not work as originally designed and is impossible
    to use correctly. See #GDtlsClientConnection:validation-flags for more
    information.
    Returns:     the validation flags
  
    Deprecated:     Do not attempt to ignore validation errors.
  */
  gio.types.TlsCertificateFlags getValidationFlags();

  /**
      Sets conn's expected server identity, which is used both to tell
    servers on virtual hosts which certificate to present, and also
    to let conn know what name to look for in the certificate when
    performing [gio.types.TlsCertificateFlags.badIdentity] validation, if enabled.
    Params:
      identity =       a #GSocketConnectable describing the expected server identity
  */
  void setServerIdentity(gio.socket_connectable.SocketConnectable identity);

  /**
      Sets conn's validation flags, to override the default set of
    checks performed when validating a server certificate. By default,
    [gio.types.TlsCertificateFlags.validateAll] is used.
    
    This function does not work as originally designed and is impossible
    to use correctly. See #GDtlsClientConnection:validation-flags for more
    information.
    Params:
      flags =       the #GTlsCertificateFlags to use
  
    Deprecated:     Do not attempt to ignore validation errors.
  */
  void setValidationFlags(gio.types.TlsCertificateFlags flags);
}
