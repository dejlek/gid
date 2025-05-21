/// Module for [ByteArrayStatistics] class
module parquet.byte_array_statistics;

import gid.gid;
import glib.bytes;
import parquet.c.functions;
import parquet.c.types;
import parquet.statistics;
import parquet.types;

/** */
class ByteArrayStatistics : parquet.statistics.Statistics
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gparquet_byte_array_statistics_get_type != &gidSymbolNotFound ? gparquet_byte_array_statistics_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ByteArrayStatistics self()
  {
    return this;
  }

  /** */
  glib.bytes.Bytes getMax()
  {
    GBytes* _cretval;
    _cretval = gparquet_byte_array_statistics_get_max(cast(GParquetByteArrayStatistics*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  glib.bytes.Bytes getMin()
  {
    GBytes* _cretval;
    _cretval = gparquet_byte_array_statistics_get_min(cast(GParquetByteArrayStatistics*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
