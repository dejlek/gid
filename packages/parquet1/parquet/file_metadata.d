/// Module for [FileMetadata] class
module parquet.file_metadata;

import gid.gid;
import glib.error;
import gobject.object;
import parquet.c.functions;
import parquet.c.types;
import parquet.row_group_metadata;
import parquet.types;

/** */
class FileMetadata : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gparquet_file_metadata_get_type != &gidSymbolNotFound ? gparquet_file_metadata_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileMetadata self()
  {
    return this;
  }

  /** */
  bool canDecompress()
  {
    bool _retval;
    _retval = gparquet_file_metadata_can_decompress(cast(GParquetFileMetadata*)cPtr);
    return _retval;
  }

  /** */
  bool equal(parquet.file_metadata.FileMetadata otherMetadata)
  {
    bool _retval;
    _retval = gparquet_file_metadata_equal(cast(GParquetFileMetadata*)cPtr, otherMetadata ? cast(GParquetFileMetadata*)otherMetadata.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  string getCreatedBy()
  {
    const(char)* _cretval;
    _cretval = gparquet_file_metadata_get_created_by(cast(GParquetFileMetadata*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  int getNColumns()
  {
    int _retval;
    _retval = gparquet_file_metadata_get_n_columns(cast(GParquetFileMetadata*)cPtr);
    return _retval;
  }

  /** */
  int getNRowGroups()
  {
    int _retval;
    _retval = gparquet_file_metadata_get_n_row_groups(cast(GParquetFileMetadata*)cPtr);
    return _retval;
  }

  /** */
  long getNRows()
  {
    long _retval;
    _retval = gparquet_file_metadata_get_n_rows(cast(GParquetFileMetadata*)cPtr);
    return _retval;
  }

  /** */
  int getNSchemaElements()
  {
    int _retval;
    _retval = gparquet_file_metadata_get_n_schema_elements(cast(GParquetFileMetadata*)cPtr);
    return _retval;
  }

  /** */
  parquet.row_group_metadata.RowGroupMetadata getRowGroup(int index)
  {
    GParquetRowGroupMetadata* _cretval;
    GError *_err;
    _cretval = gparquet_file_metadata_get_row_group(cast(GParquetFileMetadata*)cPtr, index, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap.getDObject!(parquet.row_group_metadata.RowGroupMetadata)(cast(GParquetRowGroupMetadata*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  uint getSize()
  {
    uint _retval;
    _retval = gparquet_file_metadata_get_size(cast(GParquetFileMetadata*)cPtr);
    return _retval;
  }
}
