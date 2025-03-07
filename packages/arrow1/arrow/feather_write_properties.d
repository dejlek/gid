module arrow.feather_write_properties;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class FeatherWriteProperties : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_feather_write_properties_get_type != &gidSymbolNotFound ? garrow_feather_write_properties_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this()
  {
    GArrowFeatherWriteProperties* _cretval;
    _cretval = garrow_feather_write_properties_new();
    this(_cretval, Yes.Take);
  }
}
