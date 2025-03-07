module gtk.spin_button_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.editable_text;
import atk.editable_text_mixin;
import atk.text;
import atk.text_mixin;
import atk.value;
import atk.value_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.entry_accessible;
import gtk.types;

/** */
class SpinButtonAccessible : gtk.entry_accessible.EntryAccessible, atk.value.Value
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_spin_button_accessible_get_type != &gidSymbolNotFound ? gtk_spin_button_accessible_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin ValueT!();
}
