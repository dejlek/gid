/// Module for [DirectControlBinding] class
module gstcontroller.direct_control_binding;

import gid.gid;
import gobject.object;
import gst.control_binding;
import gst.control_source;
import gst.object;
import gstcontroller.c.functions;
import gstcontroller.c.types;
import gstcontroller.types;

/**
    A value mapping object that attaches control sources to gobject properties. It
    will map the control values directly to the target property range. If a
    non-absolute direct control binding is used, the value range [0.0 ... 1.0]
    is mapped to full target property range, and all values outside the range
    will be clipped. An absolute control binding will not do any value
    transformations.
*/
class DirectControlBinding : gst.control_binding.ControlBinding
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_direct_control_binding_get_type != &gidSymbolNotFound ? gst_direct_control_binding_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DirectControlBinding self()
  {
    return this;
  }

  /** */
  @property gst.control_source.ControlSource controlSource()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.control_source.ControlSource)("control-source");
  }

  /** */
  @property void controlSource(gst.control_source.ControlSource propval)
  {
    gobject.object.ObjectWrap.setProperty!(gst.control_source.ControlSource)("control-source", propval);
  }

  /**
      Create a new control-binding that attaches the #GstControlSource to the
      #GObject property. It will map the control source range [0.0 ... 1.0] to
      the full target property range, and clip all values outside this range.
  
      Params:
        object = the object of the property
        propertyName = the property-name to attach the control source
        cs = the control source
      Returns: the new #GstDirectControlBinding
  */
  this(gst.object.ObjectWrap object, string propertyName, gst.control_source.ControlSource cs)
  {
    GstControlBinding* _cretval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    _cretval = gst_direct_control_binding_new(object ? cast(GstObject*)object._cPtr(No.Dup) : null, _propertyName, cs ? cast(GstControlSource*)cs._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Create a new control-binding that attaches the #GstControlSource to the
      #GObject property. It will directly map the control source values to the
      target property range without any transformations.
  
      Params:
        object = the object of the property
        propertyName = the property-name to attach the control source
        cs = the control source
      Returns: the new #GstDirectControlBinding
  */
  static gstcontroller.direct_control_binding.DirectControlBinding newAbsolute(gst.object.ObjectWrap object, string propertyName, gst.control_source.ControlSource cs)
  {
    GstControlBinding* _cretval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    _cretval = gst_direct_control_binding_new_absolute(object ? cast(GstObject*)object._cPtr(No.Dup) : null, _propertyName, cs ? cast(GstControlSource*)cs._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstcontroller.direct_control_binding.DirectControlBinding)(cast(GstControlBinding*)_cretval, No.Take);
    return _retval;
  }
}
