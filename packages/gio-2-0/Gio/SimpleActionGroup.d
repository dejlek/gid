module Gio.SimpleActionGroup;

import GObject.ObjectG;
import Gid.gid;
import Gio.Action;
import Gio.ActionEntry;
import Gio.ActionGroup;
import Gio.ActionGroupT;
import Gio.ActionMap;
import Gio.ActionMapT;
import Gio.ActionT;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * `GSimpleActionGroup` is a hash table filled with [Gio.Action] objects,
 * implementing the [Gio.ActionGroup] and [Gio.ActionMap]
 * interfaces.
 */
class SimpleActionGroup : ObjectG, ActionGroup, ActionMap
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return g_simple_action_group_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ActionGroupT!();
  mixin ActionMapT!();

  /**
   * Creates a new, empty, #GSimpleActionGroup.
   * Returns: a new #GSimpleActionGroup
   */
  this()
  {
    GSimpleActionGroup* _cretval;
    _cretval = g_simple_action_group_new();
    this(_cretval, Yes.Take);
  }

  /**
   * A convenience function for creating multiple #GSimpleAction instances
   * and adding them to the action group.
   * Params:
   *   entries = a pointer to the first item in
   *     an array of #GActionEntry structs
   *   userData = the user data for signal connections

   * Deprecated: Use [Gio.ActionMap.addActionEntries]
   */
  void addEntries(ActionEntry[] entries, void* userData)
  {
    int _nEntries;
    if (entries)
      _nEntries = cast(int)entries.length;

    GActionEntry[] _tmpentries;
    foreach (obj; entries)
      _tmpentries ~= obj.cInstance;
    const(GActionEntry)* _entries = _tmpentries.ptr;
    g_simple_action_group_add_entries(cast(GSimpleActionGroup*)cPtr, _entries, _nEntries, userData);
  }

  /**
   * Adds an action to the action group.
   * If the action group already contains an action with the same name as
   * action then the old action is dropped from the group.
   * The action group takes its own reference on action.
   * Params:
   *   action = a #GAction

   * Deprecated: Use [Gio.ActionMap.addAction]
   */
  void insert(Action action)
  {
    g_simple_action_group_insert(cast(GSimpleActionGroup*)cPtr, action ? cast(GAction*)(cast(ObjectG)action).cPtr(No.Dup) : null);
  }

  /**
   * Looks up the action with the name action_name in the group.
   * If no such action exists, returns %NULL.
   * Params:
   *   actionName = the name of an action
   * Returns: a #GAction, or %NULL

   * Deprecated: Use [Gio.ActionMap.lookupAction]
   */
  Action lookup(string actionName)
  {
    GAction* _cretval;
    const(char)* _actionName = actionName.toCString(No.Alloc);
    _cretval = g_simple_action_group_lookup(cast(GSimpleActionGroup*)cPtr, _actionName);
    auto _retval = ObjectG.getDObject!Action(cast(GAction*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Removes the named action from the action group.
   * If no action of this name is in the group then nothing happens.
   * Params:
   *   actionName = the name of the action

   * Deprecated: Use [Gio.ActionMap.removeAction]
   */
  void remove(string actionName)
  {
    const(char)* _actionName = actionName.toCString(No.Alloc);
    g_simple_action_group_remove(cast(GSimpleActionGroup*)cPtr, _actionName);
  }
}
