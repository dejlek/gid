module Parquet.Int32Statistics;

import Gid.gid;
import Parquet.Statistics;
import Parquet.Types;
import Parquet.c.functions;
import Parquet.c.types;

class Int32Statistics : Statistics
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gparquet_int32_statistics_get_type != &gidSymbolNotFound ? gparquet_int32_statistics_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  int getMax()
  {
    int _retval;
    _retval = gparquet_int32_statistics_get_max(cast(GParquetInt32Statistics*)cPtr);
    return _retval;
  }

  int getMin()
  {
    int _retval;
    _retval = gparquet_int32_statistics_get_min(cast(GParquetInt32Statistics*)cPtr);
    return _retval;
  }
}
