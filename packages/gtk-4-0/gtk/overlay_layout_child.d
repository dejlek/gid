module gtk.overlay_layout_child;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_child;
import gtk.types;

/**
 * `GtkLayoutChild` subclass for children in a `GtkOverlayLayout`.
 */
class OverlayLayoutChild : LayoutChild
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_overlay_layout_child_get_type != &gidSymbolNotFound ? gtk_overlay_layout_child_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Retrieves whether the child is clipped.
   * Returns: whether the child is clipped
   */
  bool getClipOverlay()
  {
    bool _retval;
    _retval = gtk_overlay_layout_child_get_clip_overlay(cast(GtkOverlayLayoutChild*)cPtr);
    return _retval;
  }

  /**
   * Retrieves whether the child is measured.
   * Returns: whether the child is measured
   */
  bool getMeasure()
  {
    bool _retval;
    _retval = gtk_overlay_layout_child_get_measure(cast(GtkOverlayLayoutChild*)cPtr);
    return _retval;
  }

  /**
   * Sets whether to clip this child.
   * Params:
   *   clipOverlay = whether to clip this child
   */
  void setClipOverlay(bool clipOverlay)
  {
    gtk_overlay_layout_child_set_clip_overlay(cast(GtkOverlayLayoutChild*)cPtr, clipOverlay);
  }

  /**
   * Sets whether to measure this child.
   * Params:
   *   measure = whether to measure this child
   */
  void setMeasure(bool measure)
  {
    gtk_overlay_layout_child_set_measure(cast(GtkOverlayLayoutChild*)cPtr, measure);
  }
}
