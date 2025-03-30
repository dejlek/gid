/// Module for [OverlayLayout] class
module gtk.overlay_layout;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_manager;
import gtk.types;

/**
    [gtk.overlay_layout.OverlayLayout] is the layout manager used by [gtk.overlay.Overlay].
    
    It places widgets as overlays on top of the main child.
    
    This is not a reusable layout manager, since it expects its widget
    to be a [gtk.overlay.Overlay]. It is only listed here so that its layout
    properties get documented.
*/
class OverlayLayout : gtk.layout_manager.LayoutManager
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
    return cast(void function())gtk_overlay_layout_get_type != &gidSymbolNotFound ? gtk_overlay_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override OverlayLayout self()
  {
    return this;
  }

  /**
      Creates a new [gtk.overlay_layout.OverlayLayout] instance.
      Returns: the newly created instance
  */
  this()
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_overlay_layout_new();
    this(_cretval, Yes.Take);
  }
}
