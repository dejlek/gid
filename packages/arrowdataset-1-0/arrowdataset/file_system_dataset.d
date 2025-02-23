module arrowdataset.file_system_dataset;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.dataset;
import arrowdataset.file_system_dataset_write_options;
import arrowdataset.scanner;
import arrowdataset.types;
import gid.gid;
import glib.error;

class FileSystemDataset : Dataset
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_file_system_dataset_get_type != &gidSymbolNotFound ? gadataset_file_system_dataset_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  static bool writeScanner(Scanner scanner, FileSystemDatasetWriteOptions options)
  {
    bool _retval;
    GError *_err;
    _retval = gadataset_file_system_dataset_write_scanner(scanner ? cast(GADatasetScanner*)scanner.cPtr(No.Dup) : null, options ? cast(GADatasetFileSystemDatasetWriteOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
