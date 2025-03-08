module gtk.scale_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    #GtkScaleButton provides a button which pops up a scale widget.
  This kind of widget is commonly used for volume controls in multimedia
  applications, and GTK+ provides a #GtkVolumeButton subclass that
  is tailored for this use case.
  
  # CSS nodes
  
  GtkScaleButton has a single CSS node with name button. To differentiate
  it from a plain #GtkButton, it gets the .scale style class.
  
  The popup widget that contains the scale has a .scale-popup style class.
*/
class ScaleButton : gtk.button.Button, gtk.orientable.Orientable
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_scale_button_get_type != &gidSymbolNotFound ? gtk_scale_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin OrientableT!();

  /**
      Creates a #GtkScaleButton, with a range between min and max, with
    a stepping of step.
    Params:
      size =       a stock icon size (#GtkIconSize)
      min =       the minimum value of the scale (usually 0)
      max =       the maximum value of the scale (usually 100)
      step =       the stepping of value when a scroll-wheel event,
               or up/down arrow event occurs (usually 2)
      icons =       a null-terminated
                array of icon names, or null if you want to set the list
                later with [gtk.scale_button.ScaleButton.setIcons]
    Returns:     a new #GtkScaleButton
  */
  this(gtk.types.IconSize size, double min, double max, double step, string[] icons = null)
  {
    GtkWidget* _cretval;
    char*[] _tmpicons;
    foreach (s; icons)
      _tmpicons ~= s.toCString(No.alloc);
    _tmpicons ~= null;
    const(char*)* _icons = _tmpicons.ptr;
    _cretval = gtk_scale_button_new(size, min, max, step, _icons);
    this(_cretval, No.take);
  }

  /**
      Gets the #GtkAdjustment associated with the #GtkScaleButton’s scale.
    See [gtk.range.Range.getAdjustment] for details.
    Returns:     the adjustment associated with the scale
  */
  gtk.adjustment.Adjustment getAdjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scale_button_get_adjustment(cast(GtkScaleButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.take);
    return _retval;
  }

  /**
      Retrieves the minus button of the #GtkScaleButton.
    Returns:     the minus button of the #GtkScaleButton as a #GtkButton
  */
  gtk.button.Button getMinusButton()
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_button_get_minus_button(cast(GtkScaleButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.button.Button)(cast(GtkWidget*)_cretval, No.take);
    return _retval;
  }

  /**
      Retrieves the plus button of the #GtkScaleButton.
    Returns:     the plus button of the #GtkScaleButton as a #GtkButton
  */
  gtk.button.Button getPlusButton()
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_button_get_plus_button(cast(GtkScaleButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.button.Button)(cast(GtkWidget*)_cretval, No.take);
    return _retval;
  }

  /**
      Retrieves the popup of the #GtkScaleButton.
    Returns:     the popup of the #GtkScaleButton
  */
  gtk.widget.Widget getPopup()
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_button_get_popup(cast(GtkScaleButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.take);
    return _retval;
  }

  /**
      Gets the current value of the scale button.
    Returns:     current value of the scale button
  */
  double getValue()
  {
    double _retval;
    _retval = gtk_scale_button_get_value(cast(GtkScaleButton*)cPtr);
    return _retval;
  }

  /**
      Sets the #GtkAdjustment to be used as a model
    for the #GtkScaleButton’s scale.
    See [gtk.range.Range.setAdjustment] for details.
    Params:
      adjustment =       a #GtkAdjustment
  */
  void setAdjustment(gtk.adjustment.Adjustment adjustment)
  {
    gtk_scale_button_set_adjustment(cast(GtkScaleButton*)cPtr, adjustment ? cast(GtkAdjustment*)adjustment.cPtr(No.dup) : null);
  }

  /**
      Sets the icons to be used by the scale button.
    For details, see the #GtkScaleButton:icons property.
    Params:
      icons =       a null-terminated array of icon names
  */
  void setIcons(string[] icons)
  {
    char*[] _tmpicons;
    foreach (s; icons)
      _tmpicons ~= s.toCString(No.alloc);
    _tmpicons ~= null;
    const(char*)* _icons = _tmpicons.ptr;
    gtk_scale_button_set_icons(cast(GtkScaleButton*)cPtr, _icons);
  }

  /**
      Sets the current value of the scale; if the value is outside
    the minimum or maximum range values, it will be clamped to fit
    inside them. The scale button emits the #GtkScaleButton::value-changed
    signal if the value changes.
    Params:
      value =       new value of the scale button
  */
  void setValue(double value)
  {
    gtk_scale_button_set_value(cast(GtkScaleButton*)cPtr, value);
  }

  /**
      The ::popdown signal is a
    [keybinding signal][GtkBindingSignal]
    which gets emitted to popdown the scale widget.
    
    The default binding for this signal is Escape.
  
    ## Parameters
    $(LIST
      * $(B scaleButton) the instance the signal is connected to
    )
  */
  alias PopdownCallbackDlg = void delegate(gtk.scale_button.ScaleButton scaleButton);

  /** ditto */
  alias PopdownCallbackFunc = void function(gtk.scale_button.ScaleButton scaleButton);

  /**
    Connect to Popdown signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectPopdown(T)(T callback, Flag!"after" after = No.after)
  if (is(T : PopdownCallbackDlg) || is(T : PopdownCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto scaleButton = getVal!(gtk.scale_button.ScaleButton)(_paramVals);
      _dClosure.dlg(scaleButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("popdown", closure, after);
  }

  /**
      The ::popup signal is a
    [keybinding signal][GtkBindingSignal]
    which gets emitted to popup the scale widget.
    
    The default bindings for this signal are Space, Enter and Return.
  
    ## Parameters
    $(LIST
      * $(B scaleButton) the instance the signal is connected to
    )
  */
  alias PopupCallbackDlg = void delegate(gtk.scale_button.ScaleButton scaleButton);

  /** ditto */
  alias PopupCallbackFunc = void function(gtk.scale_button.ScaleButton scaleButton);

  /**
    Connect to Popup signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectPopup(T)(T callback, Flag!"after" after = No.after)
  if (is(T : PopupCallbackDlg) || is(T : PopupCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto scaleButton = getVal!(gtk.scale_button.ScaleButton)(_paramVals);
      _dClosure.dlg(scaleButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("popup", closure, after);
  }

  /**
      The ::value-changed signal is emitted when the value field has
    changed.
  
    ## Parameters
    $(LIST
      * $(B value)       the new value
      * $(B scaleButton) the instance the signal is connected to
    )
  */
  alias ValueChangedCallbackDlg = void delegate(double value, gtk.scale_button.ScaleButton scaleButton);

  /** ditto */
  alias ValueChangedCallbackFunc = void function(double value, gtk.scale_button.ScaleButton scaleButton);

  /**
    Connect to ValueChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectValueChanged(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ValueChangedCallbackDlg) || is(T : ValueChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto scaleButton = getVal!(gtk.scale_button.ScaleButton)(_paramVals);
      auto value = getVal!(double)(&_paramVals[1]);
      _dClosure.dlg(value, scaleButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("value-changed", closure, after);
  }
}
