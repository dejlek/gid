module arrow.file_info;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.global;
import gobject.object;

class FileInfo : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_file_info_get_type != &gidSymbolNotFound ? garrow_file_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowFileInfo* _cretval;
    _cretval = garrow_file_info_new();
    this(_cretval, Yes.Take);
  }

  bool equal(FileInfo otherFileInfo)
  {
    bool _retval;
    _retval = garrow_file_info_equal(cast(GArrowFileInfo*)cPtr, otherFileInfo ? cast(GArrowFileInfo*)otherFileInfo.cPtr(No.Dup) : null);
    return _retval;
  }

  bool isDir()
  {
    bool _retval;
    _retval = garrow_file_info_is_dir(cast(GArrowFileInfo*)cPtr);
    return _retval;
  }

  bool isFile()
  {
    bool _retval;
    _retval = garrow_file_info_is_file(cast(GArrowFileInfo*)cPtr);
    return _retval;
  }

  string toString_()
  {
    char* _cretval;
    _cretval = garrow_file_info_to_string(cast(GArrowFileInfo*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }
}
