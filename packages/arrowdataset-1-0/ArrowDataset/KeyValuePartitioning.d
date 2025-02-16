module ArrowDataset.KeyValuePartitioning;

import ArrowDataset.Partitioning;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import Gid.gid;

class KeyValuePartitioning : Partitioning
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_key_value_partitioning_get_type != &gidSymbolNotFound ? gadataset_key_value_partitioning_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
