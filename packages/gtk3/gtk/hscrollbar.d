module gtk.hscrollbar;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.scrollbar;
import gtk.types;

/**
 * The #GtkHScrollbar widget is a widget arranged horizontally creating a
 * scrollbar. See #GtkScrollbar for details on
 * scrollbars. #GtkAdjustment pointers may be added to handle the
 * adjustment of the scrollbar or it may be left %NULL in which case one
 * will be created for you. See #GtkScrollbar for a description of what the
 * fields in an adjustment represent for a scrollbar.
 * GtkHScrollbar has been deprecated, use #GtkScrollbar instead.
 */
class HScrollbar : gtk.scrollbar.Scrollbar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_hscrollbar_get_type != &gidSymbolNotFound ? gtk_hscrollbar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new horizontal scrollbar.
   * Params:
   *   adjustment = the #GtkAdjustment to use, or %NULL to create a new adjustment
   * Returns: the new #GtkHScrollbar

   * Deprecated: Use [gtk.scrollbar.Scrollbar.new_] with %GTK_ORIENTATION_HORIZONTAL instead
   */
  this(gtk.adjustment.Adjustment adjustment = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_hscrollbar_new(adjustment ? cast(GtkAdjustment*)adjustment.cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }
}
