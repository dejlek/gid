/// Module for [SubTreeFileSystem] class
module arrow.sub_tree_file_system;

import arrow.c.functions;
import arrow.c.types;
import arrow.file_system;
import arrow.types;
import gid.gid;

/** */
class SubTreeFileSystem : arrow.file_system.FileSystem
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
    return cast(void function())garrow_sub_tree_file_system_get_type != &gidSymbolNotFound ? garrow_sub_tree_file_system_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SubTreeFileSystem self()
  {
    return this;
  }

  /** */
  this(string basePath, arrow.file_system.FileSystem baseFileSystem)
  {
    GArrowSubTreeFileSystem* _cretval;
    const(char)* _basePath = basePath.toCString(No.Alloc);
    _cretval = garrow_sub_tree_file_system_new(_basePath, baseFileSystem ? cast(GArrowFileSystem*)baseFileSystem._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
