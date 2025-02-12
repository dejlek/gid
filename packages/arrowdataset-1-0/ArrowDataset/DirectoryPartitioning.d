module ArrowDataset.DirectoryPartitioning;

import Arrow.Array;
import Arrow.Schema;
import ArrowDataset.KeyValuePartitioning;
import ArrowDataset.KeyValuePartitioningOptions;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import GLib.ErrorG;
import Gid.gid;

class DirectoryPartitioning : KeyValuePartitioning
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gadataset_directory_partitioning_get_type();
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
