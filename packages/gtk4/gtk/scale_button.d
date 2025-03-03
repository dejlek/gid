module gtk.scale_button;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.accessible_range;
import gtk.accessible_range_mixin;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
 * `GtkScaleButton` provides a button which pops up a scale widget.
 * This kind of widget is commonly used for volume controls in multimedia
 * applications, and GTK provides a [gtk.volume_button.VolumeButton] subclass that
 * is tailored for this use case.
 * # CSS nodes
 * ```
 * scalebutton.scale
 * ╰── button.toggle
 * ╰── <icon>
 * ```
 * `GtkScaleButton` has a single CSS node with name scalebutton and `.scale`
 * style class, and contains a `button` node with a `.toggle` style class.
 */
class ScaleButton : gtk.widget.Widget, gtk.accessible_range.AccessibleRange, gtk.orientable.Orientable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_scale_button_get_type != &gidSymbolNotFound ? gtk_scale_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin AccessibleRangeT!();
  mixin OrientableT!();

  /**
   * Creates a `GtkScaleButton`.
   * The new scale button has a range between min and max,
   * with a stepping of step.
   * Params:
   *   min = the minimum value of the scale $(LPAREN)usually 0$(RPAREN)
   *   max = the maximum value of the scale $(LPAREN)usually 100$(RPAREN)
   *   step = the stepping of value when a scroll-wheel event,
   *     or up/down arrow event occurs $(LPAREN)usually 2$(RPAREN)
   *   icons = a %NULL-terminated
   *     array of icon names, or %NULL if you want to set the list
   *     later with [gtk.scale_button.ScaleButton.setIcons]
   * Returns: a new `GtkScaleButton`
   */
  this(double min, double max, double step, string[] icons)
  {
    GtkWidget* _cretval;
    char*[] _tmpicons;
    foreach (s; icons)
      _tmpicons ~= s.toCString(No.Alloc);
    _tmpicons ~= null;
    const(char*)* _icons = _tmpicons.ptr;
    _cretval = gtk_scale_button_new(min, max, step, _icons);
    this(_cretval, No.Take);
  }

  /**
   * Queries a `GtkScaleButton` and returns its current state.
   * Returns %TRUE if the scale button is pressed in and %FALSE
   * if it is raised.
   * Returns: whether the button is pressed
   */
  bool getActive()
  {
    bool _retval;
    _retval = gtk_scale_button_get_active(cast(GtkScaleButton*)cPtr);
    return _retval;
  }

  /**
   * Gets the `GtkAdjustment` associated with the `GtkScaleButton`’s scale.
   * See [gtk.range.Range.getAdjustment] for details.
   * Returns: the adjustment associated with the scale
   */
  gtk.adjustment.Adjustment getAdjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scale_button_get_adjustment(cast(GtkScaleButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns whether the button has a frame.
   * Returns: %TRUE if the button has a frame
   */
  bool getHasFrame()
  {
    bool _retval;
    _retval = gtk_scale_button_get_has_frame(cast(GtkScaleButton*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the minus button of the `GtkScaleButton`.
   * Returns: the minus button
   *   of the `GtkScaleButton`
   */
  gtk.button.Button getMinusButton()
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_button_get_minus_button(cast(GtkScaleButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Retrieves the plus button of the `GtkScaleButton.`
   * Returns: the plus button
   *   of the `GtkScaleButton`
   */
  gtk.button.Button getPlusButton()
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_button_get_plus_button(cast(GtkScaleButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Retrieves the popup of the `GtkScaleButton`.
   * Returns: the popup of the `GtkScaleButton`
   */
  gtk.widget.Widget getPopup()
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_button_get_popup(cast(GtkScaleButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the current value of the scale button.
   * Returns: current value of the scale button
   */
  double getValue()
  {
    double _retval;
    _retval = gtk_scale_button_get_value(cast(GtkScaleButton*)cPtr);
    return _retval;
  }

  /**
   * Sets the `GtkAdjustment` to be used as a model
   * for the `GtkScaleButton`’s scale.
   * See [gtk.range.Range.setAdjustment] for details.
   * Params:
   *   adjustment = a `GtkAdjustment`
   */
  void setAdjustment(gtk.adjustment.Adjustment adjustment)
  {
    gtk_scale_button_set_adjustment(cast(GtkScaleButton*)cPtr, adjustment ? cast(GtkAdjustment*)adjustment.cPtr(No.Dup) : null);
  }

  /**
   * Sets the style of the button.
   * Params:
   *   hasFrame = whether the button should have a visible frame
   */
  void setHasFrame(bool hasFrame)
  {
    gtk_scale_button_set_has_frame(cast(GtkScaleButton*)cPtr, hasFrame);
  }

  /**
   * Sets the icons to be used by the scale button.
   * Params:
   *   icons = a %NULL-terminated array of icon names
   */
  void setIcons(string[] icons)
  {
    char*[] _tmpicons;
    foreach (s; icons)
      _tmpicons ~= s.toCString(No.Alloc);
    _tmpicons ~= null;
    const(char*)* _icons = _tmpicons.ptr;
    gtk_scale_button_set_icons(cast(GtkScaleButton*)cPtr, _icons);
  }

  /**
   * Sets the current value of the scale.
   * If the value is outside the minimum or maximum range values,
   * it will be clamped to fit inside them.
   * The scale button emits the signalGtk.ScaleButton::value-changed
   * signal if the value changes.
   * Params:
   *   value = new value of the scale button
   */
  void setValue(double value)
  {
    gtk_scale_button_set_value(cast(GtkScaleButton*)cPtr, value);
  }

  /**
   * Emitted to dismiss the popup.
   * This is a [keybinding signal](class.SignalAction.html).
   * The default binding for this signal is <kbd>Escape</kbd>.
   *   scaleButton = the instance the signal is connected to
   */
  alias PopdownCallbackDlg = void delegate(gtk.scale_button.ScaleButton scaleButton);
  alias PopdownCallbackFunc = void function(gtk.scale_button.ScaleButton scaleButton);

  /**
   * Connect to Popdown signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectPopdown(T)(T callback, Flag!"After" after = No.After)
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
   * Emitted to popup the scale widget.
   * This is a [keybinding signal](class.SignalAction.html).
   * The default bindings for this signal are <kbd>Space</kbd>,
   * <kbd>Enter</kbd> and <kbd>Return</kbd>.
   *   scaleButton = the instance the signal is connected to
   */
  alias PopupCallbackDlg = void delegate(gtk.scale_button.ScaleButton scaleButton);
  alias PopupCallbackFunc = void function(gtk.scale_button.ScaleButton scaleButton);

  /**
   * Connect to Popup signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectPopup(T)(T callback, Flag!"After" after = No.After)
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
   * Emitted when the value field has changed.
   * Params
   *   value = the new value
   *   scaleButton = the instance the signal is connected to
   */
  alias ValueChangedCallbackDlg = void delegate(double value, gtk.scale_button.ScaleButton scaleButton);
  alias ValueChangedCallbackFunc = void function(double value, gtk.scale_button.ScaleButton scaleButton);

  /**
   * Connect to ValueChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectValueChanged(T)(T callback, Flag!"After" after = No.After)
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
