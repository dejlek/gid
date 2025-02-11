module Parquet.FixedLengthByteArrayStatistics;

import GLib.Bytes;
import Gid.gid;
import Parquet.Statistics;
import Parquet.Types;
import Parquet.c.functions;
import Parquet.c.types;

class FixedLengthByteArrayStatistics : Statistics
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gparquet_fixed_length_byte_array_statistics_get_type();
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
