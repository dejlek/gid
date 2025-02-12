module ArrowDataset.DatasetFactory;

import ArrowDataset.Dataset;
import ArrowDataset.FinishOptions;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class DatasetFactory : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gadataset_dataset_factory_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  Dataset finish(FinishOptions options)
  {
    GADatasetDataset* _cretval;
    GError *_err;
    _cretval = gadataset_dataset_factory_finish(cast(GADatasetDatasetFactory*)cPtr, options ? cast(GADatasetFinishOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Dataset(cast(GADatasetDataset*)_cretval, Yes.Take);
    return _retval;
  }
}
