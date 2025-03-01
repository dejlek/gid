module arrowdataset.finish_options;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.global;
import gobject.object;

class FinishOptions : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_finish_options_get_type != &gidSymbolNotFound ? gadataset_finish_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GADatasetFinishOptions* _cretval;
    _cretval = gadataset_finish_options_new();
    this(_cretval, Yes.Take);
  }
}
