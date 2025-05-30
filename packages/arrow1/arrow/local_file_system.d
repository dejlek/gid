/// Module for [LocalFileSystem] class
module arrow.local_file_system;

import arrow.c.functions;
import arrow.c.types;
import arrow.file_system;
import arrow.local_file_system_options;
import arrow.types;
import gid.gid;

/** */
class LocalFileSystem : arrow.file_system.FileSystem
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
    return cast(void function())garrow_local_file_system_get_type != &gidSymbolNotFound ? garrow_local_file_system_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LocalFileSystem self()
  {
    return this;
  }

  /** */
  this(arrow.local_file_system_options.LocalFileSystemOptions options = null)
  {
    GArrowLocalFileSystem* _cretval;
    _cretval = garrow_local_file_system_new(options ? cast(GArrowLocalFileSystemOptions*)options._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
