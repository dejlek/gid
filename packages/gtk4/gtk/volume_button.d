module gtk.volume_button;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.accessible_range;
import gtk.accessible_range_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.scale_button;
import gtk.types;

/**
 * `GtkVolumeButton` is a `GtkScaleButton` subclass tailored for
 * volume control.
 * ![An example GtkVolumeButton](volumebutton.png)

 * Deprecated: This widget will be removed in GTK 5
 */
class VolumeButton : gtk.scale_button.ScaleButton
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_volume_button_get_type != &gidSymbolNotFound ? gtk_volume_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a `GtkVolumeButton`.
   * The button has a range between 0.0 and 1.0, with a stepping of 0.02.
   * Volume values can be obtained and modified using the functions from
   * [gtk.scale_button.ScaleButton].
   * Returns: a new `GtkVolumeButton`

   * Deprecated: This widget will be removed in GTK 5
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_volume_button_new();
    this(_cretval, No.Take);
  }
}
