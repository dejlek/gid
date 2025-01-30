module Gdk.EventSequence;

import GLib.Boxed;
import Gdk.Types;
import Gdk.c.functions;
import Gdk.c.types;
import Gid.gid;

/**
 * `GdkEventSequence` is an opaque type representing a sequence
 * of related touch events.
 */
class EventSequence : Boxed
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    return gdk_event_sequence_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }
}
