module gio.dtls_client_connection_mixin;

public import gio.dtls_client_connection_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.datagram_based;
public import gio.socket_connectable;
public import gio.types;
public import glib.error;
public import gobject.object;

/**
    [gio.dtls_client_connection.DtlsClientConnection] is the client-side subclass of
  [gio.dtls_connection.DtlsConnection], representing a client-side DTLS connection.
*/
template DtlsClientConnectionT()
{


  /**
      Gets conn's expected server identity
    Returns:     a #GSocketConnectable describing the
      expected server identity, or null if the expected identity is not
      known.
  */
  override gio.socket_connectable.SocketConnectable getServerIdentity()
  {
    GSocketConnectable* _cretval;
    _cretval = g_dtls_client_connection_get_server_identity(cast(GDtlsClientConnection*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.socket_connectable.SocketConnectable)(cast(GSocketConnectable*)_cretval, No.take);
    return _retval;
  }

  /**
      Gets conn's validation flags
    
    This function does not work as originally designed and is impossible
    to use correctly. See #GDtlsClientConnection:validation-flags for more
    information.
    Returns:     the validation flags
  
    Deprecated:     Do not attempt to ignore validation errors.
  */
  override gio.types.TlsCertificateFlags getValidationFlags()
  {
    GTlsCertificateFlags _cretval;
    _cretval = g_dtls_client_connection_get_validation_flags(cast(GDtlsClientConnection*)cPtr);
    gio.types.TlsCertificateFlags _retval = cast(gio.types.TlsCertificateFlags)_cretval;
    return _retval;
  }

  /**
      Sets conn's expected server identity, which is used both to tell
    servers on virtual hosts which certificate to present, and also
    to let conn know what name to look for in the certificate when
    performing [gio.types.TlsCertificateFlags.badIdentity] validation, if enabled.
    Params:
      identity =       a #GSocketConnectable describing the expected server identity
  */
  override void setServerIdentity(gio.socket_connectable.SocketConnectable identity)
  {
    g_dtls_client_connection_set_server_identity(cast(GDtlsClientConnection*)cPtr, identity ? cast(GSocketConnectable*)(cast(ObjectG)identity).cPtr(No.dup) : null);
  }

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
  override void setValidationFlags(gio.types.TlsCertificateFlags flags)
  {
    g_dtls_client_connection_set_validation_flags(cast(GDtlsClientConnection*)cPtr, flags);
  }
}
