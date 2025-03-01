module parquet.row_group_metadata;

import gid.global;
import glib.error;
import gobject.object;
import parquet.c.functions;
import parquet.c.types;
import parquet.column_chunk_metadata;
import parquet.types;

class RowGroupMetadata : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gparquet_row_group_metadata_get_type != &gidSymbolNotFound ? gparquet_row_group_metadata_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  bool canDecompress()
  {
    bool _retval;
    _retval = gparquet_row_group_metadata_can_decompress(cast(GParquetRowGroupMetadata*)cPtr);
    return _retval;
  }

  bool equal(RowGroupMetadata otherMetadata)
  {
    bool _retval;
    _retval = gparquet_row_group_metadata_equal(cast(GParquetRowGroupMetadata*)cPtr, otherMetadata ? cast(GParquetRowGroupMetadata*)otherMetadata.cPtr(No.Dup) : null);
    return _retval;
  }

  ColumnChunkMetadata getColumnChunk(int index)
  {
    GParquetColumnChunkMetadata* _cretval;
    GError *_err;
    _cretval = gparquet_row_group_metadata_get_column_chunk(cast(GParquetRowGroupMetadata*)cPtr, index, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!ColumnChunkMetadata(cast(GParquetColumnChunkMetadata*)_cretval, Yes.Take);
    return _retval;
  }

  long getFileOffset()
  {
    long _retval;
    _retval = gparquet_row_group_metadata_get_file_offset(cast(GParquetRowGroupMetadata*)cPtr);
    return _retval;
  }

  int getNColumns()
  {
    int _retval;
    _retval = gparquet_row_group_metadata_get_n_columns(cast(GParquetRowGroupMetadata*)cPtr);
    return _retval;
  }

  long getNRows()
  {
    long _retval;
    _retval = gparquet_row_group_metadata_get_n_rows(cast(GParquetRowGroupMetadata*)cPtr);
    return _retval;
  }

  long getTotalCompressedSize()
  {
    long _retval;
    _retval = gparquet_row_group_metadata_get_total_compressed_size(cast(GParquetRowGroupMetadata*)cPtr);
    return _retval;
  }

  long getTotalSize()
  {
    long _retval;
    _retval = gparquet_row_group_metadata_get_total_size(cast(GParquetRowGroupMetadata*)cPtr);
    return _retval;
  }
}
