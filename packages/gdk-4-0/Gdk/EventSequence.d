module Gdk.EventSequence;

import GObject.Boxed;
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
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_event_sequence_get_type != &gidSymbolNotFound ? gdk_event_sequence_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
