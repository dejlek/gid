module Arrow.S3GlobalOptions;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class S3GlobalOptions : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_s3_global_options_get_type != &gidSymbolNotFound ? garrow_s3_global_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowS3GlobalOptions* _cretval;
    _cretval = garrow_s3_global_options_new();
    this(_cretval, Yes.Take);
  }
}
