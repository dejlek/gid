module arrowdataset.directory_partitioning;

import arrow.array;
import arrow.schema;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.key_value_partitioning;
import arrowdataset.key_value_partitioning_options;
import arrowdataset.types;
import gid.global;
import glib.error;

class DirectoryPartitioning : KeyValuePartitioning
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_directory_partitioning_get_type != &gidSymbolNotFound ? gadataset_directory_partitioning_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Schema schema, Array[] dictionaries, KeyValuePartitioningOptions options)
  {
    GADatasetDirectoryPartitioning* _cretval;
    auto _dictionaries = gListFromD!(Array)(dictionaries);
    scope(exit) containerFree!(GList*, Array, GidOwnership.None)(_dictionaries);
    GError *_err;
    _cretval = gadataset_directory_partitioning_new(schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, _dictionaries, options ? cast(GADatasetKeyValuePartitioningOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }
}
