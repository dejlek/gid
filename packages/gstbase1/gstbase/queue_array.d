module gstbase.queue_array;

import gid.gid;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    #GstQueueArray is an object that provides standard queue functionality
  based on an array instead of linked lists. This reduces the overhead
  caused by memory management by a large factor.
*/
class QueueArray
{
  GstQueueArray* cInstancePtr;
  bool owned;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstBase.QueueArray");

    cInstancePtr = cast(GstQueueArray*)ptr;

    owned = take;
  }

  void* cPtr()
  {
    return cast(void*)cInstancePtr;
  }

  /** */
  void pushTailStruct(void* pStruct = null)
  {
    gst_queue_array_push_tail_struct(cast(GstQueueArray*)cPtr, pStruct);
  }
}
