module gdk.event_sequence;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gobject.boxed;

/**
    [gdk.event_sequence.EventSequence] is an opaque type representing a sequence
  of related touch events.
*/
class EventSequence : gobject.boxed.Boxed
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
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_event_sequence_get_type != &gidSymbolNotFound ? gdk_event_sequence_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
