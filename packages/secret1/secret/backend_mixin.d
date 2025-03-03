module secret.backend_mixin;

public import secret.backend_iface_proxy;
public import gid.global;
public import gio.async_result;
public import gio.async_result_mixin;
public import gio.cancellable;
public import gio.types;
public import glib.error;
public import gobject.object;
public import secret.c.functions;
public import secret.c.types;
public import secret.types;

/**
 * #SecretBackend represents a backend implementation of password
 * storage.
 */
template BackendT()
{


}
