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

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gst.StaticCaps");

    cInstance = *cast(GstStaticCaps*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.caps.Caps caps()
  {
    return cToD!(gst.caps.Caps)(cast(void*)(cast(GstStaticCaps*)cPtr).caps);
  }

  @property void caps(gst.caps.Caps propval)
  {
    cValueFree!(gst.caps.Caps)(cast(void*)(cast(GstStaticCaps*)cPtr).caps);
    dToC(propval, cast(void*)&(cast(GstStaticCaps*)cPtr).caps);
  }

  @property string string_()
  {
    return cToD!(string)(cast(void*)(cast(GstStaticCaps*)cPtr).string_);
  }

  @property void string_(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstStaticCaps*)cPtr).string_);
    dToC(propval, cast(void*)&(cast(GstStaticCaps*)cPtr).string_);
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
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
