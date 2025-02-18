module Gio.ActionMapT;

public import Gio.ActionMapIfaceProxy;
public import GObject.ObjectG;
public import Gid.gid;
public import Gio.Action;
public import Gio.ActionT;
public import Gio.Types;
public import Gio.c.functions;
public import Gio.c.types;

/**
 * `GActionMap` is an interface for action containers.
 * The `GActionMap` interface is implemented by [Gio.ActionGroup]
 * implementations that operate by containing a number of named
 * [Gio.Action] instances, such as [Gio.SimpleActionGroup].
 * One useful application of this interface is to map the
 * names of actions from various action groups to unique,
 * prefixed names $(LPAREN)e.g. by prepending "app." or "win."$(RPAREN).
 * This is the motivation for the 'Map' part of the interface
 * name.
 */
template ActionMapT()
{

  /**
   * Adds an action to the action_map.
   * If the action map already contains an action with the same name
   * as action then the old action is dropped from the action map.
   * The action map takes its own reference on action.
   * Params:
   *   action = a #GAction
   */
  override void addAction(Action action)
  {
    g_action_map_add_action(cast(GActionMap*)cPtr, action ? cast(GAction*)(cast(ObjectG)action).cPtr(No.Dup) : null);
  }

  /**
   * Looks up the action with the name action_name in action_map.
   * If no such action exists, returns %NULL.
   * Params:
   *   actionName = the name of an action
   * Returns: a #GAction, or %NULL
   */
  override Action lookupAction(string actionName)
  {
    GAction* _cretval;
    const(char)* _actionName = actionName.toCString(No.Alloc);
    _cretval = g_action_map_lookup_action(cast(GActionMap*)cPtr, _actionName);
    auto _retval = ObjectG.getDObject!Action(cast(GAction*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Removes the named action from the action map.
   * If no action of this name is in the map then nothing happens.
   * Params:
   *   actionName = the name of the action
   */
  override void removeAction(string actionName)
  {
    const(char)* _actionName = actionName.toCString(No.Alloc);
    g_action_map_remove_action(cast(GActionMap*)cPtr, _actionName);
  }
}
