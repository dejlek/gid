module gio.tls_backend;

public import gio.tls_backend_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.tls_database;
import gio.types;
import gobject.object;
import gobject.types;

/**
 * TLS $(LPAREN)Transport Layer Security, aka SSL$(RPAREN) and DTLS backend. This is an
 * internal type used to coordinate the different classes implemented
 * by a TLS backend.
 */
interface TlsBackend
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_tls_backend_get_type != &gidSymbolNotFound ? g_tls_backend_get_type() : cast(GType)0;
  }

  /**
   * Gets the default #GTlsBackend for the system.
   * Returns: a #GTlsBackend, which will be a
   *   dummy object if no TLS backend is available
   */
  static TlsBackend getDefault()
  {
    GTlsBackend* _cretval;
    _cretval = g_tls_backend_get_default();
    auto _retval = ObjectG.getDObject!TlsBackend(cast(GTlsBackend*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the #GType of backend's #GTlsCertificate implementation.
   * Returns: the #GType of backend's #GTlsCertificate
   *   implementation.
   */
  GType getCertificateType();

  /**
   * Gets the #GType of backend's #GTlsClientConnection implementation.
   * Returns: the #GType of backend's #GTlsClientConnection
   *   implementation.
   */
  GType getClientConnectionType();

  /**
   * Gets the default #GTlsDatabase used to verify TLS connections.
   * Returns: the default database, which should be
   *   unreffed when done.
   */
  TlsDatabase getDefaultDatabase();

  /**
   * Gets the #GType of backend’s #GDtlsClientConnection implementation.
   * Returns: the #GType of backend’s #GDtlsClientConnection
   *   implementation, or %G_TYPE_INVALID if this backend doesn’t support DTLS.
   */
  GType getDtlsClientConnectionType();

  /**
   * Gets the #GType of backend’s #GDtlsServerConnection implementation.
   * Returns: the #GType of backend’s #GDtlsServerConnection
   *   implementation, or %G_TYPE_INVALID if this backend doesn’t support DTLS.
   */
  GType getDtlsServerConnectionType();

  /**
   * Gets the #GType of backend's #GTlsFileDatabase implementation.
   * Returns: the #GType of backend's #GTlsFileDatabase implementation.
   */
  GType getFileDatabaseType();

  /**
   * Gets the #GType of backend's #GTlsServerConnection implementation.
   * Returns: the #GType of backend's #GTlsServerConnection
   *   implementation.
   */
  GType getServerConnectionType();

  /**
   * Set the default #GTlsDatabase used to verify TLS connections
   * Any subsequent call to [Gio.TlsBackend.getDefaultDatabase] will return
   * the database set in this call.  Existing databases and connections are not
   * modified.
   * Setting a %NULL default database will reset to using the system default
   * database as if [Gio.TlsBackend.setDefaultDatabase] had never been called.
   * Params:
   *   database = the #GTlsDatabase
   */
  void setDefaultDatabase(TlsDatabase database);

  /**
   * Checks if DTLS is supported. DTLS support may not be available even if TLS
   * support is available, and vice-versa.
   * Returns: whether DTLS is supported
   */
  bool supportsDtls();

  /**
   * Checks if TLS is supported; if this returns %FALSE for the default
   * #GTlsBackend, it means no "real" TLS backend is available.
   * Returns: whether or not TLS is supported
   */
  bool supportsTls();
}
