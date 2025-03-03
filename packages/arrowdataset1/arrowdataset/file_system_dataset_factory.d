module arrowdataset.file_system_dataset_factory;

import arrow.file_system;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.dataset;
import arrowdataset.dataset_factory;
import arrowdataset.file_format;
import arrowdataset.file_system_dataset;
import arrowdataset.finish_options;
import arrowdataset.types;
import gid.gid;
import glib.error;
import gobject.object;

class FileSystemDatasetFactory : arrowdataset.dataset_factory.DatasetFactory
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_file_system_dataset_factory_get_type != &gidSymbolNotFound ? gadataset_file_system_dataset_factory_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(arrowdataset.file_format.FileFormat fileFormat)
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

  override arrowdataset.file_system_dataset.FileSystemDataset finish(arrowdataset.finish_options.FinishOptions options)
  {
    GADatasetFileSystemDataset* _cretval;
    GError *_err;
    _cretval = gadataset_file_system_dataset_factory_finish(cast(GADatasetFileSystemDatasetFactory*)cPtr, options ? cast(GADatasetFinishOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrowdataset.file_system_dataset.FileSystemDataset)(cast(GADatasetFileSystemDataset*)_cretval, Yes.Take);
    return _retval;
  }

  bool setFileSystem(arrow.file_system.FileSystem fileSystem)
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
