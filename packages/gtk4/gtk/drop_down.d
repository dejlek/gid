module gtk.drop_down;

import gid.gid;
import gio.list_model;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.expression;
import gtk.list_item_factory;
import gtk.types;
import gtk.widget;

/**
    [gtk.drop_down.DropDown] is a widget that allows the user to choose an item
  from a list of options.
  
  ![An example GtkDropDown](drop-down.png)
  
  The [gtk.drop_down.DropDown] displays the [selected][gtk.drop_down.DropDown.guint]
  choice.
  
  The options are given to [gtk.drop_down.DropDown] in the form of [gio.list_model.ListModel]
  and how the individual options are represented is determined by
  a [gtk.list_item_factory.ListItemFactory]. The default factory displays simple strings,
  and adds a checkmark to the selected item in the popup.
  
  To set your own factory, use [gtk.drop_down.DropDown.setFactory]. It is
  possible to use a separate factory for the items in the popup, with
  [gtk.drop_down.DropDown.setListFactory].
  
  [gtk.drop_down.DropDown] knows how to obtain strings from the items in a
  [gtk.string_list.StringList]; for other models, you have to provide an expression
  to find the strings via [gtk.drop_down.DropDown.setExpression].
  
  [gtk.drop_down.DropDown] can optionally allow search in the popup, which is
  useful if the list of options is long. To enable the search entry,
  use [gtk.drop_down.DropDown.setEnableSearch].
  
  Here is a UI definition example for [gtk.drop_down.DropDown] with a simple model:
  
  ```xml
  <object class="GtkDropDown">
    <property name="model">
      <object class="GtkStringList">
        <items>
          <item translatable="yes">Factory</item>
          <item translatable="yes">Home</item>
          <item translatable="yes">Subway</item>
        </items>
      </object>
    </property>
  </object>
  ```
  
  If a [gtk.drop_down.DropDown] is created in this manner, or with
  [gtk.drop_down.DropDown.newFromStrings], for instance, the object returned from
  [gtk.drop_down.DropDown.getSelectedItem] will be a [gtk.string_object.StringObject].
  
  To learn more about the list widget framework, see the
  [overview](section-list-widget.html).
  
  ## CSS nodes
  
  [gtk.drop_down.DropDown] has a single CSS node with name dropdown,
  with the button and popover nodes as children.
  
  ## Accessibility
  
  [gtk.drop_down.DropDown] uses the [gtk.types.AccessibleRole.ComboBox] role.
*/
class DropDown : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_drop_down_get_type != &gidSymbolNotFound ? gtk_drop_down_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [gtk.drop_down.DropDown].
    
    You may want to call [gtk.drop_down.DropDown.setFactory]
    to set up a way to map its items to widgets.
    Params:
      model =       the model to use
      expression =       the expression to use
    Returns:     a new [gtk.drop_down.DropDown]
  */
  this(gio.list_model.ListModel model = null, gtk.expression.Expression expression = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_drop_down_new(model ? cast(GListModel*)(cast(ObjectG)model).cPtr(Yes.Dup) : null, expression ? cast(GtkExpression*)expression.cPtr(Yes.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Creates a new [gtk.drop_down.DropDown] that is populated with
    the strings.
    Params:
      strings =       The strings to put in the dropdown
    Returns:     a new [gtk.drop_down.DropDown]
  */
  static gtk.drop_down.DropDown newFromStrings(string[] strings)
  {
    GtkWidget* _cretval;
    char*[] _tmpstrings;
    foreach (s; strings)
      _tmpstrings ~= s.toCString(No.Alloc);
    _tmpstrings ~= null;
    const(char*)* _strings = _tmpstrings.ptr;
    _cretval = gtk_drop_down_new_from_strings(_strings);
    auto _retval = ObjectG.getDObject!(gtk.drop_down.DropDown)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether search is enabled.
    Returns:     true if the popup includes a search entry
  */
  bool getEnableSearch()
  {
    bool _retval;
    _retval = gtk_drop_down_get_enable_search(cast(GtkDropDown*)cPtr);
    return _retval;
  }

  /**
      Gets the expression set that is used to obtain strings from items.
    
    See [gtk.drop_down.DropDown.setExpression].
    Returns:     a [gtk.expression.Expression]
  */
  gtk.expression.Expression getExpression()
  {
    GtkExpression* _cretval;
    _cretval = gtk_drop_down_get_expression(cast(GtkDropDown*)cPtr);
    auto _retval = _cretval ? new gtk.expression.Expression(cast(GtkExpression*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the factory that's currently used to populate list items.
    
    The factory returned by this function is always used for the
    item in the button. It is also used for items in the popup
    if `propertyGtk.DropDown:list-factory` is not set.
    Returns:     The factory in use
  */
  gtk.list_item_factory.ListItemFactory getFactory()
  {
    GtkListItemFactory* _cretval;
    _cretval = gtk_drop_down_get_factory(cast(GtkDropDown*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the factory that's currently used to create header widgets for the popup.
    Returns:     The factory in use
  */
  gtk.list_item_factory.ListItemFactory getHeaderFactory()
  {
    GtkListItemFactory* _cretval;
    _cretval = gtk_drop_down_get_header_factory(cast(GtkDropDown*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the factory that's currently used to populate list items in the popup.
    Returns:     The factory in use
  */
  gtk.list_item_factory.ListItemFactory getListFactory()
  {
    GtkListItemFactory* _cretval;
    _cretval = gtk_drop_down_get_list_factory(cast(GtkDropDown*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the model that provides the displayed items.
    Returns:     The model in use
  */
  gio.list_model.ListModel getModel()
  {
    GListModel* _cretval;
    _cretval = gtk_drop_down_get_model(cast(GtkDropDown*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the match mode that the search filter is using.
    Returns:     the match mode of the search filter
  */
  gtk.types.StringFilterMatchMode getSearchMatchMode()
  {
    GtkStringFilterMatchMode _cretval;
    _cretval = gtk_drop_down_get_search_match_mode(cast(GtkDropDown*)cPtr);
    gtk.types.StringFilterMatchMode _retval = cast(gtk.types.StringFilterMatchMode)_cretval;
    return _retval;
  }

  /**
      Gets the position of the selected item.
    Returns:     the position of the selected item, or `GTK_INVALID_LIST_POSITION`
        if not item is selected
  */
  uint getSelected()
  {
    uint _retval;
    _retval = gtk_drop_down_get_selected(cast(GtkDropDown*)cPtr);
    return _retval;
  }

  /**
      Gets the selected item. If no item is selected, null is returned.
    Returns:     The selected item
  */
  gobject.object.ObjectG getSelectedItem()
  {
    ObjectC* _cretval;
    _cretval = gtk_drop_down_get_selected_item(cast(GtkDropDown*)cPtr);
    auto _retval = ObjectG.getDObject!(gobject.object.ObjectG)(cast(ObjectC*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether to show an arrow within the widget.
    Returns:     true if an arrow will be shown.
  */
  bool getShowArrow()
  {
    bool _retval;
    _retval = gtk_drop_down_get_show_arrow(cast(GtkDropDown*)cPtr);
    return _retval;
  }

  /**
      Sets whether a search entry will be shown in the popup that
    allows to search for items in the list.
    
    Note that [gtk.drop_down.DropDown.Expression] must be set for
    search to work.
    Params:
      enableSearch =       whether to enable search
  */
  void setEnableSearch(bool enableSearch)
  {
    gtk_drop_down_set_enable_search(cast(GtkDropDown*)cPtr, enableSearch);
  }

  /**
      Sets the expression that gets evaluated to obtain strings from items.
    
    This is used for search in the popup. The expression must have
    a value type of `G_TYPE_STRING`.
    Params:
      expression =       a [gtk.expression.Expression]
  */
  void setExpression(gtk.expression.Expression expression = null)
  {
    gtk_drop_down_set_expression(cast(GtkDropDown*)cPtr, expression ? cast(GtkExpression*)expression.cPtr(No.Dup) : null);
  }

  /**
      Sets the [gtk.list_item_factory.ListItemFactory] to use for populating list items.
    Params:
      factory =       the factory to use
  */
  void setFactory(gtk.list_item_factory.ListItemFactory factory = null)
  {
    gtk_drop_down_set_factory(cast(GtkDropDown*)cPtr, factory ? cast(GtkListItemFactory*)factory.cPtr(No.Dup) : null);
  }

  /**
      Sets the [gtk.list_item_factory.ListItemFactory] to use for creating header widgets for the popup.
    Params:
      factory =       the factory to use
  */
  void setHeaderFactory(gtk.list_item_factory.ListItemFactory factory = null)
  {
    gtk_drop_down_set_header_factory(cast(GtkDropDown*)cPtr, factory ? cast(GtkListItemFactory*)factory.cPtr(No.Dup) : null);
  }

  /**
      Sets the [gtk.list_item_factory.ListItemFactory] to use for populating list items in the popup.
    Params:
      factory =       the factory to use
  */
  void setListFactory(gtk.list_item_factory.ListItemFactory factory = null)
  {
    gtk_drop_down_set_list_factory(cast(GtkDropDown*)cPtr, factory ? cast(GtkListItemFactory*)factory.cPtr(No.Dup) : null);
  }

  /**
      Sets the [gio.list_model.ListModel] to use.
    Params:
      model =       the model to use
  */
  void setModel(gio.list_model.ListModel model = null)
  {
    gtk_drop_down_set_model(cast(GtkDropDown*)cPtr, model ? cast(GListModel*)(cast(ObjectG)model).cPtr(No.Dup) : null);
  }

  /**
      Sets the match mode for the search filter.
    Params:
      searchMatchMode =       the new match mode
  */
  void setSearchMatchMode(gtk.types.StringFilterMatchMode searchMatchMode)
  {
    gtk_drop_down_set_search_match_mode(cast(GtkDropDown*)cPtr, searchMatchMode);
  }

  /**
      Selects the item at the given position.
    Params:
      position =       the position of the item to select, or `GTK_INVALID_LIST_POSITION`
  */
  void setSelected(uint position)
  {
    gtk_drop_down_set_selected(cast(GtkDropDown*)cPtr, position);
  }

  /**
      Sets whether an arrow will be displayed within the widget.
    Params:
      showArrow =       whether to show an arrow within the widget
  */
  void setShowArrow(bool showArrow)
  {
    gtk_drop_down_set_show_arrow(cast(GtkDropDown*)cPtr, showArrow);
  }

  /**
      Emitted to when the drop down is activated.
    
    The `::activate` signal on [gtk.drop_down.DropDown] is an action signal and
    emitting it causes the drop down to pop up its dropdown.
  
    ## Parameters
    $(LIST
      * $(B dropDown) the instance the signal is connected to
    )
  */
  alias ActivateCallbackDlg = void delegate(gtk.drop_down.DropDown dropDown);

  /** ditto */
  alias ActivateCallbackFunc = void function(gtk.drop_down.DropDown dropDown);

  /**
    Connect to Activate signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dropDown = getVal!(gtk.drop_down.DropDown)(_paramVals);
      _dClosure.dlg(dropDown);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}
