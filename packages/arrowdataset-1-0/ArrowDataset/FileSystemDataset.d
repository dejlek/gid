module ArrowDataset.FileSystemDataset;

import ArrowDataset.Dataset;
import ArrowDataset.FileSystemDatasetWriteOptions;
import ArrowDataset.Scanner;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import GLib.ErrorG;
import Gid.gid;

class FileSystemDataset : Dataset
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gadataset_file_system_dataset_get_type();
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
