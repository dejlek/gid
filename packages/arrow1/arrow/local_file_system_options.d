module arrow.local_file_system_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

class LocalFileSystemOptions : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_local_file_system_options_get_type != &gidSymbolNotFound ? garrow_local_file_system_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowLocalFileSystemOptions* _cretval;
    _cretval = garrow_local_file_system_options_new();
    this(_cretval, Yes.Take);
  }
}
