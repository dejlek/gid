/// Module for [CollectData] class
module gstbase.collect_data;

import gid.gid;
import gst.buffer;
import gst.pad;
import gst.segment;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.collect_pads;
import gstbase.types;

/**
    Structure used by the collect_pads.
*/
class CollectData
{
  GstCollectData cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstBase.CollectData");

    cInstance = *cast(GstCollectData*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gstbase.collect_pads.CollectPads collect()
  {
    return cToD!(gstbase.collect_pads.CollectPads)(cast(void*)(cast(GstCollectData*)cPtr).collect);
  }

  @property void collect(gstbase.collect_pads.CollectPads propval)
  {
    cValueFree!(gstbase.collect_pads.CollectPads)(cast(void*)(cast(GstCollectData*)cPtr).collect);
    dToC(propval, cast(void*)&(cast(GstCollectData*)cPtr).collect);
  }

  @property gst.pad.Pad pad()
  {
    return cToD!(gst.pad.Pad)(cast(void*)(cast(GstCollectData*)cPtr).pad);
  }

  @property void pad(gst.pad.Pad propval)
  {
    cValueFree!(gst.pad.Pad)(cast(void*)(cast(GstCollectData*)cPtr).pad);
    dToC(propval, cast(void*)&(cast(GstCollectData*)cPtr).pad);
  }

  @property gst.buffer.Buffer buffer()
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstCollectData*)cPtr).buffer);
  }

  @property void buffer(gst.buffer.Buffer propval)
  {
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstCollectData*)cPtr).buffer);
    dToC(propval, cast(void*)&(cast(GstCollectData*)cPtr).buffer);
  }

  @property uint pos()
  {
    return (cast(GstCollectData*)cPtr).pos;
  }

  @property void pos(uint propval)
  {
    (cast(GstCollectData*)cPtr).pos = propval;
  }

  @property gst.segment.Segment segment()
  {
    return cToD!(gst.segment.Segment)(cast(void*)&(cast(GstCollectData*)cPtr).segment);
  }
}
