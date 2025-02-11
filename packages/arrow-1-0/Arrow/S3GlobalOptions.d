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
    return garrow_s3_global_options_get_type();
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
