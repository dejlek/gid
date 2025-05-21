/// Module for [HDFSFileSystem] class
module arrow.hdfsfile_system;

import arrow.c.functions;
import arrow.c.types;
import arrow.file_system;
import arrow.types;
import gid.gid;

/** */
class HDFSFileSystem : arrow.file_system.FileSystem
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_hdfs_file_system_get_type != &gidSymbolNotFound ? garrow_hdfs_file_system_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HDFSFileSystem self()
  {
    return this;
  }
}
