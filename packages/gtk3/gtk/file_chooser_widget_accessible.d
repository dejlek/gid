module gtk.file_chooser_widget_accessible;

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
class FileChooserWidgetAccessible : gtk.container_accessible.ContainerAccessible, atk.action.Action
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_file_chooser_widget_accessible_get_type != &gidSymbolNotFound ? gtk_file_chooser_widget_accessible_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override FileChooserWidgetAccessible self()
  {
    return this;
  }

  mixin ActionT!();
  alias getDescription = atk.object.ObjectAtk.getDescription;
  alias getName = atk.object.ObjectAtk.getName;
  alias setDescription = atk.object.ObjectAtk.setDescription;
}
