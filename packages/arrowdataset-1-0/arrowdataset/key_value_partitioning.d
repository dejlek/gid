module arrowdataset.key_value_partitioning;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.partitioning;
import arrowdataset.types;
import gid.gid;

class KeyValuePartitioning : Partitioning
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_key_value_partitioning_get_type != &gidSymbolNotFound ? gadataset_key_value_partitioning_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
