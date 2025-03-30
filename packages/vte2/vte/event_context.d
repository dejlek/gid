/// Module for [EventContext] class
module vte.event_context;

import gdk.event;
import gid.gid;
import vte.c.functions;
import vte.c.types;
import vte.types;

/**
    Provides context information for a context menu event.
*/
class EventContext
{
  VteEventContext* cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Vte.EventContext");

    cInstancePtr = cast(VteEventContext*)ptr;

    owned = take;
  }

  /** */
  void* cPtr()
  {
    return cast(void*)cInstancePtr;
  }

  /** */
  gdk.event.Event getEvent()
  {
    GdkEvent* _cretval;
    _cretval = vte_event_context_get_event(cast(const(VteEventContext)*)cPtr);
    auto _retval = _cretval ? new gdk.event.Event(cast(GdkEvent*)_cretval) : null;
    return _retval;
  }
}
