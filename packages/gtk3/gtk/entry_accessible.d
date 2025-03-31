/// Module for [EntryAccessible] class
module gtk.entry_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.editable_text;
import atk.editable_text_mixin;
import atk.object;
import atk.text;
import atk.text_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget_accessible;

/** */
class EntryAccessible : gtk.widget_accessible.WidgetAccessible, atk.action.Action, atk.editable_text.EditableText, atk.text.Text
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_entry_accessible_get_type != &gidSymbolNotFound ? gtk_entry_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override EntryAccessible self()
  {
    return this;
  }

  mixin ActionT!();
  mixin EditableTextT!();
  mixin TextT!();
  alias getDescription = atk.object.ObjectAtk.getDescription;
  alias getName = atk.object.ObjectAtk.getName;
  alias setDescription = atk.object.ObjectAtk.setDescription;
}
