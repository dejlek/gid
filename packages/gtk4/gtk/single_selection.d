module gtk.single_selection;

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
    [gtk.single_selection.SingleSelection] is a [gtk.selection_model.SelectionModel] that allows selecting a single
  item.
  
  Note that the selection is *persistent* -- if the selected item is removed
  and re-added in the same `signal@Gio.ListModel::items-changed` emission, it
  stays selected. In particular, this means that changing the sort order of an
  underlying sort model will preserve the selection.
*/
class SingleSelection : gobject.object.ObjectG, gio.list_model.ListModel, gtk.section_model.SectionModel, gtk.selection_model.SelectionModel
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_single_selection_get_type != &gidSymbolNotFound ? gtk_single_selection_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override SingleSelection self()
  {
    return this;
  }

  mixin ListModelT!();
  mixin SectionModelT!();
  mixin SelectionModelT!();

  /**
      Creates a new selection to handle model.
    Params:
      model =       the [gio.list_model.ListModel] to manage
    Returns:     a new [gtk.single_selection.SingleSelection]
  */
  this(gio.list_model.ListModel model = null)
  {
    GtkSingleSelection* _cretval;
    _cretval = gtk_single_selection_new(model ? cast(GListModel*)(cast(ObjectG)model).cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Checks if autoselect has been enabled or disabled via
    [gtk.single_selection.SingleSelection.setAutoselect].
    Returns:     true if autoselect is enabled
  */
  bool getAutoselect()
  {
    bool _retval;
    _retval = gtk_single_selection_get_autoselect(cast(GtkSingleSelection*)cPtr);
    return _retval;
  }

  /**
      If true, [gtk.selection_model.SelectionModel.unselectItem] is supported and allows
    unselecting the selected item.
    Returns:     true to support unselecting
  */
  bool getCanUnselect()
  {
    bool _retval;
    _retval = gtk_single_selection_get_can_unselect(cast(GtkSingleSelection*)cPtr);
    return _retval;
  }

  /**
      Gets the model that self is wrapping.
    Returns:     The model being wrapped
  */
  gio.list_model.ListModel getModel()
  {
    GListModel* _cretval;
    _cretval = gtk_single_selection_get_model(cast(GtkSingleSelection*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the position of the selected item.
    
    If no item is selected, `GTK_INVALID_LIST_POSITION` is returned.
    Returns:     The position of the selected item
  */
  uint getSelected()
  {
    uint _retval;
    _retval = gtk_single_selection_get_selected(cast(GtkSingleSelection*)cPtr);
    return _retval;
  }

  /**
      Gets the selected item.
    
    If no item is selected, null is returned.
    Returns:     The selected item
  */
  gobject.object.ObjectG getSelectedItem()
  {
    ObjectC* _cretval;
    _cretval = gtk_single_selection_get_selected_item(cast(GtkSingleSelection*)cPtr);
    auto _retval = ObjectG.getDObject!(gobject.object.ObjectG)(cast(ObjectC*)_cretval, No.Take);
    return _retval;
  }

  /**
      Enables or disables autoselect.
    
    If autoselect is true, self will enforce that an item is always
    selected. It will select a new item when the currently selected
    item is deleted and it will disallow unselecting the current item.
    Params:
      autoselect =       true to always select an item
  */
  void setAutoselect(bool autoselect)
  {
    gtk_single_selection_set_autoselect(cast(GtkSingleSelection*)cPtr, autoselect);
  }

  /**
      If true, unselecting the current item via
    [gtk.selection_model.SelectionModel.unselectItem] is supported.
    
    Note that setting [gtk.single_selection.SingleSelection.gboolean] will
    cause unselecting to not work, so it practically makes no sense
    to set both at the same time the same time.
    Params:
      canUnselect =       true to allow unselecting
  */
  void setCanUnselect(bool canUnselect)
  {
    gtk_single_selection_set_can_unselect(cast(GtkSingleSelection*)cPtr, canUnselect);
  }

  /**
      Sets the model that self should wrap.
    
    If model is null, self will be empty.
    Params:
      model =       A [gio.list_model.ListModel] to wrap
  */
  void setModel(gio.list_model.ListModel model = null)
  {
    gtk_single_selection_set_model(cast(GtkSingleSelection*)cPtr, model ? cast(GListModel*)(cast(ObjectG)model).cPtr(No.Dup) : null);
  }

  /**
      Selects the item at the given position.
    
    If the list does not have an item at position or
    `GTK_INVALID_LIST_POSITION` is given, the behavior depends on the
    value of the [gtk.single_selection.SingleSelection.gboolean] property:
    If it is set, no change will occur and the old item will stay
    selected. If it is unset, the selection will be unset and no item
    will be selected.
    Params:
      position =       the item to select or `GTK_INVALID_LIST_POSITION`
  */
  void setSelected(uint position)
  {
    gtk_single_selection_set_selected(cast(GtkSingleSelection*)cPtr, position);
  }
}
