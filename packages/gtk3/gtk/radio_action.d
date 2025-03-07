module gtk.radio_action;

import gid.gid;
import gobject.dclosure;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.toggle_action;
import gtk.types;

/**
    A #GtkRadioAction is similar to #GtkRadioMenuItem. A number of radio
  actions can be linked together so that only one may be active at any
  one time.
*/
class RadioAction : gtk.toggle_action.ToggleAction
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_radio_action_get_type != &gidSymbolNotFound ? gtk_radio_action_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new #GtkRadioAction object. To add the action to
    a #GtkActionGroup and set the accelerator for the action,
    call [gtk.action_group.ActionGroup.addActionWithAccel].
    Params:
      name =       A unique name for the action
      label =       The label displayed in menu items and on buttons,
          or null
      tooltip =       A tooltip for this action, or null
      stockId =       The stock icon to display in widgets representing
          this action, or null
      value =       The value which [gtk.radio_action.RadioAction.getCurrentValue] should
          return if this action is selected.
    Returns:     a new #GtkRadioAction
  */
  this(string name, string label, string tooltip, string stockId, int value)
  {
    GtkRadioAction* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _label = label.toCString(No.Alloc);
    const(char)* _tooltip = tooltip.toCString(No.Alloc);
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_radio_action_new(_name, _label, _tooltip, _stockId, value);
    this(_cretval, Yes.Take);
  }

  /**
      Obtains the value property of the currently active member of
    the group to which action belongs.
    Returns:     The value of the currently active group member
  */
  int getCurrentValue()
  {
    int _retval;
    _retval = gtk_radio_action_get_current_value(cast(GtkRadioAction*)cPtr);
    return _retval;
  }

  /**
      Returns the list representing the radio group for this object.
    Note that the returned list is only valid until the next change
    to the group.
    
    A common way to set up a group of radio group is the following:
    ```c
      GSList *group = NULL;
      GtkRadioAction *action;
     
      while ( ...more actions to add... /)
        {
           action = gtk_radio_action_new (...);
           
           gtk_radio_action_set_group (action, group);
           group = gtk_radio_action_get_group (action);
        }
    ```
    Returns:     the list representing the radio group for this object
  */
  gtk.radio_action.RadioAction[] getGroup()
  {
    GSList* _cretval;
    _cretval = gtk_radio_action_get_group(cast(GtkRadioAction*)cPtr);
    auto _retval = gSListToD!(gtk.radio_action.RadioAction, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Joins a radio action object to the group of another radio action object.
    
    Use this in language bindings instead of the [gtk.radio_action.RadioAction.getGroup]
    and [gtk.radio_action.RadioAction.setGroup] methods
    
    A common way to set up a group of radio actions is the following:
    ```c
      GtkRadioAction *action;
      GtkRadioAction *last_action;
     
      while ( ...more actions to add... /)
        {
           action = gtk_radio_action_new (...);
           
           gtk_radio_action_join_group (action, last_action);
           last_action = action;
        }
    ```
    Params:
      groupSource =       a radio action object whos group we are
          joining, or null to remove the radio action from its group
  */
  void joinGroup(gtk.radio_action.RadioAction groupSource = null)
  {
    gtk_radio_action_join_group(cast(GtkRadioAction*)cPtr, groupSource ? cast(GtkRadioAction*)groupSource.cPtr(No.Dup) : null);
  }

  /**
      Sets the currently active group member to the member with value
    property current_value.
    Params:
      currentValue =       the new value
  */
  void setCurrentValue(int currentValue)
  {
    gtk_radio_action_set_current_value(cast(GtkRadioAction*)cPtr, currentValue);
  }

  /**
      Sets the radio group for the radio action object.
    Params:
      group =       a list representing a radio group, or null
  */
  void setGroup(gtk.radio_action.RadioAction[] group = null)
  {
    auto _group = gSListFromD!(gtk.radio_action.RadioAction)(group);
    scope(exit) containerFree!(GSList*, gtk.radio_action.RadioAction, GidOwnership.None)(_group);
    gtk_radio_action_set_group(cast(GtkRadioAction*)cPtr, _group);
  }

  /**
      The ::changed signal is emitted on every member of a radio group when the
    active member is changed. The signal gets emitted after the ::activate signals
    for the previous and current active members.
  
    ## Parameters
    $(LIST
      * $(B current)       the member of action's group which has just been activated
      * $(B radioAction) the instance the signal is connected to
    )
  */
  alias ChangedCallbackDlg = void delegate(gtk.radio_action.RadioAction current, gtk.radio_action.RadioAction radioAction);

  /** ditto */
  alias ChangedCallbackFunc = void function(gtk.radio_action.RadioAction current, gtk.radio_action.RadioAction radioAction);

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
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto radioAction = getVal!(gtk.radio_action.RadioAction)(_paramVals);
      auto current = getVal!(gtk.radio_action.RadioAction)(&_paramVals[1]);
      _dClosure.dlg(current, radioAction);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}
