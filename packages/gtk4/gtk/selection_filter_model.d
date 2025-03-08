module gtk.selection_filter_model;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.selection_model;
import gtk.types;

/**
    [gtk.selection_filter_model.SelectionFilterModel] is a list model that presents the selection from
  a [gtk.selection_model.SelectionModel].
*/
class SelectionFilterModel : gobject.object.ObjectG, gio.list_model.ListModel
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_selection_filter_model_get_type != &gidSymbolNotFound ? gtk_selection_filter_model_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin ListModelT!();

  /**
      Creates a new [gtk.selection_filter_model.SelectionFilterModel] that will include the
    selected items from the underlying selection model.
    Params:
      model =       the selection model to filter
    Returns:     a new [gtk.selection_filter_model.SelectionFilterModel]
  */
  this(gtk.selection_model.SelectionModel model = null)
  {
    GtkSelectionFilterModel* _cretval;
    _cretval = gtk_selection_filter_model_new(model ? cast(GtkSelectionModel*)(cast(ObjectG)model).cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the model currently filtered or null if none.
    Returns:     The model that gets filtered
  */
  gtk.selection_model.SelectionModel getModel()
  {
    GtkSelectionModel* _cretval;
    _cretval = gtk_selection_filter_model_get_model(cast(GtkSelectionFilterModel*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the model to be filtered.
    
    Note that GTK makes no effort to ensure that model conforms to
    the item type of self. It assumes that the caller knows what they
    are doing and have set up an appropriate filter to ensure that item
    types match.
    Params:
      model =       The model to be filtered
  */
  void setModel(gtk.selection_model.SelectionModel model = null)
  {
    gtk_selection_filter_model_set_model(cast(GtkSelectionFilterModel*)cPtr, model ? cast(GtkSelectionModel*)(cast(ObjectG)model).cPtr(No.Dup) : null);
  }
}
