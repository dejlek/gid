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
    return gadataset_key_value_partitioning_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }
}
