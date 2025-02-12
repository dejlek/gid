module ArrowDataset.PartitioningFactoryOptions;

import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import GObject.ObjectG;
import Gid.gid;

class PartitioningFactoryOptions : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gadataset_partitioning_factory_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GADatasetPartitioningFactoryOptions* _cretval;
    _cretval = gadataset_partitioning_factory_options_new();
    this(_cretval, Yes.Take);
  }
}
