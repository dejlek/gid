module gstvideo.color_balance_channel;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    The #GstColorBalanceChannel object represents a parameter
  for modifying the color balance implemented by an element providing the
  #GstColorBalance interface. For example, Hue or Saturation.
*/
class ColorBalanceChannel : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_color_balance_channel_get_type != &gidSymbolNotFound ? gst_color_balance_channel_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Fired when the value of the indicated channel has changed.
  
    ## Parameters
    $(LIST
      * $(B value)       The new value
      * $(B colorBalanceChannel) the instance the signal is connected to
    )
  */
  alias ValueChangedCallbackDlg = void delegate(int value, gstvideo.color_balance_channel.ColorBalanceChannel colorBalanceChannel);

  /** ditto */
  alias ValueChangedCallbackFunc = void function(int value, gstvideo.color_balance_channel.ColorBalanceChannel colorBalanceChannel);

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
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto colorBalanceChannel = getVal!(gstvideo.color_balance_channel.ColorBalanceChannel)(_paramVals);
      auto value = getVal!(int)(&_paramVals[1]);
      _dClosure.dlg(value, colorBalanceChannel);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("value-changed", closure, after);
  }
}
