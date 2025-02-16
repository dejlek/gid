module ArrowDataset.FileSystemDatasetWriteOptions;

import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import GObject.ObjectG;
import Gid.gid;

class FileSystemDatasetWriteOptions : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_file_system_dataset_write_options_get_type != &gidSymbolNotFound ? gadataset_file_system_dataset_write_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GADatasetFileSystemDatasetWriteOptions* _cretval;
    _cretval = gadataset_file_system_dataset_write_options_new();
    this(_cretval, Yes.Take);
  }
}
