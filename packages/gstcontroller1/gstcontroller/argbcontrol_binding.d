module gstcontroller.argbcontrol_binding;

import gid.gid;
import gst.control_binding;
import gst.control_source;
import gst.object;
import gstcontroller.c.functions;
import gstcontroller.c.types;
import gstcontroller.types;

/**
    A value mapping object that attaches multiple control sources to a guint
  gobject properties representing a color. A control value of 0.0 will turn the
  color component off and a value of 1.0 will be the color level.
*/
class ARGBControlBinding : gst.control_binding.ControlBinding
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_argb_control_binding_get_type != &gidSymbolNotFound ? gst_argb_control_binding_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Create a new control-binding that attaches the given #GstControlSource to the
    #GObject property.
    Params:
      object =       the object of the property
      propertyName =       the property-name to attach the control source
      csA =       the control source for the alpha channel
      csR =       the control source for the red channel
      csG =       the control source for the green channel
      csB =       the control source for the blue channel
    Returns:     the new #GstARGBControlBinding
  */
  this(gst.object.ObjectGst object, string propertyName, gst.control_source.ControlSource csA, gst.control_source.ControlSource csR, gst.control_source.ControlSource csG, gst.control_source.ControlSource csB)
  {
    GstControlBinding* _cretval;
    const(char)* _propertyName = propertyName.toCString(No.alloc);
    _cretval = gst_argb_control_binding_new(object ? cast(GstObject*)object.cPtr(No.dup) : null, _propertyName, csA ? cast(GstControlSource*)csA.cPtr(No.dup) : null, csR ? cast(GstControlSource*)csR.cPtr(No.dup) : null, csG ? cast(GstControlSource*)csG.cPtr(No.dup) : null, csB ? cast(GstControlSource*)csB.cPtr(No.dup) : null);
    this(_cretval, No.take);
  }
}
