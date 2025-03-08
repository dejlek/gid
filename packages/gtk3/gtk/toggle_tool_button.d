module gtk.toggle_tool_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.tool_button;
import gtk.types;

/**
    A #GtkToggleToolButton is a #GtkToolItem that contains a toggle
  button.
  
  Use [gtk.toggle_tool_button.ToggleToolButton.new_] to create a new GtkToggleToolButton.
  
  # CSS nodes
  
  GtkToggleToolButton has a single CSS node with name togglebutton.
*/
class ToggleToolButton : gtk.tool_button.ToolButton
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_toggle_tool_button_get_type != &gidSymbolNotFound ? gtk_toggle_tool_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Returns a new #GtkToggleToolButton
    Returns:     a newly created #GtkToggleToolButton
  */
  this()
  {
    GtkToolItem* _cretval;
    _cretval = gtk_toggle_tool_button_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkToggleToolButton containing the image and text from a
    stock item. Some stock ids have preprocessor macros like #GTK_STOCK_OK
    and #GTK_STOCK_APPLY.
    
    It is an error if stock_id is not a name of a stock item.
    Params:
      stockId =       the name of the stock item
    Returns:     A new #GtkToggleToolButton
  
    Deprecated:     Use [gtk.toggle_tool_button.ToggleToolButton.new_] instead.
  */
  static gtk.toggle_tool_button.ToggleToolButton newFromStock(string stockId)
  {
    GtkToolItem* _cretval;
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_toggle_tool_button_new_from_stock(_stockId);
    auto _retval = ObjectG.getDObject!(gtk.toggle_tool_button.ToggleToolButton)(cast(GtkToolItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Queries a #GtkToggleToolButton and returns its current state.
    Returns true if the toggle button is pressed in and false if it is raised.
    Returns:     true if the toggle tool button is pressed in, false if not
  */
  bool getActive()
  {
    bool _retval;
    _retval = gtk_toggle_tool_button_get_active(cast(GtkToggleToolButton*)cPtr);
    return _retval;
  }

  /**
      Sets the status of the toggle tool button. Set to true if you
    want the GtkToggleButton to be “pressed in”, and false to raise it.
    This action causes the toggled signal to be emitted.
    Params:
      isActive =       whether button should be active
  */
  void setActive(bool isActive)
  {
    gtk_toggle_tool_button_set_active(cast(GtkToggleToolButton*)cPtr, isActive);
  }

  /**
      Emitted whenever the toggle tool button changes state.
  
    ## Parameters
    $(LIST
      * $(B toggleToolButton) the instance the signal is connected to
    )
  */
  alias ToggledCallbackDlg = void delegate(gtk.toggle_tool_button.ToggleToolButton toggleToolButton);

  /** ditto */
  alias ToggledCallbackFunc = void function(gtk.toggle_tool_button.ToggleToolButton toggleToolButton);

  /**
    Connect to Toggled signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectToggled(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ToggledCallbackDlg) || is(T : ToggledCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto toggleToolButton = getVal!(gtk.toggle_tool_button.ToggleToolButton)(_paramVals);
      _dClosure.dlg(toggleToolButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggled", closure, after);
  }
}
