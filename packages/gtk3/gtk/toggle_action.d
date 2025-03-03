module gtk.toggle_action;

import gid.gid;
import gobject.dclosure;
import gtk.action;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * A #GtkToggleAction corresponds roughly to a #GtkCheckMenuItem. It has an
 * “active” state specifying whether the action has been checked or not.
 */
class ToggleAction : gtk.action.Action
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_toggle_action_get_type != &gidSymbolNotFound ? gtk_toggle_action_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new #GtkToggleAction object. To add the action to
   * a #GtkActionGroup and set the accelerator for the action,
   * call [gtk.action_group.ActionGroup.addActionWithAccel].
   * Params:
   *   name = A unique name for the action
   *   label = The label displayed in menu items and on buttons,
   *     or %NULL
   *   tooltip = A tooltip for the action, or %NULL
   *   stockId = The stock icon to display in widgets representing
   *     the action, or %NULL
   * Returns: a new #GtkToggleAction
   */
  this(string name, string label, string tooltip, string stockId)
  {
    GtkToggleAction* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _label = label.toCString(No.Alloc);
    const(char)* _tooltip = tooltip.toCString(No.Alloc);
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_toggle_action_new(_name, _label, _tooltip, _stockId);
    this(_cretval, Yes.Take);
  }

  /**
   * Returns the checked state of the toggle action.
   * Returns: the checked state of the toggle action
   */
  bool getActive()
  {
    bool _retval;
    _retval = gtk_toggle_action_get_active(cast(GtkToggleAction*)cPtr);
    return _retval;
  }

  /**
   * Returns whether the action should have proxies like a radio action.
   * Returns: whether the action should have proxies like a radio action.
   */
  bool getDrawAsRadio()
  {
    bool _retval;
    _retval = gtk_toggle_action_get_draw_as_radio(cast(GtkToggleAction*)cPtr);
    return _retval;
  }

  /**
   * Sets the checked state on the toggle action.
   * Params:
   *   isActive = whether the action should be checked or not
   */
  void setActive(bool isActive)
  {
    gtk_toggle_action_set_active(cast(GtkToggleAction*)cPtr, isActive);
  }

  /**
   * Sets whether the action should have proxies like a radio action.
   * Params:
   *   drawAsRadio = whether the action should have proxies like a radio
   *     action
   */
  void setDrawAsRadio(bool drawAsRadio)
  {
    gtk_toggle_action_set_draw_as_radio(cast(GtkToggleAction*)cPtr, drawAsRadio);
  }

  /**
   * Emits the “toggled” signal on the toggle action.
   */
  void toggled()
  {
    gtk_toggle_action_toggled(cast(GtkToggleAction*)cPtr);
  }

  /**
   * Should be connected if you wish to perform an action
   * whenever the #GtkToggleAction state is changed.
   *   toggleAction = the instance the signal is connected to
   */
  alias ToggledCallbackDlg = void delegate(gtk.toggle_action.ToggleAction toggleAction);
  alias ToggledCallbackFunc = void function(gtk.toggle_action.ToggleAction toggleAction);

  /**
   * Connect to Toggled signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectToggled(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ToggledCallbackDlg) || is(T : ToggledCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto toggleAction = getVal!(gtk.toggle_action.ToggleAction)(_paramVals);
      _dClosure.dlg(toggleAction);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggled", closure, after);
  }
}
