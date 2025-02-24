module gdk.grab_broken_event;

import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.surface;
import gdk.types;
import gid.gid;
import gobject.object;

/**
 * An event related to a broken windowing system grab.
 */
class GrabBrokenEvent : Event
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.GrabBrokenEvent");

    super(cast(GdkEvent*)ptr, take);
  }

  /**
   * Extracts the grab surface from a grab broken event.
   * Returns: the grab surface of event
   */
  Surface getGrabSurface()
  {
    GdkSurface* _cretval;
    _cretval = gdk_grab_broken_event_get_grab_surface(cast(GdkEvent*)cPtr);
    auto _retval = ObjectG.getDObject!Surface(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Checks whether the grab broken event is for an implicit grab.
   * Returns: %TRUE if the an implicit grab was broken
   */
  bool getImplicit()
  {
    bool _retval;
    _retval = gdk_grab_broken_event_get_implicit(cast(GdkEvent*)cPtr);
    return _retval;
  }
}
