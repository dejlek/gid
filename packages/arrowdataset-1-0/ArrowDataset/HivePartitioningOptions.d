module ArrowDataset.HivePartitioningOptions;

import ArrowDataset.KeyValuePartitioningOptions;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import Gid.gid;

class HivePartitioningOptions : KeyValuePartitioningOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gadataset_hive_partitioning_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GADatasetHivePartitioningOptions* _cretval;
    _cretval = gadataset_hive_partitioning_options_new();
    this(_cretval, Yes.Take);
  }
}
