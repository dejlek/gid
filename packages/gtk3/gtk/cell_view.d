/// Module for [CellView] class
module gtk.cell_view;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.color;
import gdk.rgba;
import gdkpixbuf.pixbuf;
import gid.gid;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_area;
import gtk.cell_area_context;
import gtk.cell_layout;
import gtk.cell_layout_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.requisition;
import gtk.tree_model;
import gtk.tree_path;
import gtk.types;
import gtk.widget;

/**
    A #GtkCellView displays a single row of a #GtkTreeModel using a #GtkCellArea
    and #GtkCellAreaContext. A #GtkCellAreaContext can be provided to the
    #GtkCellView at construction time in order to keep the cellview in context
    of a group of cell views, this ensures that the renderers displayed will
    be properly aligned with eachother (like the aligned cells in the menus
    of #GtkComboBox).
    
    #GtkCellView is #GtkOrientable in order to decide in which orientation
    the underlying #GtkCellAreaContext should be allocated. Taking the #GtkComboBox
    menu as an example, cellviews should be oriented horizontally if the menus are
    listed top-to-bottom and thus all share the same width but may have separate
    individual heights (left-to-right menus should be allocated vertically since
    they all share the same height but may have variable widths).
    
    # CSS nodes
    
    GtkCellView has a single CSS node with name cellview.
*/
class CellView : gtk.widget.Widget, gtk.cell_layout.CellLayout, gtk.orientable.Orientable
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
    return cast(void function())gtk_cell_view_get_type != &gidSymbolNotFound ? gtk_cell_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override CellView self()
  {
    return this;
  }

  mixin CellLayoutT!();
  mixin OrientableT!();

  /**
      Creates a new #GtkCellView widget.
      Returns: A newly created #GtkCellView widget.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_cell_view_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkCellView widget with a specific #GtkCellArea
      to layout cells and a specific #GtkCellAreaContext.
      
      Specifying the same context for a handfull of cells lets
      the underlying area synchronize the geometry for those cells,
      in this way alignments with cellviews for other rows are
      possible.
  
      Params:
        area = the #GtkCellArea to layout cells
        context = the #GtkCellAreaContext in which to calculate cell geometry
      Returns: A newly created #GtkCellView widget.
  */
  static gtk.cell_view.CellView newWithContext(gtk.cell_area.CellArea area, gtk.cell_area_context.CellAreaContext context)
  {
    GtkWidget* _cretval;
    _cretval = gtk_cell_view_new_with_context(area ? cast(GtkCellArea*)area.cPtr(No.Dup) : null, context ? cast(GtkCellAreaContext*)context.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.cell_view.CellView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkCellView widget, adds a #GtkCellRendererText
      to it, and makes it show markup. The text can be
      marked up with the [Pango text markup language][PangoMarkupFormat].
  
      Params:
        markup = the text to display in the cell view
      Returns: A newly created #GtkCellView widget.
  */
  static gtk.cell_view.CellView newWithMarkup(string markup)
  {
    GtkWidget* _cretval;
    const(char)* _markup = markup.toCString(No.Alloc);
    _cretval = gtk_cell_view_new_with_markup(_markup);
    auto _retval = ObjectG.getDObject!(gtk.cell_view.CellView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkCellView widget, adds a #GtkCellRendererPixbuf
      to it, and makes it show pixbuf.
  
      Params:
        pixbuf = the image to display in the cell view
      Returns: A newly created #GtkCellView widget.
  */
  static gtk.cell_view.CellView newWithPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    GtkWidget* _cretval;
    _cretval = gtk_cell_view_new_with_pixbuf(pixbuf ? cast(PixbufC*)pixbuf.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.cell_view.CellView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkCellView widget, adds a #GtkCellRendererText
      to it, and makes it show text.
  
      Params:
        text = the text to display in the cell view
      Returns: A newly created #GtkCellView widget.
  */
  static gtk.cell_view.CellView newWithText(string text)
  {
    GtkWidget* _cretval;
    const(char)* _text = text.toCString(No.Alloc);
    _cretval = gtk_cell_view_new_with_text(_text);
    auto _retval = ObjectG.getDObject!(gtk.cell_view.CellView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a #GtkTreePath referring to the currently
      displayed row. If no row is currently displayed,
      null is returned.
      Returns: the currently displayed row or null
  */
  gtk.tree_path.TreePath getDisplayedRow()
  {
    GtkTreePath* _cretval;
    _cretval = gtk_cell_view_get_displayed_row(cast(GtkCellView*)cPtr);
    auto _retval = _cretval ? new gtk.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets whether cell_view is configured to draw all of its
      cells in a sensitive state.
      Returns: whether cell_view draws all of its
        cells in a sensitive state
  */
  bool getDrawSensitive()
  {
    bool _retval;
    _retval = gtk_cell_view_get_draw_sensitive(cast(GtkCellView*)cPtr);
    return _retval;
  }

  /**
      Gets whether cell_view is configured to request space
      to fit the entire #GtkTreeModel.
      Returns: whether cell_view requests space to fit
        the entire #GtkTreeModel.
  */
  bool getFitModel()
  {
    bool _retval;
    _retval = gtk_cell_view_get_fit_model(cast(GtkCellView*)cPtr);
    return _retval;
  }

  /**
      Returns the model for cell_view. If no model is used null is
      returned.
      Returns: a #GtkTreeModel used or null
  */
  gtk.tree_model.TreeModel getModel()
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_cell_view_get_model(cast(GtkCellView*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets requisition to the size needed by cell_view to display
      the model row pointed to by path.
  
      Params:
        path = a #GtkTreePath
        requisition = return location for the size
      Returns: true
  
      Deprecated: Combo box formerly used this to calculate the
        sizes for cellviews, now you can achieve this by either using
        the #GtkCellView:fit-model property or by setting the currently
        displayed row of the #GtkCellView and using [gtk.widget.Widget.getPreferredSize].
  */
  bool getSizeOfRow(gtk.tree_path.TreePath path, out gtk.requisition.Requisition requisition)
  {
    bool _retval;
    GtkRequisition _requisition;
    _retval = gtk_cell_view_get_size_of_row(cast(GtkCellView*)cPtr, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null, &_requisition);
    requisition = new gtk.requisition.Requisition(cast(void*)&_requisition, No.Take);
    return _retval;
  }

  /**
      Sets the background color of view.
  
      Params:
        color = the new background color
  
      Deprecated: Use [gtk.cell_view.CellView.setBackgroundRgba] instead.
  */
  void setBackgroundColor(gdk.color.Color color)
  {
    gtk_cell_view_set_background_color(cast(GtkCellView*)cPtr, color ? cast(const(GdkColor)*)color.cPtr(No.Dup) : null);
  }

  /**
      Sets the background color of cell_view.
  
      Params:
        rgba = the new background color
  */
  void setBackgroundRgba(gdk.rgba.RGBA rgba)
  {
    gtk_cell_view_set_background_rgba(cast(GtkCellView*)cPtr, rgba ? cast(const(GdkRGBA)*)rgba.cPtr(No.Dup) : null);
  }

  /**
      Sets the row of the model that is currently displayed
      by the #GtkCellView. If the path is unset, then the
      contents of the cellview “stick” at their last value;
      this is not normally a desired result, but may be
      a needed intermediate state if say, the model for
      the #GtkCellView becomes temporarily empty.
  
      Params:
        path = a #GtkTreePath or null to unset.
  */
  void setDisplayedRow(gtk.tree_path.TreePath path = null)
  {
    gtk_cell_view_set_displayed_row(cast(GtkCellView*)cPtr, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null);
  }

  /**
      Sets whether cell_view should draw all of its
      cells in a sensitive state, this is used by #GtkComboBox menus
      to ensure that rows with insensitive cells that contain
      children appear sensitive in the parent menu item.
  
      Params:
        drawSensitive = whether to draw all cells in a sensitive state.
  */
  void setDrawSensitive(bool drawSensitive)
  {
    gtk_cell_view_set_draw_sensitive(cast(GtkCellView*)cPtr, drawSensitive);
  }

  /**
      Sets whether cell_view should request space to fit the entire #GtkTreeModel.
      
      This is used by #GtkComboBox to ensure that the cell view displayed on
      the combo box’s button always gets enough space and does not resize
      when selection changes.
  
      Params:
        fitModel = whether cell_view should request space for the whole model.
  */
  void setFitModel(bool fitModel)
  {
    gtk_cell_view_set_fit_model(cast(GtkCellView*)cPtr, fitModel);
  }

  /**
      Sets the model for cell_view.  If cell_view already has a model
      set, it will remove it before setting the new model.  If model is
      null, then it will unset the old model.
  
      Params:
        model = a #GtkTreeModel
  */
  void setModel(gtk.tree_model.TreeModel model = null)
  {
    gtk_cell_view_set_model(cast(GtkCellView*)cPtr, model ? cast(GtkTreeModel*)(cast(ObjectG)model).cPtr(No.Dup) : null);
  }
}
