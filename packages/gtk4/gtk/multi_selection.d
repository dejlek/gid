/// Module for [MultiSelection] class
module gtk.multi_selection;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gobject.types;
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
class MultiSelection : gobject.object.ObjectWrap, gio.list_model.ListModel, gtk.section_model.SectionModel, gtk.selection_model.SelectionModel
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
    return cast(void function())gtk_multi_selection_get_type != &gidSymbolNotFound ? gtk_multi_selection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MultiSelection self()
  {
    return this;
  }

  /**
      Get `itemType` property.
      Returns: The type of items. See [gio.list_model.ListModel.getItemType].
  */
  @property gobject.types.GType itemType()
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.types.GType)("item-type");
  }

  /**
      Get `model` property.
      Returns: The list managed by this selection.
  */
  @property gio.list_model.ListModel model()
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The list managed by this selection.
  */
  @property void model(gio.list_model.ListModel propval)
  {
    return setModel(propval);
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gio.list_model.ListModel.getNItems].
  */
  @property uint nItems()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  mixin ListModelT!();
  mixin SectionModelT!();
  mixin SelectionModelT!();

  /**
      Creates a new selection to handle model.
  
      Params:
        model = the [gio.list_model.ListModel] to manage
      Returns: a new [gtk.multi_selection.MultiSelection]
  */
  this(gio.list_model.ListModel model = null)
  {
    GtkMultiSelection* _cretval;
    _cretval = gtk_multi_selection_new(model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model).cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the underlying model of self.
      Returns: the underlying model
  */
  gio.list_model.ListModel getModel()
  {
    GListModel* _cretval;
    _cretval = gtk_multi_selection_get_model(cast(GtkMultiSelection*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the model that self should wrap.
      
      If model is null, self will be empty.
  
      Params:
        model = A [gio.list_model.ListModel] to wrap
  */
  void setModel(gio.list_model.ListModel model = null)
  {
    gtk_multi_selection_set_model(cast(GtkMultiSelection*)cPtr, model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model).cPtr(No.Dup) : null);
  }
}
