module arrowdataset.hive_partitioning_options;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.key_value_partitioning_options;
import arrowdataset.types;
import gid.global;

class HivePartitioningOptions : KeyValuePartitioningOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_hive_partitioning_options_get_type != &gidSymbolNotFound ? gadataset_hive_partitioning_options_get_type() : cast(GType)0;
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
