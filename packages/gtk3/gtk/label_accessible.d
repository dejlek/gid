/// Module for [LabelAccessible] class
module gtk.label_accessible;

import atk.component;
import atk.component_mixin;
import atk.hypertext;
import atk.hypertext_mixin;
import atk.text;
import atk.text_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget_accessible;

/** */
class LabelAccessible : gtk.widget_accessible.WidgetAccessible, atk.hypertext.Hypertext, atk.text.Text
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
    return cast(void function())gtk_label_accessible_get_type != &gidSymbolNotFound ? gtk_label_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override LabelAccessible self()
  {
    return this;
  }

  mixin HypertextT!();
  mixin TextT!();
}
