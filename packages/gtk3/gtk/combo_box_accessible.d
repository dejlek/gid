module gtk.combo_box_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
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

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_combo_box_accessible_get_type != &gidSymbolNotFound ? gtk_combo_box_accessible_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin ActionT!();
  mixin SelectionT!();
  alias getDescription = atk.object.ObjectAtk.getDescription;
  alias getName = atk.object.ObjectAtk.getName;
  alias setDescription = atk.object.ObjectAtk.setDescription;
}
