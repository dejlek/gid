/// Module for [InterpolationControlSource] class
module gstcontroller.interpolation_control_source;

import gid.gid;
import gstcontroller.c.functions;
import gstcontroller.c.types;
import gstcontroller.timed_value_control_source;
import gstcontroller.types;

/**
    #GstInterpolationControlSource is a #GstControlSource, that interpolates values between user-given
    control points. It supports several interpolation modes and property types.
    
    To use #GstInterpolationControlSource get a new instance by calling
    [gstcontroller.interpolation_control_source.InterpolationControlSource.new_], bind it to a #GParamSpec and set some
    control points by calling [gstcontroller.timed_value_control_source.TimedValueControlSource.set].
    
    All functions are MT-safe.
*/
class InterpolationControlSource : gstcontroller.timed_value_control_source.TimedValueControlSource
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
    return cast(void function())gst_interpolation_control_source_get_type != &gidSymbolNotFound ? gst_interpolation_control_source_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override InterpolationControlSource self()
  {
    return this;
  }

  /**
      This returns a new, unbound #GstInterpolationControlSource.
      Returns: a new, unbound #GstInterpolationControlSource.
  */
  this()
  {
    GstControlSource* _cretval;
    _cretval = gst_interpolation_control_source_new();
    this(_cretval, Yes.Take);
  }
}
