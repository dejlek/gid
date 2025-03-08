module arrowdataset.hive_partitioning;

import arrow.array;
import arrow.schema;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.hive_partitioning_options;
import arrowdataset.key_value_partitioning;
import arrowdataset.types;
import gid.gid;
import glib.error;

/** */
class HivePartitioning : arrowdataset.key_value_partitioning.KeyValuePartitioning
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_hive_partitioning_get_type != &gidSymbolNotFound ? gadataset_hive_partitioning_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.schema.Schema schema, arrow.array.Array[] dictionaries = null, arrowdataset.hive_partitioning_options.HivePartitioningOptions options = null)
  {
    GADatasetHivePartitioning* _cretval;
    auto _dictionaries = gListFromD!(arrow.array.Array)(dictionaries);
    scope(exit) containerFree!(GList*, arrow.array.Array, GidOwnership.None)(_dictionaries);
    GError *_err;
    _cretval = gadataset_hive_partitioning_new(schema ? cast(GArrowSchema*)schema.cPtr(No.dup) : null, _dictionaries, options ? cast(GADatasetHivePartitioningOptions*)options.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.take);
  }

  /** */
  string getNullFallback()
  {
    char* _cretval;
    _cretval = gadataset_hive_partitioning_get_null_fallback(cast(GADatasetHivePartitioning*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
    return _retval;
  }
}
