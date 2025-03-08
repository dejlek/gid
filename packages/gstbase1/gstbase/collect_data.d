module gstbase.collect_data;

import gid.gid;
import gobject.object;
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

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstBase.CollectData");

    cInstance = *cast(GstCollectData*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gstbase.collect_pads.CollectPads collect()
  {
    return ObjectG.getDObject!(gstbase.collect_pads.CollectPads)((cast(GstCollectData*)cPtr).collect, No.take);
  }

  @property gst.pad.Pad pad()
  {
    return ObjectG.getDObject!(gst.pad.Pad)((cast(GstCollectData*)cPtr).pad, No.take);
  }

  @property gst.buffer.Buffer buffer()
  {
    return new gst.buffer.Buffer(cast(GstBuffer*)(cast(GstCollectData*)cPtr).buffer);
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
    return new gst.segment.Segment(cast(GstSegment*)&(cast(GstCollectData*)cPtr).segment);
  }
}
