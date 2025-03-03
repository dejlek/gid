module arrow.gcsfile_system;

import arrow.c.functions;
import arrow.c.types;
import arrow.file_system;
import arrow.types;
import gid.gid;

class GCSFileSystem : arrow.file_system.FileSystem
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_gcs_file_system_get_type != &gidSymbolNotFound ? garrow_gcs_file_system_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
