module gtk.overlay_layout;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_manager;
import gtk.types;

/**
 * `GtkOverlayLayout` is the layout manager used by [gtk.overlay.Overlay].
 * It places widgets as overlays on top of the main child.
 * This is not a reusable layout manager, since it expects its widget
 * to be a `GtkOverlay`. It is only listed here so that its layout
 * properties get documented.
 */
class OverlayLayout : gtk.layout_manager.LayoutManager
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_overlay_layout_get_type != &gidSymbolNotFound ? gtk_overlay_layout_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkOverlayLayout` instance.
   * Returns: the newly created instance
   */
  this()
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_overlay_layout_new();
    this(_cretval, Yes.Take);
  }
}
