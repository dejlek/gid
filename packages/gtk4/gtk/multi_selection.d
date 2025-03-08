module gtk.multi_selection;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.section_model;
import gtk.section_model_mixin;
import gtk.selection_model;
import gtk.selection_model_mixin;
import gtk.types;

/**
    [gtk.multi_selection.MultiSelection] is a [gtk.selection_model.SelectionModel] that allows selecting multiple
  elements.
*/
class MultiSelection : gobject.object.ObjectG, gio.list_model.ListModel, gtk.section_model.SectionModel, gtk.selection_model.SelectionModel
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_multi_selection_get_type != &gidSymbolNotFound ? gtk_multi_selection_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin ListModelT!();
  mixin SectionModelT!();
  mixin SelectionModelT!();

  /**
      Creates a new selection to handle model.
    Params:
      model =       the [gio.list_model.ListModel] to manage
    Returns:     a new [gtk.multi_selection.MultiSelection]
  */
  this(gio.list_model.ListModel model = null)
  {
    GtkMultiSelection* _cretval;
    _cretval = gtk_multi_selection_new(model ? cast(GListModel*)(cast(ObjectG)model).cPtr(Yes.dup) : null);
    this(_cretval, Yes.take);
  }

  /**
      Returns the underlying model of self.
    Returns:     the underlying model
  */
  gio.list_model.ListModel getModel()
  {
    GListModel* _cretval;
    _cretval = gtk_multi_selection_get_model(cast(GtkMultiSelection*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.take);
    return _retval;
  }

  /**
      Sets the model that self should wrap.
    
    If model is null, self will be empty.
    Params:
      model =       A [gio.list_model.ListModel] to wrap
  */
  void setModel(gio.list_model.ListModel model = null)
  {
    gtk_multi_selection_set_model(cast(GtkMultiSelection*)cPtr, model ? cast(GListModel*)(cast(ObjectG)model).cPtr(No.dup) : null);
  }
}
