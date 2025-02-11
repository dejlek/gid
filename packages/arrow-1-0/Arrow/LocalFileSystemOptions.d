module Arrow.LocalFileSystemOptions;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class LocalFileSystemOptions : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_local_file_system_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowLocalFileSystemOptions* _cretval;
    _cretval = garrow_local_file_system_options_new();
    this(_cretval, Yes.Take);
  }
}
