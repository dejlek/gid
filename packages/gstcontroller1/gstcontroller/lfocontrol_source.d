/// Module for [LFOControlSource] class
module gstcontroller.lfocontrol_source;

import gid.gid;
import gst.control_source;
import gstcontroller.c.functions;
import gstcontroller.c.types;
import gstcontroller.types;

/**
    #GstLFOControlSource is a #GstControlSource, that provides several periodic
    waveforms as control values.
    
    To use #GstLFOControlSource get a new instance by calling
    [gstcontroller.lfocontrol_source.LFOControlSource.new_], bind it to a #GParamSpec and set the relevant
    properties.
    
    All functions are MT-safe.
*/
class LFOControlSource : gst.control_source.ControlSource
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
    return cast(void function())gst_lfo_control_source_get_type != &gidSymbolNotFound ? gst_lfo_control_source_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override LFOControlSource self()
  {
    return this;
  }

  /**
      This returns a new, unbound #GstLFOControlSource.
      Returns: a new, unbound #GstLFOControlSource.
  */
  this()
  {
    GstControlSource* _cretval;
    _cretval = gst_lfo_control_source_new();
    this(_cretval, Yes.Take);
  }
}
