module gstbase.aggregator_pad;

import gid.gid;
import gobject.dclosure;
import gst.buffer;
import gst.pad;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    Pads managed by a #GstAggregator subclass.
  
  This class used to live in gst-plugins-bad and was moved to core.
*/
class AggregatorPad : gst.pad.Pad
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_aggregator_pad_get_type != &gidSymbolNotFound ? gst_aggregator_pad_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Drop the buffer currently queued in pad.
    Returns:     TRUE if there was a buffer queued in pad, or FALSE if not.
  */
  bool dropBuffer()
  {
    bool _retval;
    _retval = gst_aggregator_pad_drop_buffer(cast(GstAggregatorPad*)cPtr);
    return _retval;
  }

  /**
      This checks if a pad has a buffer available that will be returned by
    a call to [gstbase.aggregator_pad.AggregatorPad.peekBuffer] or
    [gstbase.aggregator_pad.AggregatorPad.popBuffer].
    Returns:     true if the pad has a buffer available as the next thing.
  */
  bool hasBuffer()
  {
    bool _retval;
    _retval = gst_aggregator_pad_has_buffer(cast(GstAggregatorPad*)cPtr);
    return _retval;
  }

  /** */
  bool isEos()
  {
    bool _retval;
    _retval = gst_aggregator_pad_is_eos(cast(GstAggregatorPad*)cPtr);
    return _retval;
  }

  /**
      It is only valid to call this method from #GstAggregatorClass::aggregate()
    Returns:     true if the pad is inactive, false otherwise.
        See gst_aggregator_ignore_inactive_pads() for more info.
  */
  bool isInactive()
  {
    bool _retval;
    _retval = gst_aggregator_pad_is_inactive(cast(GstAggregatorPad*)cPtr);
    return _retval;
  }

  /** */
  gst.buffer.Buffer peekBuffer()
  {
    GstBuffer* _cretval;
    _cretval = gst_aggregator_pad_peek_buffer(cast(GstAggregatorPad*)cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Steal the ref to the buffer currently queued in pad.
    Returns:     The buffer in pad or NULL if no buffer was
        queued. You should unref the buffer after usage.
  */
  gst.buffer.Buffer popBuffer()
  {
    GstBuffer* _cretval;
    _cretval = gst_aggregator_pad_pop_buffer(cast(GstAggregatorPad*)cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /** */
  alias BufferConsumedCallbackDlg = void delegate(gst.buffer.Buffer object, gstbase.aggregator_pad.AggregatorPad aggregatorPad);

  /** ditto */
  alias BufferConsumedCallbackFunc = void function(gst.buffer.Buffer object, gstbase.aggregator_pad.AggregatorPad aggregatorPad);

  /**
    Connect to BufferConsumed signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectBufferConsumed(T)(T callback, Flag!"after" after = No.after)
  if (is(T : BufferConsumedCallbackDlg) || is(T : BufferConsumedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto aggregatorPad = getVal!(gstbase.aggregator_pad.AggregatorPad)(_paramVals);
      auto object = getVal!(gst.buffer.Buffer)(&_paramVals[1]);
      _dClosure.dlg(object, aggregatorPad);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("buffer-consumed", closure, after);
  }
}
