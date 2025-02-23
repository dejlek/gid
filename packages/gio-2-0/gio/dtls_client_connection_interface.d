module gio.dtls_client_connection_interface;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.type_interface;

/**
 * vtable for a #GDtlsClientConnection implementation.
 */
class DtlsClientConnectionInterface
{
  GDtlsClientConnectionInterface cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.DtlsClientConnectionInterface");

    cInstance = *cast(GDtlsClientConnectionInterface*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TypeInterface gIface()
  {
    return new TypeInterface(cast(GTypeInterface*)&(cast(GDtlsClientConnectionInterface*)cPtr).gIface);
  }
}
