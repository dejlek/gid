module gstrtsp.rtsptime_range;

import gid.gid;
import gstrtsp.c.functions;
import gstrtsp.c.types;
import gstrtsp.types;

/**
    A time range.
*/
class RTSPTimeRange
{
  GstRTSPTimeRange cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstRtsp.RTSPTimeRange");

    cInstance = *cast(GstRTSPTimeRange*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gstrtsp.types.RTSPRangeUnit unit()
  {
    return cast(gstrtsp.types.RTSPRangeUnit)(cast(GstRTSPTimeRange*)cPtr).unit;
  }

  @property void unit(gstrtsp.types.RTSPRangeUnit propval)
  {
    (cast(GstRTSPTimeRange*)cPtr).unit = cast(GstRTSPRangeUnit)propval;
  }

  @property gstrtsp.types.RTSPTime min()
  {
    return (cast(GstRTSPTimeRange*)cPtr).min;
  }

  @property void min(gstrtsp.types.RTSPTime propval)
  {
    (cast(GstRTSPTimeRange*)cPtr).min = propval;
  }

  @property gstrtsp.types.RTSPTime max()
  {
    return (cast(GstRTSPTimeRange*)cPtr).max;
  }

  @property void max(gstrtsp.types.RTSPTime propval)
  {
    (cast(GstRTSPTimeRange*)cPtr).max = propval;
  }

  @property gstrtsp.types.RTSPTime2 min2()
  {
    return (cast(GstRTSPTimeRange*)cPtr).min2;
  }

  @property void min2(gstrtsp.types.RTSPTime2 propval)
  {
    (cast(GstRTSPTimeRange*)cPtr).min2 = propval;
  }

  @property gstrtsp.types.RTSPTime2 max2()
  {
    return (cast(GstRTSPTimeRange*)cPtr).max2;
  }

  @property void max2(gstrtsp.types.RTSPTime2 propval)
  {
    (cast(GstRTSPTimeRange*)cPtr).max2 = propval;
  }
}
