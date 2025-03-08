module arrowdataset.dataset_factory;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.dataset;
import arrowdataset.finish_options;
import arrowdataset.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class DatasetFactory : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_dataset_factory_get_type != &gidSymbolNotFound ? gadataset_dataset_factory_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  arrowdataset.dataset.Dataset finish(arrowdataset.finish_options.FinishOptions options = null)
  {
    GADatasetDataset* _cretval;
    GError *_err;
    _cretval = gadataset_dataset_factory_finish(cast(GADatasetDatasetFactory*)cPtr, options ? cast(GADatasetFinishOptions*)options.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrowdataset.dataset.Dataset)(cast(GADatasetDataset*)_cretval, Yes.take);
    return _retval;
  }
}
