module Gtk.SelectionFilterModel;

import GObject.ObjectG;
import Gid.gid;
import Gio.ListModel;
import Gio.ListModelT;
import Gtk.SelectionModel;
import Gtk.SelectionModelT;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkSelectionFilterModel` is a list model that presents the selection from
 * a `GtkSelectionModel`.
 */
class SelectionFilterModel : ObjectG, ListModel
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_selection_filter_model_get_type != &gidSymbolNotFound ? gtk_selection_filter_model_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ListModelT!();

  /**
   * Creates a new `GtkSelectionFilterModel` that will include the
   * selected items from the underlying selection model.
   * Params:
   *   model = the selection model to filter
   * Returns: a new `GtkSelectionFilterModel`
   */
  this(SelectionModel model)
  {
    GtkSelectionFilterModel* _cretval;
    _cretval = gtk_selection_filter_model_new(model ? cast(GtkSelectionModel*)(cast(ObjectG)model).cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the model currently filtered or %NULL if none.
   * Returns: The model that gets filtered
   */
  SelectionModel getModel()
  {
    GtkSelectionModel* _cretval;
    _cretval = gtk_selection_filter_model_get_model(cast(GtkSelectionFilterModel*)cPtr);
    auto _retval = ObjectG.getDObject!SelectionModel(cast(GtkSelectionModel*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets the model to be filtered.
   * Note that GTK makes no effort to ensure that model conforms to
   * the item type of self. It assumes that the caller knows what they
   * are doing and have set up an appropriate filter to ensure that item
   * types match.
   * Params:
   *   model = The model to be filtered
   */
  void setModel(SelectionModel model)
  {
    gtk_selection_filter_model_set_model(cast(GtkSelectionFilterModel*)cPtr, model ? cast(GtkSelectionModel*)(cast(ObjectG)model).cPtr(No.Dup) : null);
  }
}
