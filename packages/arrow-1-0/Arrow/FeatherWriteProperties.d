module Arrow.FeatherWriteProperties;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class FeatherWriteProperties : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_feather_write_properties_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowFeatherWriteProperties* _cretval;
    _cretval = garrow_feather_write_properties_new();
    this(_cretval, Yes.Take);
  }
}
