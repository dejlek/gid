module arrowdataset.file_format;

import arrow.file_system;
import arrow.output_stream;
import arrow.schema;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.file_write_options;
import arrowdataset.file_writer;
import arrowdataset.types;
import gid.global;
import glib.error;
import gobject.object;

class FileFormat : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_file_format_get_type != &gidSymbolNotFound ? gadataset_file_format_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  bool equal(FileFormat otherFormat)
  {
    bool _retval;
    _retval = gadataset_file_format_equal(cast(GADatasetFileFormat*)cPtr, otherFormat ? cast(GADatasetFileFormat*)otherFormat.cPtr(No.Dup) : null);
    return _retval;
  }

  FileWriteOptions getDefaultWriteOptions()
  {
    GADatasetFileWriteOptions* _cretval;
    _cretval = gadataset_file_format_get_default_write_options(cast(GADatasetFileFormat*)cPtr);
    auto _retval = ObjectG.getDObject!FileWriteOptions(cast(GADatasetFileWriteOptions*)_cretval, Yes.Take);
    return _retval;
  }

  string getTypeName()
  {
    char* _cretval;
    _cretval = gadataset_file_format_get_type_name(cast(GADatasetFileFormat*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  FileWriter openWriter(OutputStream destination, FileSystem fileSystem, string path, Schema schema, FileWriteOptions options)
  {
    GADatasetFileWriter* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = gadataset_file_format_open_writer(cast(GADatasetFileFormat*)cPtr, destination ? cast(GArrowOutputStream*)destination.cPtr(No.Dup) : null, fileSystem ? cast(GArrowFileSystem*)fileSystem.cPtr(No.Dup) : null, _path, schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, options ? cast(GADatasetFileWriteOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!FileWriter(cast(GADatasetFileWriter*)_cretval, Yes.Take);
    return _retval;
  }
}
