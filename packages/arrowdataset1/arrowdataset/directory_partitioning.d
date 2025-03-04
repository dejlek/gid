module arrowdataset.directory_partitioning;

import arrow.array;
import arrow.schema;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.key_value_partitioning;
import arrowdataset.key_value_partitioning_options;
import arrowdataset.types;
import gid.gid;
import glib.error;

class DirectoryPartitioning : arrowdataset.key_value_partitioning.KeyValuePartitioning
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

  this(arrow.schema.Schema schema, arrow.array.Array[] dictionaries = null, arrowdataset.key_value_partitioning_options.KeyValuePartitioningOptions options = null)
  {
    GADatasetDirectoryPartitioning* _cretval;
    auto _dictionaries = gListFromD!(arrow.array.Array)(dictionaries);
    scope(exit) containerFree!(GList*, arrow.array.Array, GidOwnership.None)(_dictionaries);
    GError *_err;
    _cretval = gadataset_directory_partitioning_new(schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, _dictionaries, options ? cast(GADatasetKeyValuePartitioningOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }
}
