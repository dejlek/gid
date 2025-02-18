module Gio.ActionMap;

public import Gio.ActionMapIfaceProxy;
import GObject.ObjectG;
import Gid.gid;
import Gio.Action;
import Gio.ActionT;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

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
interface ActionMap
{

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())g_action_map_get_type != &gidSymbolNotFound ? g_action_map_get_type() : cast(GType)0;
  }

  /**
   * Adds an action to the action_map.
   * If the action map already contains an action with the same name
   * as action then the old action is dropped from the action map.
   * The action map takes its own reference on action.
   * Params:
   *   action = a #GAction
   */
  void addAction(Action action);

  /**
   * Looks up the action with the name action_name in action_map.
   * If no such action exists, returns %NULL.
   * Params:
   *   actionName = the name of an action
   * Returns: a #GAction, or %NULL
   */
  Action lookupAction(string actionName);

  /**
   * Removes the named action from the action map.
   * If no action of this name is in the map then nothing happens.
   * Params:
   *   actionName = the name of the action
   */
  void removeAction(string actionName);
}
