/// Module for [NoSelection] class
module gtk.no_selection;

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
    [gtk.no_selection.NoSelection] is a [gtk.selection_model.SelectionModel] that does not allow selecting
    anything.
    
    This model is meant to be used as a simple wrapper around a [gio.list_model.ListModel]
    when a [gtk.selection_model.SelectionModel] is required.
    
    [gtk.no_selection.NoSelection] passes through sections from the underlying model.
*/
class NoSelection : gobject.object.ObjectWrap, gio.list_model.ListModel, gtk.section_model.SectionModel, gtk.selection_model.SelectionModel
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_no_selection_get_type != &gidSymbolNotFound ? gtk_no_selection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NoSelection self()
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
      Returns: The model being managed.
  */
  @property gio.list_model.ListModel model()
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model being managed.
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
      Returns: a new [gtk.no_selection.NoSelection]
  */
  this(gio.list_model.ListModel model = null)
  {
    GtkNoSelection* _cretval;
    _cretval = gtk_no_selection_new(model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the model that self is wrapping.
      Returns: The model being wrapped
  */
  gio.list_model.ListModel getModel()
  {
    GListModel* _cretval;
    _cretval = gtk_no_selection_get_model(cast(GtkNoSelection*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the model that self should wrap.
      
      If model is null, this model will be empty.
  
      Params:
        model = A [gio.list_model.ListModel] to wrap
  */
  void setModel(gio.list_model.ListModel model = null)
  {
    gtk_no_selection_set_model(cast(GtkNoSelection*)this._cPtr, model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }
}
