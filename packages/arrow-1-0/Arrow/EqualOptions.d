module Arrow.EqualOptions;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class EqualOptions : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_equal_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowEqualOptions* _cretval;
    _cretval = garrow_equal_options_new();
    this(_cretval, Yes.Take);
  }

  bool isApprox()
  {
    bool _retval;
    _retval = garrow_equal_options_is_approx(cast(GArrowEqualOptions*)cPtr);
    return _retval;
  }
}
