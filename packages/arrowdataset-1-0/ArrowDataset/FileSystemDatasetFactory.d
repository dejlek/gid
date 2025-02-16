module ArrowDataset.FileSystemDatasetFactory;

import Arrow.FileSystem;
import ArrowDataset.DatasetFactory;
import ArrowDataset.FileFormat;
import ArrowDataset.FileSystemDataset;
import ArrowDataset.FinishOptions;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class FileSystemDatasetFactory : DatasetFactory
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_file_system_dataset_factory_get_type != &gidSymbolNotFound ? gadataset_file_system_dataset_factory_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(FileFormat fileFormat)
  {
    GADatasetFileSystemDatasetFactory* _cretval;
    _cretval = gadataset_file_system_dataset_factory_new(fileFormat ? cast(GADatasetFileFormat*)fileFormat.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  bool addPath(string path)
  {
    bool _retval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _retval = gadataset_file_system_dataset_factory_add_path(cast(GADatasetFileSystemDatasetFactory*)cPtr, _path, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  override FileSystemDataset finish(FinishOptions options)
  {
    GADatasetFileSystemDataset* _cretval;
    GError *_err;
    _cretval = gadataset_file_system_dataset_factory_finish(cast(GADatasetFileSystemDatasetFactory*)cPtr, options ? cast(GADatasetFinishOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!FileSystemDataset(cast(GADatasetFileSystemDataset*)_cretval, Yes.Take);
    return _retval;
  }

  bool setFileSystem(FileSystem fileSystem)
  {
    bool _retval;
    GError *_err;
    _retval = gadataset_file_system_dataset_factory_set_file_system(cast(GADatasetFileSystemDatasetFactory*)cPtr, fileSystem ? cast(GArrowFileSystem*)fileSystem.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool setFileSystemUri(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _retval = gadataset_file_system_dataset_factory_set_file_system_uri(cast(GADatasetFileSystemDatasetFactory*)cPtr, _uri, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
