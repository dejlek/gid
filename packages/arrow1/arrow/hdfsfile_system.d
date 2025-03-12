module arrow.hdfsfile_system;

import arrow.c.functions;
import arrow.c.types;
import arrow.file_system;
import arrow.types;
import gid.gid;

/** */
class HDFSFileSystem : arrow.file_system.FileSystem
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_hdfs_file_system_get_type != &gidSymbolNotFound ? garrow_hdfs_file_system_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override HDFSFileSystem self()
  {
    return this;
  }
}
