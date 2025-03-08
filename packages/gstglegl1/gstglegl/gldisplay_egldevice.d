module gstglegl.gldisplay_egldevice;

import gid.gid;
import gobject.object;
import gstgl.gldisplay;
import gstglegl.c.functions;
import gstglegl.c.types;
import gstglegl.types;

/**
    the contents of a #GstGLDisplayEGLDevice are private and should only be accessed
  through the provided API
*/
class GLDisplayEGLDevice : gstgl.gldisplay.GLDisplay
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_display_egl_device_get_type != &gidSymbolNotFound ? gst_gl_display_egl_device_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Create a new #GstGLDisplayEGLDevice with an EGLDevice supported device
    Params:
      deviceIndex =       the index of device to use
    Returns:     a new #GstGLDisplayEGLDevice or null
  */
  this(uint deviceIndex)
  {
    GstGLDisplayEGLDevice* _cretval;
    _cretval = gst_gl_display_egl_device_new(deviceIndex);
    this(_cretval, Yes.take);
  }

  /**
      Creates a new #GstGLDisplayEGLDevice with EGLDeviceEXT .
    The device must be created using EGLDevice enumeration.
    Params:
      device =       an existing EGLDeviceEXT
    Returns:     a new #GstGLDisplayEGLDevice
  */
  static gstglegl.gldisplay_egldevice.GLDisplayEGLDevice newWithEglDevice(void* device = null)
  {
    GstGLDisplayEGLDevice* _cretval;
    _cretval = gst_gl_display_egl_device_new_with_egl_device(device);
    auto _retval = ObjectG.getDObject!(gstglegl.gldisplay_egldevice.GLDisplayEGLDevice)(cast(GstGLDisplayEGLDevice*)_cretval, Yes.take);
    return _retval;
  }
}
