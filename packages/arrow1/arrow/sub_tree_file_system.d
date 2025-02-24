module arrow.sub_tree_file_system;

import arrow.c.functions;
import arrow.c.types;
import arrow.file_system;
import arrow.types;
import gid.gid;

class SubTreeFileSystem : FileSystem
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_sub_tree_file_system_get_type != &gidSymbolNotFound ? garrow_sub_tree_file_system_get_type() : cast(GType)0;
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
