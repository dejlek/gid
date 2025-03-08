module gst.static_caps;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.types;

/**
    Data structure to initialize #GstCaps from a string description usually
  used in conjunction with GST_STATIC_CAPS() and [gst.static_caps.StaticCaps.get] to
  instantiate a #GstCaps.
*/
class StaticCaps
{
  GstStaticCaps cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gst.StaticCaps");

    cInstance = *cast(GstStaticCaps*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.caps.Caps caps()
  {
    return new gst.caps.Caps(cast(GstCaps*)(cast(GstStaticCaps*)cPtr).caps);
  }

  @property string string_()
  {
    return (cast(GstStaticCaps*)cPtr).string_.fromCString(No.free);
  }

  @property void string_(string propval)
  {
    safeFree(cast(void*)(cast(GstStaticCaps*)cPtr).string_);
    (cast(GstStaticCaps*)cPtr).string_ = propval.toCString(Yes.alloc);
  }

  /**
      Cleans up the cached caps contained in static_caps.
  */
  void cleanup()
  {
    gst_static_caps_cleanup(cast(GstStaticCaps*)cPtr);
  }

  /**
      Converts a #GstStaticCaps to a #GstCaps.
    Returns:     a pointer to the #GstCaps. Since the
          core holds an additional ref to the returned caps, use
          gst_caps_make_writable() on the returned caps to modify it.
  */
  gst.caps.Caps get()
  {
    GstCaps* _cretval;
    _cretval = gst_static_caps_get(cast(GstStaticCaps*)cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }
}
