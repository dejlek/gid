module gdk.delete_event;

import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.types;
import gid.gid;

/**
    An event related to closing a top-level surface.
*/
class DeleteEvent : gdk.event.Event
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.DeleteEvent");

    super(cast(GdkEvent*)ptr, take);
  }
}
