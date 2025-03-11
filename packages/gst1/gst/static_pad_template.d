module gst.static_pad_template;

import gid.gid;
import gobject.object;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.pad_template;
import gst.static_caps;
import gst.types;

/**
    Structure describing the #GstStaticPadTemplate.
*/
class StaticPadTemplate
{
  GstStaticPadTemplate cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gst.StaticPadTemplate");

    cInstance = *cast(GstStaticPadTemplate*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string nameTemplate()
  {
    return cToD!(string)(cast(void*)(cast(GstStaticPadTemplate*)cPtr).nameTemplate);
  }

  @property void nameTemplate(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstStaticPadTemplate*)cPtr).nameTemplate);
    dToC(propval, cast(void*)&(cast(GstStaticPadTemplate*)cPtr).nameTemplate);
  }

  @property gst.types.PadDirection direction()
  {
    return cast(gst.types.PadDirection)(cast(GstStaticPadTemplate*)cPtr).direction;
  }

  @property void direction(gst.types.PadDirection propval)
  {
    (cast(GstStaticPadTemplate*)cPtr).direction = cast(GstPadDirection)propval;
  }

  @property gst.types.PadPresence presence()
  {
    return cast(gst.types.PadPresence)(cast(GstStaticPadTemplate*)cPtr).presence;
  }

  @property void presence(gst.types.PadPresence propval)
  {
    (cast(GstStaticPadTemplate*)cPtr).presence = cast(GstPadPresence)propval;
  }

  @property gst.static_caps.StaticCaps staticCaps()
  {
    return new gst.static_caps.StaticCaps(cast(GstStaticCaps*)&(cast(GstStaticPadTemplate*)cPtr).staticCaps);
  }

  /**
      Converts a #GstStaticPadTemplate into a #GstPadTemplate.
    Returns:     a new #GstPadTemplate.
  */
  gst.pad_template.PadTemplate get()
  {
    GstPadTemplate* _cretval;
    _cretval = gst_static_pad_template_get(cast(GstStaticPadTemplate*)cPtr);
    auto _retval = ObjectG.getDObject!(gst.pad_template.PadTemplate)(cast(GstPadTemplate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the capabilities of the static pad template.
    Returns:     the #GstCaps of the static pad template.
      Unref after usage. Since the core holds an additional
      ref to the returned caps, use gst_caps_make_writable()
      on the returned caps to modify it.
  */
  gst.caps.Caps getCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_static_pad_template_get_caps(cast(GstStaticPadTemplate*)cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
