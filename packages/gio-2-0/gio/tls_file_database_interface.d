module gio.tls_file_database_interface;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.type_interface;

/**
 * Provides an interface for #GTlsFileDatabase implementations.
 */
class TlsFileDatabaseInterface
{
  GTlsFileDatabaseInterface cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.TlsFileDatabaseInterface");

    cInstance = *cast(GTlsFileDatabaseInterface*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TypeInterface gIface()
  {
    return new TypeInterface(cast(GTypeInterface*)&(cast(GTlsFileDatabaseInterface*)cPtr).gIface);
  }
}
