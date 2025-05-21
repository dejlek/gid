/// Module for [EntryIconAccessible] class
module gtk.entry_icon_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.object;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class EntryIconAccessible : atk.object.ObjectWrap, atk.action.Action, atk.component.Component
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_entry_icon_accessible_get_type != &gidSymbolNotFound ? gtk_entry_icon_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EntryIconAccessible self()
  {
    return this;
  }

  mixin ActionT!();
  mixin ComponentT!();
  alias getDescription = atk.object.ObjectWrap.getDescription;
  alias getName = atk.object.ObjectWrap.getName;
  alias setDescription = atk.object.ObjectWrap.setDescription;
}
