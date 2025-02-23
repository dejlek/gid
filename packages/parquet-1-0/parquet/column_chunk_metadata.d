module parquet.column_chunk_metadata;

import gid.gid;
import gobject.object;
import parquet.c.functions;
import parquet.c.types;
import parquet.statistics;
import parquet.types;

class ColumnChunkMetadata : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gparquet_column_chunk_metadata_get_type != &gidSymbolNotFound ? gparquet_column_chunk_metadata_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  bool canDecompress()
  {
    bool _retval;
    _retval = gparquet_column_chunk_metadata_can_decompress(cast(GParquetColumnChunkMetadata*)cPtr);
    return _retval;
  }

  bool equal(ColumnChunkMetadata otherMetadata)
  {
    bool _retval;
    _retval = gparquet_column_chunk_metadata_equal(cast(GParquetColumnChunkMetadata*)cPtr, otherMetadata ? cast(GParquetColumnChunkMetadata*)otherMetadata.cPtr(No.Dup) : null);
    return _retval;
  }

  long getFileOffset()
  {
    long _retval;
    _retval = gparquet_column_chunk_metadata_get_file_offset(cast(GParquetColumnChunkMetadata*)cPtr);
    return _retval;
  }

  Statistics getStatistics()
  {
    GParquetStatistics* _cretval;
    _cretval = gparquet_column_chunk_metadata_get_statistics(cast(GParquetColumnChunkMetadata*)cPtr);
    auto _retval = ObjectG.getDObject!Statistics(cast(GParquetStatistics*)_cretval, Yes.Take);
    return _retval;
  }

  long getTotalCompressedSize()
  {
    long _retval;
    _retval = gparquet_column_chunk_metadata_get_total_compressed_size(cast(GParquetColumnChunkMetadata*)cPtr);
    return _retval;
  }

  long getTotalSize()
  {
    long _retval;
    _retval = gparquet_column_chunk_metadata_get_total_size(cast(GParquetColumnChunkMetadata*)cPtr);
    return _retval;
  }
}
