module arrowdataset.finish_options;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.gid;
import gobject.object;

/** */
class FinishOptions : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_finish_options_get_type != &gidSymbolNotFound ? gadataset_finish_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this()
  {
    GADatasetFinishOptions* _cretval;
    _cretval = gadataset_finish_options_new();
    this(_cretval, Yes.Take);
  }
}
