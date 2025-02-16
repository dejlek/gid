module Arrow.S3FileSystem;

import Arrow.FileSystem;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class S3FileSystem : FileSystem
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_s3_file_system_get_type != &gidSymbolNotFound ? garrow_s3_file_system_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
