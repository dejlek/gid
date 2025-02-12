module ArrowDataset.Partitioning;

import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import GObject.ObjectG;
import Gid.gid;

class Partitioning : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gadataset_partitioning_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  static Partitioning createDefault()
  {
    GADatasetPartitioning* _cretval;
    _cretval = gadataset_partitioning_create_default();
    auto _retval = ObjectG.getDObject!Partitioning(cast(GADatasetPartitioning*)_cretval, Yes.Take);
    return _retval;
  }

  string getTypeName()
  {
    char* _cretval;
    _cretval = gadataset_partitioning_get_type_name(cast(GADatasetPartitioning*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }
}
