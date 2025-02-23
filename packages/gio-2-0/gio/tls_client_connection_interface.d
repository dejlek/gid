module gio.tls_client_connection_interface;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.type_interface;

/**
 * vtable for a #GTlsClientConnection implementation.
 */
class TlsClientConnectionInterface
{
  GTlsClientConnectionInterface cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.TlsClientConnectionInterface");

    cInstance = *cast(GTlsClientConnectionInterface*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TypeInterface gIface()
  {
    return new TypeInterface(cast(GTypeInterface*)&(cast(GTlsClientConnectionInterface*)cPtr).gIface);
  }

  alias CopySessionStateFuncType = extern(C) void function(GTlsClientConnection* conn, GTlsClientConnection* source);

  @property CopySessionStateFuncType copySessionState()
  {
    return (cast(GTlsClientConnectionInterface*)cPtr).copySessionState;
  }
}
