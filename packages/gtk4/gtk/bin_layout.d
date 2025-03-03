module gtk.bin_layout;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_manager;
import gtk.types;

/**
 * `GtkBinLayout` is a `GtkLayoutManager` subclass useful for create "bins" of
 * widgets.
 * `GtkBinLayout` will stack each child of a widget on top of each other,
 * using the [gtk.widget.Widget.gboolean], [gtk.widget.Widget.gboolean],
 * [gtk.widget.Widget.Align], and [gtk.widget.Widget.Align] properties
 * of each child to determine where they should be positioned.
 */
class BinLayout : gtk.layout_manager.LayoutManager
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_bin_layout_get_type != &gidSymbolNotFound ? gtk_bin_layout_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkBinLayout` instance.
   * Returns: the newly created `GtkBinLayout`
   */
  this()
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_bin_layout_new();
    this(_cretval, Yes.Take);
  }
}
