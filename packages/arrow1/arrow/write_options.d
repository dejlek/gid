module arrow.write_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class WriteOptions : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_write_options_get_type != &gidSymbolNotFound ? garrow_write_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override WriteOptions self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowWriteOptions* _cretval;
    _cretval = garrow_write_options_new();
    this(_cretval, Yes.Take);
  }
}
