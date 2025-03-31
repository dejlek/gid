/// Module for [TlsServerConnection] interface mixin
module gio.tls_server_connection_mixin;

public import gio.tls_server_connection_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.iostream;
public import gio.tls_certificate;
public import gio.types;
public import glib.error;
public import gobject.object;

/**
    [gio.tls_server_connection.TlsServerConnection] is the server-side subclass of
    [gio.tls_connection.TlsConnection], representing a server-side TLS connection.
*/
template TlsServerConnectionT()
{

}
