module arrow.sub_tree_file_system;

import arrow.c.functions;
import arrow.c.types;
import arrow.file_system;
import arrow.types;
import gid.gid;

/** */
class SubTreeFileSystem : arrow.file_system.FileSystem
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_sub_tree_file_system_get_type != &gidSymbolNotFound ? garrow_sub_tree_file_system_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(string basePath, arrow.file_system.FileSystem baseFileSystem)
  {
    GArrowSubTreeFileSystem* _cretval;
    const(char)* _basePath = basePath.toCString(No.alloc);
    _cretval = garrow_sub_tree_file_system_new(_basePath, baseFileSystem ? cast(GArrowFileSystem*)baseFileSystem.cPtr(No.dup) : null);
    this(_cretval, Yes.take);
  }
}
