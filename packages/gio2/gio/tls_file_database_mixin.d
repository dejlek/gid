/// Module for [TlsFileDatabase] interface mixin
module gio.tls_file_database_mixin;

public import gio.tls_file_database_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.types;
public import glib.error;
public import gobject.object;

/**
    [gio.tls_file_database.TlsFileDatabase] is implemented by [gio.tls_database.TlsDatabase] objects which
    load their certificate information from a file. It is an interface which
    TLS library specific subtypes implement.
*/
template TlsFileDatabaseT()
{

}
