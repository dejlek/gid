module gtk.flatten_list_model;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.section_model;
import gtk.section_model_mixin;
import gtk.types;

/**
    [gtk.flatten_list_model.FlattenListModel] is a list model that concatenates other list models.
  
  [gtk.flatten_list_model.FlattenListModel] takes a list model containing list models, and flattens
  it into a single model. Each list model becomes a section in the single model.
*/
class FlattenListModel : gobject.object.ObjectG, gio.list_model.ListModel, gtk.section_model.SectionModel
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_flatten_list_model_get_type != &gidSymbolNotFound ? gtk_flatten_list_model_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin ListModelT!();
  mixin SectionModelT!();

  /**
      Creates a new [gtk.flatten_list_model.FlattenListModel] that flattens list.
    Params:
      model =       the model to be flattened
    Returns:     a new [gtk.flatten_list_model.FlattenListModel]
  */
  this(gio.list_model.ListModel model = null)
  {
    GtkFlattenListModel* _cretval;
    _cretval = gtk_flatten_list_model_new(model ? cast(GListModel*)(cast(ObjectG)model).cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the model set via [gtk.flatten_list_model.FlattenListModel.setModel].
    Returns:     The model flattened by self
  */
  gio.list_model.ListModel getModel()
  {
    GListModel* _cretval;
    _cretval = gtk_flatten_list_model_get_model(cast(GtkFlattenListModel*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the model containing the item at the given position.
    Params:
      position =       a position
    Returns:     the model containing the item at position
  */
  gio.list_model.ListModel getModelForItem(uint position)
  {
    GListModel* _cretval;
    _cretval = gtk_flatten_list_model_get_model_for_item(cast(GtkFlattenListModel*)cPtr, position);
    auto _retval = ObjectG.getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets a new model to be flattened.
    Params:
      model =       the new model
  */
  void setModel(gio.list_model.ListModel model = null)
  {
    gtk_flatten_list_model_set_model(cast(GtkFlattenListModel*)cPtr, model ? cast(GListModel*)(cast(ObjectG)model).cPtr(No.Dup) : null);
  }
}
