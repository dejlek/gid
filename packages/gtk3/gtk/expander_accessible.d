module gtk.expander_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class ExpanderAccessible : gtk.container_accessible.ContainerAccessible, atk.action.Action
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_expander_accessible_get_type != &gidSymbolNotFound ? gtk_expander_accessible_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin ActionT!();
  alias getDescription = atk.object.ObjectAtk.getDescription;
  alias getName = atk.object.ObjectAtk.getName;
  alias setDescription = atk.object.ObjectAtk.setDescription;
}
