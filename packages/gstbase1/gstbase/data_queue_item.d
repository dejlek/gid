module gstbase.data_queue_item;

import gid.gid;
import gst.mini_object;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    Structure used by #GstDataQueue. You can supply a different structure, as
  long as the top of the structure is identical to this structure.
*/
class DataQueueItem
{
  GstDataQueueItem cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstBase.DataQueueItem");

    cInstance = *cast(GstDataQueueItem*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.mini_object.MiniObject object()
  {
    return new gst.mini_object.MiniObject(cast(GstMiniObject*)(cast(GstDataQueueItem*)cPtr).object);
  }

  @property uint size()
  {
    return (cast(GstDataQueueItem*)cPtr).size;
  }

  @property void size(uint propval)
  {
    (cast(GstDataQueueItem*)cPtr).size = propval;
  }

  @property ulong duration()
  {
    return (cast(GstDataQueueItem*)cPtr).duration;
  }

  @property void duration(ulong propval)
  {
    (cast(GstDataQueueItem*)cPtr).duration = propval;
  }

  @property bool visible()
  {
    return (cast(GstDataQueueItem*)cPtr).visible;
  }

  @property void visible(bool propval)
  {
    (cast(GstDataQueueItem*)cPtr).visible = propval;
  }

  @property GDestroyNotify destroy()
  {
    return (cast(GstDataQueueItem*)cPtr).destroy;
  }

  @property void destroy(GDestroyNotify propval)
  {
    (cast(GstDataQueueItem*)cPtr).destroy = propval;
  }
}
