module Gdk.DNDEvent;

import GObject.ObjectG;
import Gdk.Drop;
import Gdk.Event;
import Gdk.Types;
import Gdk.c.functions;
import Gdk.c.types;
import Gid.gid;

/**
 * An event related to drag and drop operations.
 */
class DNDEvent : Event
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.DNDEvent");

    super(cast(GdkEvent*)ptr, take);
  }

  /**
   * Gets the `GdkDrop` object from a DND event.
   * Returns: the drop
   */
  Drop getDrop()
  {
    GdkDrop* _cretval;
    _cretval = gdk_dnd_event_get_drop(cast(GdkEvent*)cPtr);
    auto _retval = ObjectG.getDObject!Drop(cast(GdkDrop*)_cretval, No.Take);
    return _retval;
  }
}
