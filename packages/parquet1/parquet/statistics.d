module parquet.statistics;

import gid.gid;
import gobject.object;
import parquet.c.functions;
import parquet.c.types;
import parquet.types;

/** */
class Statistics : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gparquet_statistics_get_type != &gidSymbolNotFound ? gparquet_statistics_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Statistics self()
  {
    return this;
  }

  /** */
  bool equal(parquet.statistics.Statistics otherStatistics)
  {
    bool _retval;
    _retval = gparquet_statistics_equal(cast(GParquetStatistics*)cPtr, otherStatistics ? cast(GParquetStatistics*)otherStatistics.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  long getNDistinctValues()
  {
    long _retval;
    _retval = gparquet_statistics_get_n_distinct_values(cast(GParquetStatistics*)cPtr);
    return _retval;
  }

  /** */
  long getNNulls()
  {
    long _retval;
    _retval = gparquet_statistics_get_n_nulls(cast(GParquetStatistics*)cPtr);
    return _retval;
  }

  /** */
  long getNValues()
  {
    long _retval;
    _retval = gparquet_statistics_get_n_values(cast(GParquetStatistics*)cPtr);
    return _retval;
  }

  /** */
  bool hasMinMax()
  {
    bool _retval;
    _retval = gparquet_statistics_has_min_max(cast(GParquetStatistics*)cPtr);
    return _retval;
  }

  /** */
  bool hasNDistinctValues()
  {
    bool _retval;
    _retval = gparquet_statistics_has_n_distinct_values(cast(GParquetStatistics*)cPtr);
    return _retval;
  }

  /** */
  bool hasNNulls()
  {
    bool _retval;
    _retval = gparquet_statistics_has_n_nulls(cast(GParquetStatistics*)cPtr);
    return _retval;
  }
}
