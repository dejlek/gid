module Parquet.ByteArrayStatistics;

import GLib.Bytes;
import Gid.gid;
import Parquet.Statistics;
import Parquet.Types;
import Parquet.c.functions;
import Parquet.c.types;

class ByteArrayStatistics : Statistics
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gparquet_byte_array_statistics_get_type != &gidSymbolNotFound ? gparquet_byte_array_statistics_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  Bytes getMax()
  {
    GBytes* _cretval;
    _cretval = gparquet_byte_array_statistics_get_max(cast(GParquetByteArrayStatistics*)cPtr);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  Bytes getMin()
  {
    GBytes* _cretval;
    _cretval = gparquet_byte_array_statistics_get_min(cast(GParquetByteArrayStatistics*)cPtr);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
