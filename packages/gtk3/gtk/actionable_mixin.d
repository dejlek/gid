module gtk.actionable_mixin;

public import gtk.actionable_iface_proxy;
public import gid.gid;
public import glib.variant;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    This interface provides a convenient way of associating widgets with
  actions on a #GtkApplicationWindow or #GtkApplication.
  
  It primarily consists of two properties: #GtkActionable:action-name
  and #GtkActionable:action-target. There are also some convenience APIs
  for setting these properties.
  
  The action will be looked up in action groups that are found among
  the widgets ancestors. Most commonly, these will be the actions with
  the “win.” or “app.” prefix that are associated with the #GtkApplicationWindow
  or #GtkApplication, but other action groups that are added with
  [gtk.widget.Widget.insertActionGroup] will be consulted as well.
*/
template ActionableT()
{

  /**
      Gets the action name for actionable.
    
    See [gtk.actionable.Actionable.setActionName] for more information.
    Returns:     the action name, or null if none is set
  */
  override string getActionName()
  {
    const(char)* _cretval;
    _cretval = gtk_actionable_get_action_name(cast(GtkActionable*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the current target value of actionable.
    
    See [gtk.actionable.Actionable.setActionTargetValue] for more information.
    Returns:     the current target value
  */
  override glib.variant.VariantG getActionTargetValue()
  {
    VariantC* _cretval;
    _cretval = gtk_actionable_get_action_target_value(cast(GtkActionable*)cPtr);
    auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Specifies the name of the action with which this widget should be
    associated.  If action_name is null then the widget will be
    unassociated from any previous action.
    
    Usually this function is used when the widget is located (or will be
    located) within the hierarchy of a #GtkApplicationWindow.
    
    Names are of the form “win.save” or “app.quit” for actions on the
    containing #GtkApplicationWindow or its associated #GtkApplication,
    respectively.  This is the same form used for actions in the #GMenu
    associated with the window.
    Params:
      actionName =       an action name, or null
  */
  override void setActionName(string actionName = null)
  {
    const(char)* _actionName = actionName.toCString(No.Alloc);
    gtk_actionable_set_action_name(cast(GtkActionable*)cPtr, _actionName);
  }

  /**
      Sets the target value of an actionable widget.
    
    If target_value is null then the target value is unset.
    
    The target value has two purposes.  First, it is used as the
    parameter to activation of the action associated with the
    #GtkActionable widget. Second, it is used to determine if the widget
    should be rendered as “active” — the widget is active if the state
    is equal to the given target.
    
    Consider the example of associating a set of buttons with a #GAction
    with string state in a typical “radio button” situation.  Each button
    will be associated with the same action, but with a different target
    value for that action.  Clicking on a particular button will activate
    the action with the target of that button, which will typically cause
    the action’s state to change to that value.  Since the action’s state
    is now equal to the target value of the button, the button will now
    be rendered as active (and the other buttons, with different targets,
    rendered inactive).
    Params:
      targetValue =       a #GVariant to set as the target value, or null
  */
  override void setActionTargetValue(glib.variant.VariantG targetValue = null)
  {
    gtk_actionable_set_action_target_value(cast(GtkActionable*)cPtr, targetValue ? cast(VariantC*)targetValue.cPtr(No.Dup) : null);
  }

  /**
      Sets the action-name and associated string target value of an
    actionable widget.
    
    detailed_action_name is a string in the format accepted by
    [gio.action.Action.parseDetailedName].
    
    (Note that prior to version 3.22.25,
    this function is only usable for actions with a simple "s" target, and
    detailed_action_name must be of the form `"action::target"` where
    `action` is the action name and `target` is the string to use
    as the target.)
    Params:
      detailedActionName =       the detailed action name
  */
  override void setDetailedActionName(string detailedActionName)
  {
    const(char)* _detailedActionName = detailedActionName.toCString(No.Alloc);
    gtk_actionable_set_detailed_action_name(cast(GtkActionable*)cPtr, _detailedActionName);
  }
}
