/// Module for [ComboBoxAccessible] class
module gtk.combo_box_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.object;
import atk.selection;
import atk.selection_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class ComboBoxAccessible : gtk.container_accessible.ContainerAccessible, atk.action.Action, atk.selection.Selection
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_combo_box_accessible_get_type != &gidSymbolNotFound ? gtk_combo_box_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ComboBoxAccessible self()
  {
    return this;
  }

  mixin ActionT!();
  mixin SelectionT!();
  alias getDescription = atk.object.ObjectWrap.getDescription;
  alias getName = atk.object.ObjectWrap.getName;
  alias setDescription = atk.object.ObjectWrap.setDescription;
}
