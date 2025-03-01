module arrowdataset.partitioning;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.global;
import gobject.object;

class Partitioning : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_partitioning_get_type != &gidSymbolNotFound ? gadataset_partitioning_get_type() : cast(GType)0;
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
