module arrow.equal_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class EqualOptions : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_equal_options_get_type != &gidSymbolNotFound ? garrow_equal_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override EqualOptions self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowEqualOptions* _cretval;
    _cretval = garrow_equal_options_new();
    this(_cretval, Yes.Take);
  }

  /** */
  bool isApprox()
  {
    bool _retval;
    _retval = garrow_equal_options_is_approx(cast(GArrowEqualOptions*)cPtr);
    return _retval;
  }
}
