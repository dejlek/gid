module gtk.adjustment;

import gid.gid;
import gobject.dclosure;
import gobject.initially_unowned;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    The #GtkAdjustment object represents a value which has an associated lower
  and upper bound, together with step and page increments, and a page size.
  It is used within several GTK+ widgets, including #GtkSpinButton, #GtkViewport,
  and #GtkRange (which is a base class for #GtkScrollbar and #GtkScale).
  
  The #GtkAdjustment object does not update the value itself. Instead
  it is left up to the owner of the #GtkAdjustment to control the value.
*/
class Adjustment : gobject.initially_unowned.InitiallyUnowned
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_adjustment_get_type != &gidSymbolNotFound ? gtk_adjustment_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Adjustment self()
  {
    return this;
  }

  /**
      Creates a new #GtkAdjustment.
    Params:
      value =       the initial value
      lower =       the minimum value
      upper =       the maximum value
      stepIncrement =       the step increment
      pageIncrement =       the page increment
      pageSize =       the page size
    Returns:     a new #GtkAdjustment
  */
  this(double value, double lower, double upper, double stepIncrement, double pageIncrement, double pageSize)
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_adjustment_new(value, lower, upper, stepIncrement, pageIncrement, pageSize);
    this(_cretval, No.Take);
  }

  /**
      Emits a #GtkAdjustment::changed signal from the #GtkAdjustment.
    This is typically called by the owner of the #GtkAdjustment after it has
    changed any of the #GtkAdjustment properties other than the value.
  
    Deprecated:     GTK+ emits #GtkAdjustment::changed itself whenever any
         of the properties (other than value) change
  */
  void changed()
  {
    gtk_adjustment_changed(cast(GtkAdjustment*)cPtr);
  }

  /**
      Updates the #GtkAdjustment:value property to ensure that the range
    between lower and upper is in the current page (i.e. between
    #GtkAdjustment:value and #GtkAdjustment:value + #GtkAdjustment:page-size).
    If the range is larger than the page size, then only the start of it will
    be in the current page.
    
    A #GtkAdjustment::value-changed signal will be emitted if the value is changed.
    Params:
      lower =       the lower value
      upper =       the upper value
  */
  void clampPage(double lower, double upper)
  {
    gtk_adjustment_clamp_page(cast(GtkAdjustment*)cPtr, lower, upper);
  }

  /**
      Sets all properties of the adjustment at once.
    
    Use this function to avoid multiple emissions of the
    #GtkAdjustment::changed signal. See [gtk.adjustment.Adjustment.setLower]
    for an alternative way of compressing multiple emissions of
    #GtkAdjustment::changed into one.
    Params:
      value =       the new value
      lower =       the new minimum value
      upper =       the new maximum value
      stepIncrement =       the new step increment
      pageIncrement =       the new page increment
      pageSize =       the new page size
  */
  void configure(double value, double lower, double upper, double stepIncrement, double pageIncrement, double pageSize)
  {
    gtk_adjustment_configure(cast(GtkAdjustment*)cPtr, value, lower, upper, stepIncrement, pageIncrement, pageSize);
  }

  /**
      Retrieves the minimum value of the adjustment.
    Returns:     The current minimum value of the adjustment
  */
  double getLower()
  {
    double _retval;
    _retval = gtk_adjustment_get_lower(cast(GtkAdjustment*)cPtr);
    return _retval;
  }

  /**
      Gets the smaller of step increment and page increment.
    Returns:     the minimum increment of adjustment
  */
  double getMinimumIncrement()
  {
    double _retval;
    _retval = gtk_adjustment_get_minimum_increment(cast(GtkAdjustment*)cPtr);
    return _retval;
  }

  /**
      Retrieves the page increment of the adjustment.
    Returns:     The current page increment of the adjustment
  */
  double getPageIncrement()
  {
    double _retval;
    _retval = gtk_adjustment_get_page_increment(cast(GtkAdjustment*)cPtr);
    return _retval;
  }

  /**
      Retrieves the page size of the adjustment.
    Returns:     The current page size of the adjustment
  */
  double getPageSize()
  {
    double _retval;
    _retval = gtk_adjustment_get_page_size(cast(GtkAdjustment*)cPtr);
    return _retval;
  }

  /**
      Retrieves the step increment of the adjustment.
    Returns:     The current step increment of the adjustment.
  */
  double getStepIncrement()
  {
    double _retval;
    _retval = gtk_adjustment_get_step_increment(cast(GtkAdjustment*)cPtr);
    return _retval;
  }

  /**
      Retrieves the maximum value of the adjustment.
    Returns:     The current maximum value of the adjustment
  */
  double getUpper()
  {
    double _retval;
    _retval = gtk_adjustment_get_upper(cast(GtkAdjustment*)cPtr);
    return _retval;
  }

  /**
      Gets the current value of the adjustment.
    See [gtk.adjustment.Adjustment.setValue].
    Returns:     The current value of the adjustment
  */
  double getValue()
  {
    double _retval;
    _retval = gtk_adjustment_get_value(cast(GtkAdjustment*)cPtr);
    return _retval;
  }

  /**
      Sets the minimum value of the adjustment.
    
    When setting multiple adjustment properties via their individual
    setters, multiple #GtkAdjustment::changed signals will be emitted.
    However, since the emission of the #GtkAdjustment::changed signal
    is tied to the emission of the #GObject::notify signals of the changed
    properties, it’s possible to compress the #GtkAdjustment::changed
    signals into one by calling [gobject.object.ObjectG.freezeNotify] and
    [gobject.object.ObjectG.thawNotify] around the calls to the individual setters.
    
    Alternatively, using a single [gobject.object.ObjectG.set] for all the properties
    to change, or using [gtk.adjustment.Adjustment.configure] has the same effect
    of compressing #GtkAdjustment::changed emissions.
    Params:
      lower =       the new minimum value
  */
  void setLower(double lower)
  {
    gtk_adjustment_set_lower(cast(GtkAdjustment*)cPtr, lower);
  }

  /**
      Sets the page increment of the adjustment.
    
    See [gtk.adjustment.Adjustment.setLower] about how to compress multiple
    emissions of the #GtkAdjustment::changed signal when setting
    multiple adjustment properties.
    Params:
      pageIncrement =       the new page increment
  */
  void setPageIncrement(double pageIncrement)
  {
    gtk_adjustment_set_page_increment(cast(GtkAdjustment*)cPtr, pageIncrement);
  }

  /**
      Sets the page size of the adjustment.
    
    See [gtk.adjustment.Adjustment.setLower] about how to compress multiple
    emissions of the GtkAdjustment::changed signal when setting
    multiple adjustment properties.
    Params:
      pageSize =       the new page size
  */
  void setPageSize(double pageSize)
  {
    gtk_adjustment_set_page_size(cast(GtkAdjustment*)cPtr, pageSize);
  }

  /**
      Sets the step increment of the adjustment.
    
    See [gtk.adjustment.Adjustment.setLower] about how to compress multiple
    emissions of the #GtkAdjustment::changed signal when setting
    multiple adjustment properties.
    Params:
      stepIncrement =       the new step increment
  */
  void setStepIncrement(double stepIncrement)
  {
    gtk_adjustment_set_step_increment(cast(GtkAdjustment*)cPtr, stepIncrement);
  }

  /**
      Sets the maximum value of the adjustment.
    
    Note that values will be restricted by `upper - page-size`
    if the page-size property is nonzero.
    
    See [gtk.adjustment.Adjustment.setLower] about how to compress multiple
    emissions of the #GtkAdjustment::changed signal when setting
    multiple adjustment properties.
    Params:
      upper =       the new maximum value
  */
  void setUpper(double upper)
  {
    gtk_adjustment_set_upper(cast(GtkAdjustment*)cPtr, upper);
  }

  /**
      Sets the #GtkAdjustment value. The value is clamped to lie between
    #GtkAdjustment:lower and #GtkAdjustment:upper.
    
    Note that for adjustments which are used in a #GtkScrollbar, the
    effective range of allowed values goes from #GtkAdjustment:lower to
    #GtkAdjustment:upper - #GtkAdjustment:page-size.
    Params:
      value =       the new value
  */
  void setValue(double value)
  {
    gtk_adjustment_set_value(cast(GtkAdjustment*)cPtr, value);
  }

  /**
      Emits a #GtkAdjustment::value-changed signal from the #GtkAdjustment.
    This is typically called by the owner of the #GtkAdjustment after it has
    changed the #GtkAdjustment:value property.
  
    Deprecated:     GTK+ emits #GtkAdjustment::value-changed itself whenever
         the value changes
  */
  void valueChanged()
  {
    gtk_adjustment_value_changed(cast(GtkAdjustment*)cPtr);
  }

  /**
      Emitted when one or more of the #GtkAdjustment properties have been
    changed, other than the #GtkAdjustment:value property.
  
    ## Parameters
    $(LIST
      * $(B adjustment) the instance the signal is connected to
    )
  */
  alias ChangedCallbackDlg = void delegate(gtk.adjustment.Adjustment adjustment);

  /** ditto */
  alias ChangedCallbackFunc = void function(gtk.adjustment.Adjustment adjustment);

  /**
    Connect to Changed signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChangedCallbackDlg) || is(T : ChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto adjustment = getVal!(gtk.adjustment.Adjustment)(_paramVals);
      _dClosure.dlg(adjustment);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Emitted when the #GtkAdjustment:value property has been changed.
  
    ## Parameters
    $(LIST
      * $(B adjustment) the instance the signal is connected to
    )
  */
  alias ValueChangedCallbackDlg = void delegate(gtk.adjustment.Adjustment adjustment);

  /** ditto */
  alias ValueChangedCallbackFunc = void function(gtk.adjustment.Adjustment adjustment);

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
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto adjustment = getVal!(gtk.adjustment.Adjustment)(_paramVals);
      _dClosure.dlg(adjustment);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("value-changed", closure, after);
  }
}
