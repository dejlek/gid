module ArrowDataset.HivePartitioning;

import Arrow.Array;
import Arrow.Schema;
import ArrowDataset.HivePartitioningOptions;
import ArrowDataset.KeyValuePartitioning;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import GLib.ErrorG;
import Gid.gid;

class HivePartitioning : KeyValuePartitioning
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_hive_partitioning_get_type != &gidSymbolNotFound ? gadataset_hive_partitioning_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Schema schema, Array[] dictionaries, HivePartitioningOptions options)
  {
    GADatasetHivePartitioning* _cretval;
    auto _dictionaries = gListFromD!(Array)(dictionaries);
    scope(exit) containerFree!(GList*, Array, GidOwnership.None)(_dictionaries);
    GError *_err;
    _cretval = gadataset_hive_partitioning_new(schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, _dictionaries, options ? cast(GADatasetHivePartitioningOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  string getNullFallback()
  {
    char* _cretval;
    _cretval = gadataset_hive_partitioning_get_null_fallback(cast(GADatasetHivePartitioning*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }
}
