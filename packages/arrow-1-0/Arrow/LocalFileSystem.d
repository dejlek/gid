module Arrow.LocalFileSystem;

import Arrow.FileSystem;
import Arrow.LocalFileSystemOptions;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class LocalFileSystem : FileSystem
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_local_file_system_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(LocalFileSystemOptions options)
  {
    GArrowLocalFileSystem* _cretval;
    _cretval = garrow_local_file_system_new(options ? cast(GArrowLocalFileSystemOptions*)options.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
