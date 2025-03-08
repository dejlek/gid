module gstvideo.color_balance_mixin;

public import gstvideo.color_balance_iface_proxy;
public import gid.gid;
public import gobject.dclosure;
public import gstvideo.c.functions;
public import gstvideo.c.types;
public import gstvideo.color_balance_channel;
public import gstvideo.types;

/**
    This interface is implemented by elements which can perform some color
  balance operation on video frames they process. For example, modifying
  the brightness, contrast, hue or saturation.
  
  Example elements are 'xvimagesink' and 'colorbalance'
*/
template ColorBalanceT()
{

  /**
      Get the #GstColorBalanceType of this implementation.
    Returns:     A the #GstColorBalanceType.
  */
  override gstvideo.types.ColorBalanceType getBalanceType()
  {
    GstColorBalanceType _cretval;
    _cretval = gst_color_balance_get_balance_type(cast(GstColorBalance*)cPtr);
    gstvideo.types.ColorBalanceType _retval = cast(gstvideo.types.ColorBalanceType)_cretval;
    return _retval;
  }

  /**
      Retrieve the current value of the indicated channel, between min_value
    and max_value.
    
    See Also: The #GstColorBalanceChannel.min_value and
            #GstColorBalanceChannel.max_value members of the
            #GstColorBalanceChannel object.
    Params:
      channel =       A #GstColorBalanceChannel instance
    Returns:     The current value of the channel.
  */
  override int getValue(gstvideo.color_balance_channel.ColorBalanceChannel channel)
  {
    int _retval;
    _retval = gst_color_balance_get_value(cast(GstColorBalance*)cPtr, channel ? cast(GstColorBalanceChannel*)channel.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Retrieve a list of the available channels.
    Returns:     A
               GList containing pointers to #GstColorBalanceChannel
               objects. The list is owned by the #GstColorBalance
               instance and must not be freed.
  */
  override gstvideo.color_balance_channel.ColorBalanceChannel[] listChannels()
  {
    const(GList)* _cretval;
    _cretval = gst_color_balance_list_channels(cast(GstColorBalance*)cPtr);
    auto _retval = gListToD!(gstvideo.color_balance_channel.ColorBalanceChannel, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Sets the current value of the channel to the passed value, which must
    be between min_value and max_value.
    
    See Also: The #GstColorBalanceChannel.min_value and
            #GstColorBalanceChannel.max_value members of the
            #GstColorBalanceChannel object.
    Params:
      channel =       A #GstColorBalanceChannel instance
      value =       The new value for the channel.
  */
  override void setValue(gstvideo.color_balance_channel.ColorBalanceChannel channel, int value)
  {
    gst_color_balance_set_value(cast(GstColorBalance*)cPtr, channel ? cast(GstColorBalanceChannel*)channel.cPtr(No.Dup) : null, value);
  }

  /**
      A helper function called by implementations of the GstColorBalance
    interface. It fires the #GstColorBalance::value-changed signal on the
    instance, and the #GstColorBalanceChannel::value-changed signal on the
    channel object.
    Params:
      channel =       A #GstColorBalanceChannel whose value has changed
      value =       The new value of the channel
  */
  override void valueChanged(gstvideo.color_balance_channel.ColorBalanceChannel channel, int value)
  {
    gst_color_balance_value_changed(cast(GstColorBalance*)cPtr, channel ? cast(GstColorBalanceChannel*)channel.cPtr(No.Dup) : null, value);
  }

  /**
      Fired when the value of the indicated channel has changed.
  
    ## Parameters
    $(LIST
      * $(B channel)       The #GstColorBalanceChannel
      * $(B value)       The new value
      * $(B colorBalance) the instance the signal is connected to
    )
  */
  alias ValueChangedCallbackDlg = void delegate(gstvideo.color_balance_channel.ColorBalanceChannel channel, int value, gstvideo.color_balance.ColorBalance colorBalance);

  /** ditto */
  alias ValueChangedCallbackFunc = void function(gstvideo.color_balance_channel.ColorBalanceChannel channel, int value, gstvideo.color_balance.ColorBalance colorBalance);

  /**
    Connect to ValueChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectValueChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ValueChangedCallbackDlg) || is(T : ValueChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto colorBalance = getVal!(gstvideo.color_balance.ColorBalance)(_paramVals);
      auto channel = getVal!(gstvideo.color_balance_channel.ColorBalanceChannel)(&_paramVals[1]);
      auto value = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(channel, value, colorBalance);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("value-changed", closure, after);
  }
}
