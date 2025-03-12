module gstcontroller.trigger_control_source;

import gid.gid;
import gstcontroller.c.functions;
import gstcontroller.c.types;
import gstcontroller.timed_value_control_source;
import gstcontroller.types;

/**
    #GstTriggerControlSource is a #GstControlSource, that returns values from user-given
  control points. It allows for a tolerance on the time-stamps.
  
  To use #GstTriggerControlSource get a new instance by calling
  [gstcontroller.trigger_control_source.TriggerControlSource.new_], bind it to a #GParamSpec and set some
  control points by calling [gstcontroller.timed_value_control_source.TimedValueControlSource.set].
  
  All functions are MT-safe.
*/
class TriggerControlSource : gstcontroller.timed_value_control_source.TimedValueControlSource
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_trigger_control_source_get_type != &gidSymbolNotFound ? gst_trigger_control_source_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override TriggerControlSource self()
  {
    return this;
  }

  /**
      This returns a new, unbound #GstTriggerControlSource.
    Returns:     a new, unbound #GstTriggerControlSource.
  */
  this()
  {
    GstControlSource* _cretval;
    _cretval = gst_trigger_control_source_new();
    this(_cretval, Yes.Take);
  }
}
