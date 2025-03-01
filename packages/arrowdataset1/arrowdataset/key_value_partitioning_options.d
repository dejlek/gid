module arrowdataset.key_value_partitioning_options;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.global;
import gobject.object;

class KeyValuePartitioningOptions : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_key_value_partitioning_options_get_type != &gidSymbolNotFound ? gadataset_key_value_partitioning_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GADatasetKeyValuePartitioningOptions* _cretval;
    _cretval = gadataset_key_value_partitioning_options_new();
    this(_cretval, Yes.Take);
  }
}
