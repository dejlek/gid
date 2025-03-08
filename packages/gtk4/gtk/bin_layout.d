module gtk.bin_layout;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_manager;
import gtk.types;

/**
    [gtk.bin_layout.BinLayout] is a [gtk.layout_manager.LayoutManager] subclass useful for create "bins" of
  widgets.
  
  [gtk.bin_layout.BinLayout] will stack each child of a widget on top of each other,
  using the [gtk.widget.Widget.gboolean], [gtk.widget.Widget.gboolean],
  [gtk.widget.Widget.Align], and [gtk.widget.Widget.Align] properties
  of each child to determine where they should be positioned.
*/
class BinLayout : gtk.layout_manager.LayoutManager
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_bin_layout_get_type != &gidSymbolNotFound ? gtk_bin_layout_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [gtk.bin_layout.BinLayout] instance.
    Returns:     the newly created [gtk.bin_layout.BinLayout]
  */
  this()
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_bin_layout_new();
    this(_cretval, Yes.take);
  }
}
