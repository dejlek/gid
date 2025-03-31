/// Module for [ProxyControlBinding] class
module gstcontroller.proxy_control_binding;

import gid.gid;
import gst.control_binding;
import gst.object;
import gstcontroller.c.functions;
import gstcontroller.c.types;
import gstcontroller.types;

/**
    A #GstControlBinding that forwards requests to another #GstControlBinding
*/
class ProxyControlBinding : gst.control_binding.ControlBinding
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_proxy_control_binding_get_type != &gidSymbolNotFound ? gst_proxy_control_binding_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override ProxyControlBinding self()
  {
    return this;
  }

  /**
      #GstProxyControlBinding forwards all access to data or `sync_values()`
      requests from property_name on object to the control binding at
      ref_property_name on ref_object.
  
      Params:
        object = a #GstObject
        propertyName = the property name in object to control
        refObject = a #GstObject to forward all
                       #GstControlBinding requests to
        refPropertyName = the property_name in ref_object to control
      Returns: a new #GstControlBinding that proxies the control interface between
        properties on different #GstObject's
  */
  this(gst.object.ObjectGst object, string propertyName, gst.object.ObjectGst refObject, string refPropertyName)
  {
    GstControlBinding* _cretval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    const(char)* _refPropertyName = refPropertyName.toCString(No.Alloc);
    _cretval = gst_proxy_control_binding_new(object ? cast(GstObject*)object.cPtr(No.Dup) : null, _propertyName, refObject ? cast(GstObject*)refObject.cPtr(No.Dup) : null, _refPropertyName);
    this(_cretval, No.Take);
  }
}
