module parquet.fixed_length_byte_array_statistics;

import gid.gid;
import glib.bytes;
import parquet.c.functions;
import parquet.c.types;
import parquet.statistics;
import parquet.types;

class FixedLengthByteArrayStatistics : Statistics
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gparquet_fixed_length_byte_array_statistics_get_type != &gidSymbolNotFound ? gparquet_fixed_length_byte_array_statistics_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  Bytes getMax()
  {
    GBytes* _cretval;
    _cretval = gparquet_fixed_length_byte_array_statistics_get_max(cast(GParquetFixedLengthByteArrayStatistics*)cPtr);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  Bytes getMin()
  {
    GBytes* _cretval;
    _cretval = gparquet_fixed_length_byte_array_statistics_get_min(cast(GParquetFixedLengthByteArrayStatistics*)cPtr);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
