module Gtk.FlattenListModel;

import GObject.ObjectG;
import Gid.gid;
import Gio.ListModel;
import Gio.ListModelT;
import Gtk.SectionModel;
import Gtk.SectionModelT;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkFlattenListModel` is a list model that concatenates other list models.
 * `GtkFlattenListModel` takes a list model containing list models, and flattens
 * it into a single model. Each list model becomes a section in the single model.
 */
class FlattenListModel : ObjectG, ListModel, SectionModel
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_flatten_list_model_get_type != &gidSymbolNotFound ? gtk_flatten_list_model_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ListModelT!();
  mixin SectionModelT!();

  /**
   * Creates a new `GtkFlattenListModel` that flattens list.
   * Params:
   *   model = the model to be flattened
   * Returns: a new `GtkFlattenListModel`
   */
  this(ListModel model)
  {
    GtkFlattenListModel* _cretval;
    _cretval = gtk_flatten_list_model_new(model ? cast(GListModel*)(cast(ObjectG)model).cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the model set via [Gtk.FlattenListModel.setModel].
   * Returns: The model flattened by self
   */
  ListModel getModel()
  {
    GListModel* _cretval;
    _cretval = gtk_flatten_list_model_get_model(cast(GtkFlattenListModel*)cPtr);
    auto _retval = ObjectG.getDObject!ListModel(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the model containing the item at the given position.
   * Params:
   *   position = a position
   * Returns: the model containing the item at position
   */
  ListModel getModelForItem(uint position)
  {
    GListModel* _cretval;
    _cretval = gtk_flatten_list_model_get_model_for_item(cast(GtkFlattenListModel*)cPtr, position);
    auto _retval = ObjectG.getDObject!ListModel(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets a new model to be flattened.
   * Params:
   *   model = the new model
   */
  void setModel(ListModel model)
  {
    gtk_flatten_list_model_set_model(cast(GtkFlattenListModel*)cPtr, model ? cast(GListModel*)(cast(ObjectG)model).cPtr(No.Dup) : null);
  }
}
