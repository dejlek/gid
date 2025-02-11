module Arrow.SubTreeFileSystem;

import Arrow.FileSystem;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class SubTreeFileSystem : FileSystem
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_sub_tree_file_system_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(string basePath, FileSystem baseFileSystem)
  {
    GArrowSubTreeFileSystem* _cretval;
    const(char)* _basePath = basePath.toCString(No.Alloc);
    _cretval = garrow_sub_tree_file_system_new(_basePath, baseFileSystem ? cast(GArrowFileSystem*)baseFileSystem.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
