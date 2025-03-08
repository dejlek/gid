module gtk.cell_renderer_pixbuf;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer;
import gtk.types;

/**
    A #GtkCellRendererPixbuf can be used to render an image in a cell. It allows
  to render either a given #GdkPixbuf (set via the
  #GtkCellRendererPixbuf:pixbuf property) or a named icon (set via the
  #GtkCellRendererPixbuf:icon-name property).
  
  To support the tree view, #GtkCellRendererPixbuf also supports rendering two
  alternative pixbufs, when the #GtkCellRenderer:is-expander property is true.
  If the #GtkCellRenderer:is-expanded property is true and the
  #GtkCellRendererPixbuf:pixbuf-expander-open property is set to a pixbuf, it
  renders that pixbuf, if the #GtkCellRenderer:is-expanded property is false
  and the #GtkCellRendererPixbuf:pixbuf-expander-closed property is set to a
  pixbuf, it renders that one.
*/
class CellRendererPixbuf : gtk.cell_renderer.CellRenderer
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_cell_renderer_pixbuf_get_type != &gidSymbolNotFound ? gtk_cell_renderer_pixbuf_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new #GtkCellRendererPixbuf. Adjust rendering
    parameters using object properties. Object properties can be set
    globally (with [gobject.object.ObjectG.set]). Also, with #GtkTreeViewColumn, you
    can bind a property to a value in a #GtkTreeModel. For example, you
    can bind the “pixbuf” property on the cell renderer to a pixbuf value
    in the model, thus rendering a different image in each row of the
    #GtkTreeView.
    Returns:     the new cell renderer
  */
  this()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_pixbuf_new();
    this(_cretval, No.take);
  }
}
