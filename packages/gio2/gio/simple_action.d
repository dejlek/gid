module gio.simple_action;

import gid.gid;
import gio.action;
import gio.action_mixin;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.variant;
import glib.variant_type;
import gobject.dclosure;
import gobject.object;

/**
    A [gio.simple_action.SimpleAction] is the obvious simple implementation of the
  [gio.action.Action] interface. This is the easiest way to create an action for
  purposes of adding it to a [gio.simple_action_group.SimpleActionGroup].
*/
class SimpleAction : gobject.object.ObjectG, gio.action.Action
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_simple_action_get_type != &gidSymbolNotFound ? g_simple_action_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin ActionT!();

  /**
      Creates a new action.
    
    The created action is stateless. See [gio.simple_action.SimpleAction.newStateful] to create
    an action that has state.
    Params:
      name =       the name of the action
      parameterType =       the type of parameter that will be passed to
          handlers for the #GSimpleAction::activate signal, or null for no parameter
    Returns:     a new #GSimpleAction
  */
  this(string name, glib.variant_type.VariantType parameterType = null)
  {
    GSimpleAction* _cretval;
    const(char)* _name = name.toCString(No.alloc);
    _cretval = g_simple_action_new(_name, parameterType ? cast(const(GVariantType)*)parameterType.cPtr(No.dup) : null);
    this(_cretval, Yes.take);
  }

  /**
      Creates a new stateful action.
    
    All future state values must have the same #GVariantType as the initial
    state.
    
    If the state #GVariant is floating, it is consumed.
    Params:
      name =       the name of the action
      parameterType =       the type of the parameter that will be passed to
          handlers for the #GSimpleAction::activate signal, or null for no parameter
      state =       the initial state of the action
    Returns:     a new #GSimpleAction
  */
  static gio.simple_action.SimpleAction newStateful(string name, glib.variant_type.VariantType parameterType, glib.variant.VariantG state)
  {
    GSimpleAction* _cretval;
    const(char)* _name = name.toCString(No.alloc);
    _cretval = g_simple_action_new_stateful(_name, parameterType ? cast(const(GVariantType)*)parameterType.cPtr(No.dup) : null, state ? cast(VariantC*)state.cPtr(No.dup) : null);
    auto _retval = ObjectG.getDObject!(gio.simple_action.SimpleAction)(cast(GSimpleAction*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Sets the action as enabled or not.
    
    An action must be enabled in order to be activated or in order to
    have its state changed from outside callers.
    
    This should only be called by the implementor of the action.  Users
    of the action should not attempt to modify its enabled flag.
    Params:
      enabled =       whether the action is enabled
  */
  void setEnabled(bool enabled)
  {
    g_simple_action_set_enabled(cast(GSimpleAction*)cPtr, enabled);
  }

  /**
      Sets the state of the action.
    
    This directly updates the 'state' property to the given value.
    
    This should only be called by the implementor of the action.  Users
    of the action should not attempt to directly modify the 'state'
    property.  Instead, they should call [gio.action.Action.changeState] to
    request the change.
    
    If the value GVariant is floating, it is consumed.
    Params:
      value =       the new #GVariant for the state
  */
  void setState(glib.variant.VariantG value)
  {
    g_simple_action_set_state(cast(GSimpleAction*)cPtr, value ? cast(VariantC*)value.cPtr(No.dup) : null);
  }

  /**
      Sets the state hint for the action.
    
    See [gio.action.Action.getStateHint] for more information about
    action state hints.
    Params:
      stateHint =       a #GVariant representing the state hint
  */
  void setStateHint(glib.variant.VariantG stateHint = null)
  {
    g_simple_action_set_state_hint(cast(GSimpleAction*)cPtr, stateHint ? cast(VariantC*)stateHint.cPtr(No.dup) : null);
  }

  /**
      Indicates that the action was just activated.
    
    parameter will always be of the expected type, i.e. the parameter type
    specified when the action was created. If an incorrect type is given when
    activating the action, this signal is not emitted.
    
    Since GLib 2.40, if no handler is connected to this signal then the
    default behaviour for boolean-stated actions with a null parameter
    type is to toggle them via the #GSimpleAction::change-state signal.
    For stateful actions where the state type is equal to the parameter
    type, the default is to forward them directly to
    #GSimpleAction::change-state.  This should allow almost all users
    of #GSimpleAction to connect only one handler or the other.
  
    ## Parameters
    $(LIST
      * $(B parameter)       the parameter to the activation, or null if it has
          no parameter
      * $(B simpleAction) the instance the signal is connected to
    )
  */
  alias ActivateCallbackDlg = void delegate(glib.variant.VariantG parameter, gio.simple_action.SimpleAction simpleAction);

  /** ditto */
  alias ActivateCallbackFunc = void function(glib.variant.VariantG parameter, gio.simple_action.SimpleAction simpleAction);

  /**
    Connect to Activate signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto simpleAction = getVal!(gio.simple_action.SimpleAction)(_paramVals);
      auto parameter = getVal!(glib.variant.VariantG)(&_paramVals[1]);
      _dClosure.dlg(parameter, simpleAction);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Indicates that the action just received a request to change its
    state.
    
    value will always be of the correct state type, i.e. the type of the
    initial state passed to [gio.simple_action.SimpleAction.newStateful]. If an incorrect
    type is given when requesting to change the state, this signal is not
    emitted.
    
    If no handler is connected to this signal then the default
    behaviour is to call [gio.simple_action.SimpleAction.setState] to set the state
    to the requested value. If you connect a signal handler then no
    default action is taken. If the state should change then you must
    call [gio.simple_action.SimpleAction.setState] from the handler.
    
    An example of a 'change-state' handler:
    ```c
    static void
    change_volume_state (GSimpleAction *action,
                         GVariant      *value,
                         gpointer       user_data)
    {
      gint requested;
    
      requested = g_variant_get_int32 (value);
    
      // Volume only goes from 0 to 10
      if (0 <= requested && requested <= 10)
        g_simple_action_set_state (action, value);
    }
    ```
    
    The handler need not set the state to the requested value.
    It could set it to any value at all, or take some other action.
  
    ## Parameters
    $(LIST
      * $(B value)       the requested value for the state
      * $(B simpleAction) the instance the signal is connected to
    )
  */
  alias ChangeStateCallbackDlg = void delegate(glib.variant.VariantG value, gio.simple_action.SimpleAction simpleAction);

  /** ditto */
  alias ChangeStateCallbackFunc = void function(glib.variant.VariantG value, gio.simple_action.SimpleAction simpleAction);

  /**
    Connect to ChangeState signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectChangeState(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ChangeStateCallbackDlg) || is(T : ChangeStateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto simpleAction = getVal!(gio.simple_action.SimpleAction)(_paramVals);
      auto value = getVal!(glib.variant.VariantG)(&_paramVals[1]);
      _dClosure.dlg(value, simpleAction);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("change-state", closure, after);
  }
}
