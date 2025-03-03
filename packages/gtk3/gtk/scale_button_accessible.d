module gtk.scale_button_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.image;
import atk.image_mixin;
import atk.value;
import atk.value_mixin;
import gid.gid;
import gtk.button_accessible;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

class ScaleButtonAccessible : gtk.button_accessible.ButtonAccessible, atk.value.ValueAtk
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_scale_button_accessible_get_type != &gidSymbolNotFound ? gtk_scale_button_accessible_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ValueAtkT!();
}
