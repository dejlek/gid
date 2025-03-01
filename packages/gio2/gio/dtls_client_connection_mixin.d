module gio.dtls_client_connection_mixin;

public import gio.dtls_client_connection_iface_proxy;
public import gid.global;
public import gio.c.functions;
public import gio.c.types;
public import gio.datagram_based;
public import gio.datagram_based_mixin;
public import gio.socket_connectable;
public import gio.socket_connectable_mixin;
public import gio.types;
public import glib.error;
public import gobject.object;

/**
 * `GDtlsClientConnection` is the client-side subclass of
 * [gio.dtls_connection.DtlsConnection], representing a client-side DTLS connection.
 */
template DtlsClientConnectionT()
{


  /**
   * Gets conn's expected server identity
   * Returns: a #GSocketConnectable describing the
   *   expected server identity, or %NULL if the expected identity is not
   *   known.
   */
  override SocketConnectable getServerIdentity()
  {
    GSocketConnectable* _cretval;
    _cretval = g_dtls_client_connection_get_server_identity(cast(GDtlsClientConnection*)cPtr);
    auto _retval = ObjectG.getDObject!SocketConnectable(cast(GSocketConnectable*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets conn's validation flags
   * This function does not work as originally designed and is impossible
   * to use correctly. See #GDtlsClientConnection:validation-flags for more
   * information.
   * Returns: the validation flags

   * Deprecated: Do not attempt to ignore validation errors.
   */
  override TlsCertificateFlags getValidationFlags()
  {
    GTlsCertificateFlags _cretval;
    _cretval = g_dtls_client_connection_get_validation_flags(cast(GDtlsClientConnection*)cPtr);
    TlsCertificateFlags _retval = cast(TlsCertificateFlags)_cretval;
    return _retval;
  }

  /**
   * Sets conn's expected server identity, which is used both to tell
   * servers on virtual hosts which certificate to present, and also
   * to let conn know what name to look for in the certificate when
   * performing %G_TLS_CERTIFICATE_BAD_IDENTITY validation, if enabled.
   * Params:
   *   identity = a #GSocketConnectable describing the expected server identity
   */
  override void setServerIdentity(SocketConnectable identity)
  {
    g_dtls_client_connection_set_server_identity(cast(GDtlsClientConnection*)cPtr, identity ? cast(GSocketConnectable*)(cast(ObjectG)identity).cPtr(No.Dup) : null);
  }

  /**
   * Sets conn's validation flags, to override the default set of
   * checks performed when validating a server certificate. By default,
   * %G_TLS_CERTIFICATE_VALIDATE_ALL is used.
   * This function does not work as originally designed and is impossible
   * to use correctly. See #GDtlsClientConnection:validation-flags for more
   * information.
   * Params:
   *   flags = the #GTlsCertificateFlags to use

   * Deprecated: Do not attempt to ignore validation errors.
   */
  override void setValidationFlags(TlsCertificateFlags flags)
  {
    g_dtls_client_connection_set_validation_flags(cast(GDtlsClientConnection*)cPtr, flags);
  }
}
