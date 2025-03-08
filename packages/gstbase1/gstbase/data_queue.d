module gstbase.data_queue;

import gid.gid;
import gobject.object;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    #GstDataQueue is an object that handles threadsafe queueing of objects. It
  also provides size-related functionality. This object should be used for
  any #GstElement that wishes to provide some sort of queueing functionality.
*/
class DataQueue : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_data_queue_get_type != &gidSymbolNotFound ? gst_data_queue_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }
}
