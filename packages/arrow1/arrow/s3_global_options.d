module arrow.s3_global_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.global;
import gobject.object;

class S3GlobalOptions : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
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
