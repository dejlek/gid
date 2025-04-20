/// Module for [ImageAccessible] class
module gtk.image_accessible;

import atk.component;
import atk.component_mixin;
import atk.image;
import atk.image_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget_accessible;

/** */
class ImageAccessible : gtk.widget_accessible.WidgetAccessible, atk.image.Image
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
    return cast(void function())gtk_image_accessible_get_type != &gidSymbolNotFound ? gtk_image_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ImageAccessible self()
  {
    return this;
  }

  mixin ImageT!();
}
